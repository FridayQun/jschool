package com.chengan.business.login.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.login.dao.UserDao;
import com.chengan.business.login.dao.wxUserDao;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkWXUser;
import com.chengan.business.util.Constant;
import com.chengan.business.util.HttpUtil;
import com.chengan.business.util.MD5Util;
import com.chengan.business.util.TipUtil;
import com.chengan.business.util.Validator;

@Service
public class LoginService extends BaseService {

	@Autowired
	UserDao userDao;
	@Autowired
	wxUserDao wxDao;

	/**
	 * 查询用户是否不存在 若返回NULL，则用户不存在
	 * 
	 * @param phone
	 * @return
	 */
	public ServiceResult<JkUser> isUserNotExistsByPhone(String phone) {
		// 1.验证手机号码
		String res = Validator.checkPhone(phone);
		if (res != null)
			return generateResult(COMMONFAIL, res, null);
		// 2.根据手机号码查找用户
		JkUser user = userDao.findUserByPhone(phone);
		if (user == null)
			return generateResult(SUCCESS, "", user);
		return generateResult(COMMONFAIL, TipUtil.userAlreadyExists, user);
	}

	/**
	 * 查询用户是否不存在 若返回NULL，则用户存在
	 * 
	 * @param phone
	 * @return
	 */
	public ServiceResult<JkUser> isUserExistsByPhone(String phone) {
		// 1.验证手机号码
		String res = Validator.checkPhone(phone);
		if (res != null)
			return generateResult(COMMONFAIL, res, null);
		// 2.根据手机号码查找用户
		JkUser user = userDao.findUserByPhone(phone);
		if (user != null)
			return generateResult(user);
		return generateResult(COMMONFAIL, TipUtil.userNotRegister, user);
	}

	/**
	 * 保存用户信息
	 * 
	 * @param phone
	 * @param password
	 * @param deviceCode
	 * @param inviteCode
	 * @return
	 */
	public ServiceResult<JkUser> createUser(String phone, String password, String deviceCode, String inviteCode) {
		JkUser user;
		try {
			user = new JkUser();
			user.setCreateTime(new Date());
			user.setDeviceCode(MD5Util.md5(deviceCode.getBytes()));
			user.setPhone(phone);
			user.setUsername(phone);
			user.setNickname(phone.substring(0, 5) + "***");
			user.setPassword(MD5Util.md5(password.getBytes()));
			user.setFollows(0);
			user.setFans(0);
			Date date = new Date();
			user.setLoginTime(new Date());
			user.setCreateTime(date);
			user.setUpdateTime(date);
			user.setLoginTime(date);
			user.setUserLevel(1);
			user.setPoint(0);
			user.setIstop(0);
			user.setInfluence(0);
			user.setLoginTimes(1);
			user.setHeadPicPath(Constant.NORMAL_HEAD_ICON_URL);
			userDao.save(user);
			user = userDao.findUserByPhone(phone);
			return generateResult(user);
		} catch (Exception e) {
			logger.warn(e + "");
			// 数据库异常
			return generateResult(DBFAIL, TipUtil.userNotRegister, null);
		}
	}

