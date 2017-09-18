package com.chengan.business.advice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.advice.dao.AdviceDao;
import com.chengan.business.base.BaseService;
import com.chengan.business.repo.model.JKAdvice;

@Service
public class AdviceService extends BaseService {

	@Autowired
	AdviceDao adviceDao;

	public int addadvice(JKAdvice jkAdvice) {
		return adviceDao.save(jkAdvice);
	}

	public List<Map<String, Object>> getAdviceList(Integer pageSize, Integer pageNumber) {
		return adviceDao.getAdviceList(pageSize, pageNumber);
	}

}
