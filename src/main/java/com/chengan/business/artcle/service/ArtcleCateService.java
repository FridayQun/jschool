package com.chengan.business.artcle.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.artcle.dao.ArtcleCateDao;
import com.chengan.business.base.BaseService;
import com.chengan.business.repo.model.JkNewsCate;

@Service
public class ArtcleCateService extends BaseService {

	@Autowired
	ArtcleCateDao artcleCateDao;

	/**
	 * 根据类型/标题获取文章列表
	 * 
	 * @param type
	 * @param cartId
	 * @param date
	 * @return
	 */
	public List<JkNewsCate> getTop5ArtcleCateList(String isRecomment,
			String orderStr, Integer page, Integer pageSize) {
		return getArtcleCateList(isRecomment, orderStr, page, pageSize);
	}

	/**
	 * 根据类型/标题获取文章列表
	 * 
	 * @param type
	 * @param cartId
	 * @param date
	 * @return
	 */
	public List<JkNewsCate> getArtcleCateList(String isRecomment,
			String orderStr, Integer page, Integer pageSize) {
		Map<String, Object> params = new HashMap<>();
		try {
			Integer.parseInt(isRecomment);
		}
		catch (NumberFormatException e) {
			isRecomment = null;
		}
		if(!StringUtils.isEmpty(isRecomment)) {
			params.put("isrecomment", Integer.parseInt(isRecomment));
		}
		if (StringUtils.isEmpty(orderStr))
			orderStr = "n.isrecomment desc";
		return artcleCateDao.queryRecomment(params, orderStr, page, pageSize);
	}
	
	public int delete(Integer id) {
		return artcleCateDao.delete(id);
	}
	
	public JkNewsCate getJkNewsCateById(Integer id) {
		if(id == null) {
			return null;
		}
		return artcleCateDao.selectByKey(id);
	}
	
	public int saveOrUpdate(JkNewsCate cate) {
		int ret = -1;
		if(cate.getId() != null) {
			ret = artcleCateDao.updateNotNull(cate);
		} else {
			ret = artcleCateDao.save(cate);
		}
		return ret;
	}
	
	public int change(JkNewsCate cate) {
		return artcleCateDao.updateNotNull(cate);
	}
}
