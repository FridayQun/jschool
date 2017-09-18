package com.chengan.business.tag.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkTagsMatchMapper;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.repo.model.JkTagsMatch;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class TagMatchDao extends BaseDao<JkTagsMatch> {

	@Autowired
	TagDao tagDao;

	@Autowired
	JkTagsMatchMapper mapper;

	/**
	 * 批量添加标签关联
	 * 
	 * @param tagIds
	 *            标签id数组
	 * @param fid
	 *            关联对象id
	 * @param type
	 *            关联对象类型 (项目/用户/头条...)
	 */
	public void saveAll(List<Integer> tagIds, Integer fid, Integer type) {
		List<JkTags> jkTagList = tagDao.selectByInIds(tagIds);
		for (JkTags jkTags : jkTagList) {
			JkTagsMatch jkTagsMatch = new JkTagsMatch();
			jkTagsMatch.setFid(fid);
			jkTagsMatch.setType(type);
			// 设置标签细节
			jkTagsMatch.setTid(jkTags.getId());
			jkTagsMatch.setTagScore(jkTags.getTagScore());
			jkTagsMatch.setTagDimension(jkTags.getTagDimension());
			this.save(jkTagsMatch);
		}
	}

	/**
	 * 根据用户id获取标签
	 * 
	 * @param uid
	 * @return
	 */
	public List<JkTagsMatch> geAllTagsByUid(Integer uid) {
		if (uid != null) {
			Example example = new Example(JkTagsMatch.class);
			Criteria criteria = example.createCriteria();
			criteria.andEqualTo("fid", uid);
			return selectByExample(example);
		}
		return null;
	}

	/**
	 * 删除
	 * 
	 * @param jkTagsMatch
	 */
	public void delTagMatchById(JkTagsMatch jkTagsMatch) {
		delete(jkTagsMatch);
	}

	/**
	 * 根据标签id列表获取项目/头条/用户..等列表
	 * 
	 * @param tagIds
	 * @param type
	 * @return
	 */
	public List<JkTagsMatch> getProjectidsByTagids(List<Integer> tagIds, Integer type) {
		if (tagIds != null) {
			Example example = new Example(JkTagsMatch.class);
			Criteria criteria = example.createCriteria();
			criteria.andIn("tid", tagIds);
			criteria.andEqualTo("type", type);
			return selectByExample(example);
		}
		return null;
	}

	public List<Integer> getUserIdByTagPid(List<Integer> tagPIds, Integer type) {
		Map<String, Object> params = new HashMap<>();
		if(tagPIds==null || type == null) {
			return null;
		}
		params.put("tagPIds", tagPIds);
		params.put("type", type);
		return mapper.getUserIdByTagPid(params);
	}

	public int deleteByFid(Integer fid, Integer type) {
		if(fid == null) return 0;
		if(type == null) return 0;
		Example example = new Example(JkTagsMatch.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("fid", fid);
		return deleteByExample(example);
	}
}
