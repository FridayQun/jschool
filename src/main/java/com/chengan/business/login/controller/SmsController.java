package com.chengan.business.login.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.base.BaseService.ServiceResult;
import com.chengan.business.cache.CacheManager;
import com.chengan.business.login.service.SmsAlidayuService;
import com.chengan.business.login.service.SmsService;
import com.chengan.business.repo.model.JkSysSms;
import com.chengan.business.util.TipUtil;
import com.chengan.business.util.ValidateCode;
import com.chengan.business.util.Validator;

@Controller
@RequestMapping("/sms")
public class SmsController extends BaseController {

	@Autowired
	CacheManager cacheManager;
	@Autowired
	SmsAlidayuService smsService;

	/**
	 * 获取图片验证码
	 * 
	 * @param phone
	 *            手机号码
	 * @param type
	 *            APP类型
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "gethashpic", method = RequestMethod.GET)
	public void getHashCodePic(String phone, @RequestParam(required = false) Integer type, HttpServletResponse response,
			HttpSession session) {
		// 1. 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 2.禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		// 3.生成验证码图片
		ValidateCode vCode = new ValidateCode(120, 40, 5, 100);
		String code = vCode.getCode();
		// 4.将验证码放入缓存
		cacheManager.saveStr("vcode" + phone, code, 1);
		// 5.将验证码图片写回输出流
		try {
			vCode.write(response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return;
	}

	/**
	 * 
	 * @param phone
	 * @param type
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "gethash", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getHash(String phone, @RequestParam(required = false) Integer cType,
			HttpServletResponse response, HttpSession session) {
		// 1.生成验证码
		ValidateCode vCode = new ValidateCode(120, 40, 5, 100);
		String code = vCode.getCode();
		// 2.将验证码放入缓存
		cacheManager.saveStr("vcode" + phone, code, 1);
		// 3.返回验证码
		return getResult("vcode", code);
	}

	/**
	 * 获取短信验证码
	 * 
	 * @param phone
	 *            手机号码
	 * @param vcode
	 *            校验码
	 * @param type
	 *            验证类型
	 * @param cType
	 *            客户端类型，选填
	 * @return
	 */
	@RequestMapping(value = "getsms", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getSmsCode(String phone, String vcode, Integer type,
			@RequestParam(required = false) Integer cType) {
		// 1.判断手机号码是否合法
		String res = Validator.checkPhone(phone);
		if (res != null)
			return getResult(false, res);
		// 2.判断校验码是否合法
		String code = cacheManager.getStr("vcode" + phone);
		if (code == null) {
			// 校验码超时
			return getResult(false, TipUtil.vcodeExpire);
		} else if (!code.equals(vcode)) {
			// 校验码错误
			return getResult(false, TipUtil.vcodeWrong);
		}
		// 3.判断发送短信是否合法
		ServiceResult<List<JkSysSms>> resListSms = smsService.answerSmsRequest(phone);
		if (resListSms.getResultCode() != SmsService.SUCCESS)// 不为null，表示请求不合法
			return getResult(false, resListSms.getResultStr());

		// 4.发送验证码
		ServiceResult<JkSysSms> resSms = smsService.sendYzcode(phone, type);
		if (resSms.getResultCode() != SmsService.SUCCESS)// 不为null，表示请求有错误信息
			return getResult(false, resSms.getResultStr());

		return getResult("sid", resSms.getT().getSid());
	}

}
