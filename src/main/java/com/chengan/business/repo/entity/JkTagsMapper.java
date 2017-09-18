package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkTags;

public interface JkTagsMapper extends IBaseMapper<JkTags> {

	/**
	 * 查询标签列表，省字段提高查询性能
	 * 
	 * @param params
	 * @return
	 */
	List<JkTags> queryTagsList(Map<String, Object> params);
	
	/**
	 * 查询标签列表，省字段提高查询性能
	 * tags left join tags_match
	 * 
	 * @param params
	 * @return
	 */
	List<JkTags> getTagsList(Map<String, Object> params);

	/**
	 * 查询标签分页列表，省字段提高查询性能
	 * 
	 * @param params
	 * @return
	 */
	List<JkTags> getTagsFirstListPage(Map<String, Object> params);
	
	/**
	 * 查询标签分页列表，省字段提高查询性能
	 * 
	 * @param params
	 * @return
	 */
	List<JkTags> getTagsSecondListPage(Map<String, Object> params);
}