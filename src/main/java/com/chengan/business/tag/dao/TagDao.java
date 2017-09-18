package com.chengan.business.tag.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkTagsMapper;
import com.chengan.business.repo.model.JkTags;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;

@Repository
public class TagDao extends BaseDao<JkTags> {

	@Autowired
	JkTagsMapper jkTagsMapper;

	/**
	 * 根据关联对象id,type获取标签List,
	 * 
	 * @param params
	 * @return
	 */
	public List<JkTags> queryTagListByCond(Map<String, Object> params) {
		return jkTagsMapper.queryTagsList(params);
	}
	
	/**
	 * 只有tags
	 * @param params
	 * @return
	 */
	public List<JkTags> getTagListByCond(Map<String, Object> params) {
		return jkTagsMapper.getTagsList(params);
	}

	/**
	 * 获取标签分页列表
	 * 
	 * @param params
	 * @return
	 */
	public List<JkTags> getTagsFirstListPage(Map<String, Object> params, Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		return jkTagsMapper.getTagsFirstListPage(params);
	}
	
	/**
	 * 获取标签分页列表
	 * 
	 * @param params
	 * @return
	 */
	public List<JkTags> getTagsSecondListPage(Map<String, Object> params, Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		return jkTagsMapper.getTagsSecondListPage(params);
	}

	/**
	 * 根据ids列表获取实体表
	 * 
	 * @param ids
	 * @return
	 */
	public List<JkTags> selectByInIds(List<Integer> ids) {
		List<JkTags> jkTagList = new ArrayList<JkTags>();
		Example example = new Example(JkTags.class);
		example.createCriteria().andIn("id", ids);
		if (ids != null) {
			jkTagList = selectByExample(example);
		}
		return jkTagList;
	}

}
