package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkNews;

public interface JkNewsMapper extends IBaseMapper<JkNews> {
	/**
	 * 查询文章列表，省字段提高查询性能
	 * 
	 * @param params
	 * @return
	 */
	List<JkNews> queryJkNewsList(Map<String, Object> params);
	
	List<Map<String, Object>> queryJkNewsListWithCate(Map<String, Object> params);

	/**
	 * 设置头条浏览量（自增一个）
	 * 
	 * @return
	 */
	int updateBrowsevolume(Map<String, Object> params);

	int getTotalOfNewsByUid(Map<String, Object> params);

}