package com.chengan.business.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.login.dao.UserDao;
import com.chengan.business.login.dao.wxUserDao;
import com.chengan.business.repo.model.JkWXUser;

@Service
public class WxUserService {

	@Autowired
	UserDao userDao;
	@Autowired
	wxUserDao wxUserDao;

	/**
	 * 获取用户详情
	 * 
	 * @param id
	 * @return
	 */
	public JkWXUser getByPhone(String phone) {
		if (phone == null)
			return null;
		JkWXUser jkWxUser = wxUserDao.findUserByPhone(phone);

		return jkWxUser;
	}

	public JkWXUser getByOpenid(String wxopenid) {
		if (wxopenid == null)
			return null;
		JkWXUser jkWxUser = wxUserDao.queryUserByOpenid(wxopenid);

		return jkWxUser;
	}

	public int update(JkWXUser jkWXUser) {
		int result = -1;
		result = wxUserDao.updateAll(jkWXUser);
		return result;
	}

}
