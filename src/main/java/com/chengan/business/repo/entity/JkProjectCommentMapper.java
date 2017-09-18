package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkProjectComment;

public interface JkProjectCommentMapper extends IBaseMapper<JkProjectComment> {
	List<Map<Object, Object>> getComments(Map<String, Object> params);
}
