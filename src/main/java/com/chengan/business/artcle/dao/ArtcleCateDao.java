package com.chengan.business.artcle.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkNewsCateMapper;
import com.chengan.business.repo.model.JkNewsCate;
import com.github.pagehelper.PageHelper;

@Repository
public class ArtcleCateDao extends BaseDao<JkNewsCate> {

	@Autowired
	JkNewsCateMapper jkNewsCateMapper;

	/**
	 * 根据条件查询文章列表,此处使用自定义SQL 因为列表不显示文章正文内容，为了查询高效，因此自定义SQL
	 * 
	 * @param params
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<JkNewsCate> queryTop5Recomment(Map<String, Object> params, String orderStr, Integer page, Integer pageSize) {
		return queryRecomment(params, orderStr, page, pageSize);
	}
	
	public List<JkNewsCate> queryRecomment(Map<String, Object> params, String orderStr, Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		if (orderStr != null)
			PageHelper.orderBy(orderStr);
		return jkNewsCateMapper.queryJkNewsCateList(params);
	}

}
