package com.chengan.business.base;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.chengan.business.repo.model.JkUser;
import com.chengan.business.util.Conf;
import com.chengan.business.util.TokenUtil;

public abstract class BaseController {

	public Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 返回结果
	 * 
	 * @return
	 */
	public Map<Object, Object> getResult() {
		return getResult(true, "");
	}

	/**
	 * 装载结果返回
	 * 
	 * @param k
	 * @param v
	 * @return
	 */
	public Map<Object, Object> getResult(Object k, Object v) {
		Map<Object, Object> obj = getResult();
		obj.put(k, v);
		return obj;
	}

	/**
	 * 设置返回结果
	 * 
	 * @param result
	 * @return
	 */
	public Map<Object, Object> getResult(boolean result) {
		return getResult(result, "");
	}

	/**
	 * 设置返回结果和返回消息
	 * 
	 * @param result
	 * @param errorMesg
	 * @return
	 */
	public Map<Object, Object> getResult(boolean result, String errorMesg) {
		Map<Object, Object> map = new HashMap<>();
		if (result) {
			map.put("error", "0");
			map.put("error_mesg", "");
		} else {
			map.put("error", "1");
			map.put("error_mesg", errorMesg);
		}
		return map;
	}

	/**
	 * 根据token获取user
	 * 
	 * @param request
	 * @return
	 */
	public JkUser getUser(HttpServletRequest request) {
		String token = request.getHeader("token");
		String userAgent = request.getHeader("User-Agent");
		JkUser user = TokenUtil.getUserByToken(token, userAgent);
		return user;
	}

	/**
	 * 查看用户是否登录过期
	 * 
	 * @param user
	 * @return
	 */
	public boolean isUserExprie(JkUser user) {
		return System.currentTimeMillis() - user.getLoginTime().getTime() > Conf.TOKEN_LEFTTIME;
	}

	/**
	 * token超时
	 * 
	 * @return
	 */
	public Map<Object, Object> tokenTimeOut() {
		return getResult(false, "token_timeout");
	}

	/**
	 * token非法
	 * 
	 * @return
	 */
	public Map<Object, Object> tokenIllegal() {
		return getResult(false, "token_illegal");
	}

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}
}
