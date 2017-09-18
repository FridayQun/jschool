package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkTagsMatch;

public interface JkTagsMatchMapper extends IBaseMapper<JkTagsMatch> {
	List<Integer> getUserIdByTagPid(Map<String, Object> params);
}