package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkNewsCate;

public interface JkNewsCateMapper extends IBaseMapper<JkNewsCate> {
	
	List<JkNewsCate> queryJkNewsCateList(Map<String, Object> params);

	int getTotalOfNewsCateByUid(Map<String, Object> params);
}
