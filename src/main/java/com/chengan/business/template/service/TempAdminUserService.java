package com.chengan.business.template.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.repo.model.JKAdminUser;
import com.chengan.business.template.dao.TempAdminUserDao;

@Service
public class TempAdminUserService {
	@Autowired
	TempAdminUserDao tempadminUserDao;

	public List<JKAdminUser> getAdminUserList(Integer phone, Integer pageNumber, Integer pageSize, String loginname,
			Integer id) {
		return tempadminUserDao.getAdminUserList(phone, pageNumber, pageSize, loginname, id);
	}

	public JKAdminUser getLoginUser(String loginname, String password) {
		return tempadminUserDao.getLoginAdminUserList(loginname, password);
	}

	public int addAdminUser(JKAdminUser jkAdminUser) {
		if (jkAdminUser != null) {
			jkAdminUser.setCreattime(new Date());
		}
		if (jkAdminUser.getId() != null) {
			return tempadminUserDao.modAdminUser(jkAdminUser);

		} else {

			return tempadminUserDao.addAdminUser(jkAdminUser);
		}
	}

	public int delAdminUser(JKAdminUser jkAdminUser) {
		return tempadminUserDao.delAdminUser(jkAdminUser);
	}
}
