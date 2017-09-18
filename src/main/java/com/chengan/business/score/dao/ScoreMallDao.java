package com.chengan.business.score.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.model.JkScoreMall;
import com.github.pagehelper.PageHelper;
import com.mysql.jdbc.StringUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class ScoreMallDao extends BaseDao<JkScoreMall> {

	public List<JkScoreMall> getMallListPage(String productName, Integer page, Integer pageSize) {
		Example ex = new Example(JkScoreMall.class);
		Criteria criteria = ex.createCriteria();
		if (!StringUtils.isNullOrEmpty(productName))
			criteria.andLike("productName", "%" + productName + "%");
		if (page != null && pageSize != null) {
			PageHelper.startPage(page, pageSize, true, false);
		}
		return selectByExample(ex);
	}

}
