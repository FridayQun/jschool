package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkProjectCate;

public interface JkProjectCateMapper extends IBaseMapper<JkProjectCate> {

	/**
	 * 查询一级项目类目列表，省字段提高查询性能
	 * 
	 * @param params
	 * @return
	 */
	List<JkProjectCate> queryFirstCateList(Map<String, Object> params);

	/**
	 * 查询二级项目类目列表，省字段提高查询性能
	 * 
	 * @param params（parentId）
	 * @return
	 */
	List<JkProjectCate> querySecondCateList(Map<String, Object> params);
}