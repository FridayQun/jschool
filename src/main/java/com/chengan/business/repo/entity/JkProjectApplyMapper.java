package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkProjectApply;

public interface JkProjectApplyMapper extends IBaseMapper<JkProjectApply> {

	List<Map<String, String>> getProjectByApUid(Map<String, Object> params);

	Integer selectcountbyuid(int uid);
	
	List<Map<String, Object>> queryProjectApplyListDetail(Map<String, Object> params);
}