package com.chengan.business.util;

public class Conf {
	/**
	 * 手机验证码生命周期（单位：分钟）
	 */
	public static int PHONE_AUTHCODE_LEFTTIME = 30;

	public static String EVENT_SUCCESS = "EVENT_SUCCESS";
	public static String EVENT_FAIL = "EVENT_FAIL";
	// /**
	// * SMS服务商-url
	// */
	// public static final String SMS_SERVICE_URL =
	// "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	// /**
	// * SMS服务商-账号
	// */
	// public static final String SMS_SERVICE_ACCOUNT = "cf_fuer";
	// /**
	// * SMS服务商-密码
	// */
	// public static final String SMS_SERVICE_PASSWORD = "anbVtW";
	/**
	 * SMS服务商-url
	 */
	public static String SMS_SERVICE_URL = "https://api.netease.im/sms/sendcode.action";
	/**
	 * SMS服务商-账号
	 */
	public static String SMS_SERVICE_ACCOUNT = "WEWL";
	/**
	 * SMS服务商-账号
	 */
	public static String SMS_SERVICE_ACCOUNTID = "1687";
	/**
	 * SMS服务商-密码
	 */
	public static String SMS_SERVICE_PASSWORD = "741852";
	/**
	 * 加密干扰串
	 */
	public static String CODE_KEY = "fuer";
	/**
	 * TOKEN的生命周期(单位：毫秒)
	 */
	public static Long TOKEN_LEFTTIME = 2 * 3600000L;

	public static String BASE_DIR = System.getProperty("user.dir") + "/";

	public static String UPLOAD_DIR = BASE_DIR + "src/main/webapp/upload/";

	public static String SMSSUFFIX = "【誉唐科技】";

	public static String SMSPREFIX = "您收到的验证码是：";

	/**
	 * 每天最多10条短信
	 */
	public static Integer SMSPERDAY = 10;
	/**
	 * 至少间隔1分钟才能继续发送短信
	 */
	public static Long SMSFREQ = 1 * 60 * 1000L;
	/**
	 * 短信验证码模板ID
	 */
	public static Integer SMSTEMPID = 3061032;
	/**
	 * 短信发送成功
	 */
	public static Integer SMSSUCCESS = 200;

	/**
	 * 第三方接口短信超频
	 */
	public static Integer SMSASKFREQ = 416;
	/**
	 * 第三方接口短信超频
	 */
	public static Integer SMSOVERTOTAL = 419;

}
