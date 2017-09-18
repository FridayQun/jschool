package com.chengan.business.advice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JKAdviceMapper;
import com.chengan.business.repo.model.JKAdvice;
import com.github.pagehelper.PageHelper;

@Repository
public class AdviceDao extends BaseDao<JKAdvice> {

	@Autowired
	JKAdviceMapper jkAdviceMapper;

	public List<Map<String, Object>> getAdviceList(Integer pageSize, Integer pageNumber) {
		if (pageNumber != null && pageSize != null) {
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}

		return jkAdviceMapper.getAdviceList();
	}

}
