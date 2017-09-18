package com.chengan.business.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkProjectMapper;
import com.chengan.business.repo.model.JkProject;
import com.github.pagehelper.PageHelper;

@Repository
public class ProjectDao extends BaseDao<JkProject> {

	@Autowired
	JkProjectMapper jkProjectMapper;

	public List<Map<String, Object>> queryProjectListByCond(Map<String, Object> params, String orderStr, Integer page,
			Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		if (orderStr != null)
			PageHelper.orderBy(orderStr);
		return jkProjectMapper.queryProjectList(params);
	}

	public List<String> queryLocationList() {
		return jkProjectMapper.queryLocationList();
	}

	public List<Map<String, String>> queryProjectListMapByCond(Map<String, Object> params, Integer page,
			Integer pageSize) {

		return jkProjectMapper.queryProjectListMap(params);
	}
	
	public List<Map<String, String>> getRecomment(int type, int limit) {
		Map<String, Integer> m = new HashMap<>();
		m.put("type", type);
		m.put("limit", limit);
		List<Map<String, String>> res = jkProjectMapper.getRecomment(m);
		return res;
	}

	public int getTotalOfprojectbyUid(Map<String, Object> params) {
		return jkProjectMapper.getTotalOfProjectByUid(params);
	}

	public List<Map<String, Object>> getProjectListByFirstCateAndCond(Map<String, Object> params, String orderStr,
			Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		if (orderStr != null && !orderStr.equals(""))
			PageHelper.orderBy(orderStr);
		return jkProjectMapper.getProjectListByFirstCateAndCond(params);
	}

	public List<Map<String, Object>> getProjectListByType(Map<String, Object> params) {
		return jkProjectMapper.getProjectListByType(params);
	}

	public Integer updateBrowsevolume(Map<String, Object> params) {
		return jkProjectMapper.updateBrowsevolume(params);
	}

	public Integer updateApplyCount(Map<String, Object> params) {
		return jkProjectMapper.updateApplyCount(params);
	}

	public int updateProject(JkProject jkProject) {
		return updateNotNull(jkProject);
	}

	//获得了所有这个时间
	public List<Integer> getTimeList(){
		return jkProjectMapper.getTotalProjectByTime();
	}

	//更新项目置顶
	public int updateProjectTop(){
		return jkProjectMapper.updateProjectTop();
	}
}
