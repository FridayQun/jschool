package com.chengan.business.artcle.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkNewsMapper;
import com.chengan.business.repo.model.JkNews;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class ArtcleDao extends BaseDao<JkNews> {

	@Autowired
	JkNewsMapper jkNewsMapper;

	/**
	 * 根据条件查询文章列表,此处使用自定义SQL 因为列表不显示文章正文内容，为了查询高效，因此自定义SQL
	 * 
	 * @param params
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<JkNews> queryArtcleListByCond(Map<String, Object> params, String orderStr, Integer page,
			Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		if (orderStr != null)
			PageHelper.orderBy(orderStr);
		return jkNewsMapper.queryJkNewsList(params);
	}
	
	public int getCountToday(Integer uid) {
		Example example = new Example(JkNews.class);
		Criteria criteria = example.createCriteria();
		if(uid != null)
			criteria.andEqualTo("uid", uid);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		df.setTimeZone(TimeZone.getTimeZone("UTC"));
		criteria.andGreaterThanOrEqualTo("createTime", df.format(((new Date().getTime()+1000*3600*8)/1000/3600/24)*24*3600*1000));
		criteria.andLessThan("createTime", df.format(((new Date().getTime()+1000*3600*8)/1000/3600/24+1)*24*3600*1000));
		return jkNewsMapper.selectCountByExample(example);
	}
	
	public List<Map<String,Object>> queryArtcleListByCondWithCate(Map<String, Object> params, String orderStr, Integer page,
			Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		if (orderStr != null)
			PageHelper.orderBy(orderStr);
		return jkNewsMapper.queryJkNewsListWithCate(params);
	}

	/**
	 * 
	 * 获取用户的头条数量
	 * 
	 * @param params
	 * @return
	 */
	public int getTotalOfNewsByUid(Map<String, Object> params) {
		return jkNewsMapper.getTotalOfNewsByUid(params);
	}

	/**
	 * 头条浏览数自增1
	 * 
	 * @param params
	 * @return
	 */
	public Integer updateBrowsevolume(Map<String, Object> params) {
		return jkNewsMapper.updateBrowsevolume(params);
	}

}
