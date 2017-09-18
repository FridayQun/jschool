package com.chengan.business.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.login.dao.UserDao;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.user.dao.UserInfoDao;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class UserService extends BaseService {

	@Autowired
	UserDao userDao;
	@Autowired
	UserInfoDao userInfoDao;

	public int updateUserExtra(){
		return userDao.updateUserExtra();
	}
	/**
	 * 获取用户详情
	 * 
	 * @param id
	 * @return
	 */
	public JkUser getUserById(Integer id) {
		if (id == null)
			return null;
		JkUser jkUser = userDao.selectByKey(id);

		return jkUser;
	}

	/**
	 * 获取用户详情
	 * 
	 * @param openId
	 * @return
	 */
	public JkUser getUserByOpenId(String openId) {
		if (openId == null)
			return null;
		JkUser jkUser = userDao.queryUserByOpenid(openId);
		return jkUser;
	}

	/**
	 * 获取用户详情
	 * 
	 * @param id
	 * @return jkUser,jkUserInfo
	 */
	public Map<String, Object> getUserWithInfoByUId(Integer id) {
		if (id == null)
			return null;
		// 用户基本信息
		JkUser jkUser = userDao.selectByKey(id);
		// 用户认证信息
		JkUserInfo jkUserUserInfo = userInfoDao.getUserInfoBYUid(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jkUser", jkUser);
		map.put("jkUserUserInfo", jkUserUserInfo);

		return map;
	}

	/**
	 * 获取登录用户
	 * 
	 * @param request
	 * @return
	 */
	public JkUser getUserBySession(HttpServletRequest request) {
		// 获取当前登录用户(既操作者)
		HttpSession session = request.getSession();
		Object login_userId = session.getAttribute("login_userId");
		// 如果不为null，则说明用户已登录
		JkUser user = null;
		if (login_userId != null)
			user = getUserById(Integer.valueOf(login_userId.toString()));

		return user;
	}

	public int updatefans(Integer id) {
		return userDao.updatefans(id);
	}

	public int updatefollows(Integer id) {
		return userDao.updatefollows(id);
	}

	public int updatefanscancle(Integer id) {
		return userDao.updatefanscancle(id);
	}

	public int updatefollowscancle(Integer id) {
		return userDao.updatefollowscancle(id);
	}

	public void updatenotnull(JkUser jkUser) {
		userDao.updatenotnull(jkUser);
	}

	public void update(JkUser jkUser) {
		userDao.updateAll(jkUser);
	}
	
	public int updateExtraInt() {
		return userDao.updateExtraInt();
	}

	public List<JkUser> getuserlisttop(Integer type) {
		return userDao.getuserlisttop(type);
	}

	public List<Map<String, Object>> getTopUser(Integer number) {
		return userDao.getUserByCommand(1, 1, 3);
	}

	public List<JkUser> findUserByName(String nickname) {
		return userDao.findUserByName(nickname);
	}
}
