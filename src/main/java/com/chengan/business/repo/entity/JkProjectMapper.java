package com.chengan.business.repo.entity;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkProject;

public interface JkProjectMapper extends IBaseMapper<JkProject> {

	/**
	 * 查询项目列表，省字段提高查询性能
	 * 
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> queryProjectList(Map<String, Object> params);

	/**
	 * 查询项目列表，省字段提高查询性能
	 * 
	 * @param params
	 * @return map
	 */
	List<Map<String, String>> queryProjectListMap(Map<String, Object> params);
	
	List<Map<String, String>> getRecomment(Map<String, Integer> type);

	/**
	 * 根据一级类目获取项目
	 * 
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> getProjectListByFirstCateAndCond(Map<String, Object> params);

	/**
	 * 根据类型获取项目
	 * 
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> getProjectListByType(Map<String, Object> params);

	/**
	 * 获取项目location
	 * 
	 * @return
	 */
	List<String> queryLocationList();

	/**
	 * 设置项目浏览量（自增一个）
	 * 
	 * @return
	 */
	int updateBrowsevolume(Map<String, Object> params);

	/**
	 * 设置项目申请数（自增一个）
	 * 
	 * @return
	 */
	int updateApplyCount(Map<String, Object> params);

	/**
	 * 设置项目置顶定时减1
	 * @return
	 */
	int updateProjectTop();

	/**
	 * 查询用户的所有项目数量
	 * 
	 * @param params
	 * @return
	 */
	int getTotalOfProjectByUid(Map<String, Object> params);

	List<Integer> getTotalProjectByTime();

}