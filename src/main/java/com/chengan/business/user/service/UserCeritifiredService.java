package com.chengan.business.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.login.dao.UserDao;
import com.chengan.business.login.service.UserService;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserCeritifired;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.user.dao.UserCeritifiredDao;
import com.chengan.business.user.dao.UserInfoDao;

@Service
public class UserCeritifiredService extends BaseService {

	@Autowired
	UserCeritifiredDao userCeritifiredDao;

	@Autowired
	UserDao userDao;

	@Autowired
	UserInfoDao userInfoDao;

	public int addUserCeritifired(JkUserCeritifired jkUserCeritifired) {
		jkUserCeritifired.setState(0);
		int result = userCeritifiredDao.addJkUserCeritifired(jkUserCeritifired);
		return result;
	}

	public int modUserCeritifired(JkUserCeritifired jkUserCeritifired) {
		int result = userCeritifiredDao.modJkUserCeritifired(jkUserCeritifired);
		return result;
	}

	public JkUserCeritifired ischecked(Integer uid, Integer state) {
		return userCeritifiredDao.ischecked(uid, state);
	}

	public List<JkUserCeritifired> authlist(Integer uid, Integer pageNum, Integer pageSize) {
		return userCeritifiredDao.authlist(uid, pageNum, pageSize);
	}

	public JkUserCeritifired getoneuserceritifired(int id) {
		return userCeritifiredDao.getoneUserCeritifired(id);
	}

	public void cancle(int cid, int uid) {
		JkUserCeritifired jkUserCeritifired = new JkUserCeritifired();
		jkUserCeritifired.setState(2);
		jkUserCeritifired.setId(cid);
		userCeritifiredDao.updateNotNull(jkUserCeritifired);
		JkUser jkUser = userDao.selectByKey(uid);
		jkUser.setUserLevel(1);
		jkUser.setIdType(null);
		jkUser.setIdCard(null);
		userDao.updateAll(jkUser);
		JkUserInfo jkUserInfo = userInfoDao.getUserInfoBYUid(uid);
		jkUserInfo.setRealname(null);
		jkUserInfo.setContractQq(null);
		jkUserInfo.setContractMail(null);
		jkUserInfo.setContractWeixin(null);
		jkUserInfo.setContractWeibo(null);
		jkUserInfo.setCompanyName(null);
		jkUserInfo.setDepartName(null);
		jkUserInfo.setTitle(null);
		jkUserInfo.setLocation(null);
		jkUserInfo.setEduType(null);
		jkUserInfo.setEduCollage(null);
		jkUserInfo.setEduName(null);
		jkUserInfo.setEduClub(null);
		jkUserInfo.setEduMajor(null);
		userInfoDao.updateAll(jkUserInfo);

	}

}
