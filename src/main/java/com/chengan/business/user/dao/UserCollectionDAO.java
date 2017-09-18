package com.chengan.business.user.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.repo.entity.JkUserCollectionMapper;
import com.chengan.business.repo.model.JkUserCollection;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class UserCollectionDAO {
	@Autowired
	JkUserCollectionMapper jkUserCollectionMapper;

	public List<Map<String, Object>> getcollectnews(Integer uid, Integer pageSize, Integer pageNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (uid != null) {
			map.put("uid", uid);
		}
		if (pageSize != null && pageNumber != null) {
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}
		return jkUserCollectionMapper.getcollectnews(map);
	}

	public List<Map<String, Object>> getcollectproject(Integer uid, Integer pageSize, Integer pageNumber) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (pageSize != null && pageNumber != null) {
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}
		PageHelper.orderBy("create_time desc");
		if (uid != null) {
			map.put("uid", uid);
		}
		return jkUserCollectionMapper.getcollectproject(map);
	}
	
	public int getCountToday(Integer uid) {
		Example example = new Example(JkUserCollection.class);
		Criteria criteria = example.createCriteria();
		if (uid != null)
			criteria.andEqualTo("uid", uid);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		criteria.andEqualTo("extraStr", df.format(new Date()));
		return jkUserCollectionMapper.selectCountByExample(example);
	}
}
