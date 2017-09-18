package com.chengan.business.project.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkProjectCateMapper;
import com.chengan.business.repo.model.JkProjectCate;

import tk.mybatis.mapper.entity.Example;

@Repository
public class ProjectCateDao extends BaseDao<JkProjectCate> {

	@Autowired
	JkProjectCateMapper jkProjectCateMapper;

	public List<JkProjectCate> queryFirstCateListByCond(Map<String, Object> params) {
		return jkProjectCateMapper.queryFirstCateList(params);
	}

	public List<JkProjectCate> querySecondCateListByCond(Map<String, Object> params) {
		return jkProjectCateMapper.querySecondCateList(params);
	}

	public List<JkProjectCate> getCateByName(String name) {
		Example example = new Example(JkProjectCate.class);
		example.createCriteria().andEqualTo("cateName", name);
		return jkProjectCateMapper.selectByExample(example);
	}

}