	/**
	 * 根据手机号码登录
	 * 
	 * @param phone
	 * @param password
	 * @return
	 */
	public ServiceResult<JkUser> loginUser(String phone, String password, String deviceCode) {
		// 1.登录用户
		JkUser user = userDao.loginUserByPhone(phone, MD5Util.md5(password.getBytes()));
		if (user == null) {
			// 1.1查找手机号码是否存在
			user = userDao.findUserByPhone(phone);
			if (user == null) {
				return generateResult(COMMONFAIL, TipUtil.userNotRegister, user);
				// 1.2若用户存在则设置用户ID为NULL，表示登录失败
			} else {
				return generateResult(COMMONFAIL, TipUtil.userLoginError, user);
			}
		}
		// 3.设置用户连续登录天数
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentdate = sdf.format(date);
		Date logintime = user.getLoginTime();
		String logindate = sdf.format(logintime);
		Date parlogindate = null;
		Date parcurrentdate = null;
		try {
			parlogindate = sdf.parse(logindate);
			parcurrentdate = sdf.parse(currentdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long diff = parcurrentdate.getTime() - parlogindate.getTime();
		long days = diff / (1000 * 60 * 60 * 24);
		if (days == 1) {
			// 表示连续登录
			user.setLoginTimes(user.getLoginTimes() + 1);
		} else if (days > 1) {
			// 表示中间有没登录过，连续登录中断 重置为1
			user.setLoginTimes(1);
		} else if (days == 0) {
			// 表示一天内登录好多次
		}
		// 2.登录成功修改用户登录时间
		user.setLoginTime(new Date());
		user.setDeviceCode(MD5Util.md5(deviceCode.getBytes()));

		userDao.updateNotNull(user);
		return generateResult(user);
	}

	/**
	 * 忘记密码
	 * 
	 * @param phone
	 * @param password
	 * @param deviceCode
	 * @return
	 */
	public ServiceResult<JkUser> resetPwd(String phone, String password, String deviceCode) {
		// 1.查找用户
		JkUser user;
		try {
			user = userDao.findUserByPhone(phone);
			Date date = new Date();
			// 2.修改更新时间和登录时间
			user.setUpdateTime(date);
			user.setLoginTime(date);
			// 3.更新密码
			user.setPassword(MD5Util.md5(password.getBytes()));
			user.setDeviceCode(MD5Util.md5(deviceCode.getBytes()));
			userDao.updateNotNull(user);
			return generateResult(user);
		} catch (Exception e) {
			logger.warn(e + "");
			// 数据库异常
			return generateResult(DBFAIL, TipUtil.userNotRegister, null);
		}
	}

	/**
	 * 获取管理员
	 * 
	 * @return
	 */
	public ServiceResult<JkUser> getAdmin() {
		try {
			JkUser user = userDao.findUserByPhone("admin");
			if (user == null)
				return generateResult(COMMONFAIL, TipUtil.userNotRegister, null);
			return generateResult(user);
		} catch (Exception e) {
			logger.warn(e + "");
			// 数据库异常
			return generateResult(DBFAIL, TipUtil.userNotRegister, null);
		}
	}

	/**
	 * 发送请求到微信服务器，请求access_token
	 */
	public String sendGetToken(String code) {
		Map<String, Object> params = new HashMap<>();
		final String appid = "wxe04b5cbb1afdca93";

		final String secret = "e2f80332024f1d91b1a3c41bca3db344";
		String resultAcess = HttpUtil.doGet("https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appid
				+ "&secret=" + secret + "&code=" + code + "&grant_type=authorization_code", params);
		return resultAcess;

	}

	/**
	 * 发送请求到微信服务器，请求openid
	 * 
	 * @param accessToken
	 * @param openid
	 * @return
	 */
	public String doGetOpenid(String accessToken, String openid) {
		Map<String, Object> params = new HashMap<>();
		String resultOpenid = HttpUtil.doGet("https://api.weixin.qq.com/sns/userinfo?access_token=" + accessToken
				+ "&openid=" + openid + "&lang=zh_CN", params);
		return resultOpenid;
	}

	/**
	 * 根据openid查询user表
	 * 
	 * @param wxopenid
	 * @return
	 */
	public JkUser selectUser(String wxopenid) {
		JkUser user = null;
		if (StringUtils.isNotEmpty(wxopenid)) {
			user = userDao.queryUserByOpenid(wxopenid);
		}
		return user;
	}

	/**
	 * 根据wxopenid查询微信表
	 * 
	 * @param wxopenid
	 * @return
	 */
	public JkWXUser selectWXUser(String wxopenid) {
		JkWXUser user = null;
		if (StringUtils.isNotEmpty(wxopenid)) {
			user = wxDao.queryUserByOpenid(wxopenid);
		}
		return user;
	}

	/**
	 * 创建微信用户
	 * 
	 * @param wxopenid
	 * @param wxNickName
	 * @param wxSex
	 * @param wxHeadPicPath
	 * @param wxlocation
	 * @return
	 */
	public JkWXUser creatWXUser(String wxNickName, String wxopenid, Integer wxSex, String wxHeadPicPath,
			String wxlocation) {
		JkWXUser user = new JkWXUser();
		user.setHeadPicPath(wxHeadPicPath);
		user.setLocation(wxlocation);
		user.setOpenid(wxopenid);
		user.setWXnickName(wxNickName);
		user.setSex(wxSex);
		wxDao.save(user);
		JkWXUser wxuser = wxDao.queryUserByOpenid(wxopenid);
		return wxuser;
	}
}
