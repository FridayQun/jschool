package com.chengan.business.tag.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.tag.dao.TagDao;
import com.mysql.jdbc.StringUtils;

import tk.mybatis.mapper.entity.Example;

@Service
public class TagService extends BaseService {

	@Autowired
	TagDao tagDao;

	public List<JkTags> getTagsList(Integer fid, Integer type) {
		Map<String, Object> params = new HashMap<>();
		if (fid != null)
			params.put("fid", fid);
		if (type != null)
			params.put("type", type);
		return tagDao.queryTagListByCond(params);
	}

	public List<JkTags> getTagsList2(Integer type, Integer parentId) {
		Map<String, Object> params = new HashMap<>();
		if (type != null)
			params.put("tagType", type);
		if (parentId != null) {
			params.put("parentId", parentId);
		}
		return tagDao.getTagListByCond(params);
	}

	public List<JkTags> getTagsList(String tagName) {
		Map<String, Object> params = new HashMap<>();
		if (!StringUtils.isNullOrEmpty(tagName))
			params.put("tagName", tagName);
		return tagDao.queryTagListByCond(params);
	}

	public List<JkTags> getAllTagsList(Integer tagType) {
		Example example = new Example(JkTags.class);
		if (tagType != null)
			example.createCriteria().andEqualTo("tagType", tagType);
		return tagDao.selectByExample(example);
	}

	public List<JkTags> getTagsFirstListPage(Integer page, Integer pageSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		return tagDao.getTagsFirstListPage(params, page, pageSize);
	}

	public List<JkTags> getTagsSecondListPage(Integer page, Integer pageSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		return tagDao.getTagsSecondListPage(params, page, pageSize);
	}

	public int saveOrUpdate(JkTags jkTags) {
		int result = -1;
		if (jkTags.getId() != null) {
			tagDao.updateAll(jkTags);
		} else {
			tagDao.save(jkTags);
		}
		return result;
	}

	public void delete(Integer id) {
		tagDao.delete(id);
	}

	public JkTags getEntityByName(String name) {
		if (!StringUtils.isNullOrEmpty(name)) {
			Example example = new Example(JkTags.class);
			example.createCriteria().andEqualTo("tagName", name);
			List<JkTags> list = tagDao.selectByExample(example);
			return list == null || list.size()==0 ? null : list.get(0);
		} else {
			return null;
		}
	}

}
