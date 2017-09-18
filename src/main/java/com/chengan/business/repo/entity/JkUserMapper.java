package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkUser;

public interface JkUserMapper extends IBaseMapper<JkUser> {

	/**
	 * 根据id跟新用户积分score
	 * 
	 * @param params
	 * @return
	 */
	int updatePointById(Map<String, Object> params);

	int updatefans(Map<String, Object> params);

	int updatefollows(Map<String, Object> params);

	int updatefanscancle(Map<String, Object> params);

	int updatefollowscancle(Map<String, Object> params);

	List<Map<String, Object>> getUserList(Map<String, Object> params);

	List<Map<String, Object>> tempgetuserlist(Map<String, Object> params);
	
	int updateExtraInt(Map<String, Object> params);

	List<Map<String, Object>> getUserByCommand(Map<String, Object> params);

	int updateUserTop();

	int updateUserExtra();
}
