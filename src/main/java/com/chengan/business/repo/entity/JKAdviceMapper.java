package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JKAdvice;

public interface JKAdviceMapper extends IBaseMapper<JKAdvice> {

	public List<Map<String, Object>> getAdviceList();

}
