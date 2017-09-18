package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkUserCollection;

public interface JkUserCollectionMapper extends IBaseMapper<JkUserCollection> {

	public List<Map<String, Object>> getcollectproject(Map<String, Object> map);

	public List<Map<String, Object>> getcollectnews(Map<String, Object> map);
}