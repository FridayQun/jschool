package com.chengan.business.operate.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.artcle.dao.ArtcleDao;
import com.chengan.business.login.dao.UserDao;
import com.chengan.business.project.dao.ProjectDao;
import com.chengan.business.repo.entity.JkUserMapper;
import com.chengan.business.repo.model.JkNews;
import com.chengan.business.repo.model.JkProject;
import com.chengan.business.repo.model.JkUser;

@Service
public class OperateService {

	@Autowired
	JkUserMapper jkUserMapper;
	@Autowired
	UserDao userDao;
	@Autowired
	ArtcleDao artcleDao;
	@Autowired
	ProjectDao projectDao;

	/**
	 * 给用户设置积分d
	 * 
	 * @param uid
	 * @param point
	 * @return
	 */
	public int setUserPoint(int uid, int point) {
		int result = 0;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", uid);
		params.put(".point", point);
		result = jkUserMapper.updatePointById(params);
		return result;
	}

	/**
	 * 根据对象id和类型获取对象（主要是用户/头条/积分）
	 * 
	 * @param id
	 * @param type
	 * @return
	 */
	public Object getEntityByIdAndType(Integer id, Integer type) {
		// 用户
		if (type == 0) {
			JkUser user = userDao.selectByKey(id);
			return user;
		}
		// 头条
		else if (type == 1) {
			JkNews news = artcleDao.selectByKey(id);
			return news;
		}
		// 项目
		else if (type == 2) {
			JkProject project = projectDao.selectByKey(id);
			return project;
		}
		// 其他，错误误
		else {
			return null;
		}
	}
}
