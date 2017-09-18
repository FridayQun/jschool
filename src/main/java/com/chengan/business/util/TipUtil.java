package com.chengan.business.util;

/**
 * 提示语工具类，所有的提示语常量
 * 
 * @author y
 *
 */
public class TipUtil {
	// 1.校验码============================================================
	/**
	 * 校验码超时
	 */
	public static String vcodeExpire = "校验码超时，请重新请求";
	/**
	 * 校验码错误
	 */
	public static String vcodeWrong = "校验码出错，请重新请求";
	// 2.短信验证码============================================================
	/**
	 * 短信超限
	 */
	public static String smsTooMuch = "当天发送短信次数超过限制";
	/**
	 * 短信超频
	 */
	public static String smsTooSoon = "请求短信太频繁，请稍后再试";
	/**
	 * 第三方发送短信失败
	 */
	public static String smsSendFail = "请求发送短信失败";
	/**
	 * 短信入库失败
	 */
	public static String smsSqlFail = "短信发送过程出现异常";
	/**
	 * 三方发送短信请求过快
	 */
	public static String smsAskTooSoon = "请求发送短信频率过快";
	/**
	 * 三方发送短信请求过多
	 */
	public static String smsAskTooMuch = "请求发送短信数量超上限";
	/**
	 * 三方发送短信服务问题
	 */
	public static String smsAskError = "短信服务出现故障，请稍后";

	/**
	 * 短信验证码不存在
	 */
	public static String smsNotExists = "短信验证码输入有误，请重试";
	// 3.注册登录信息提示============================================================
	/**
	 * 用户已经存在，无法重复注册
	 */
	public static String userAlreadyExists = "手机号码已经存在，请误重复注册";

	/**
	 * 手机号码格式有误
	 */
	public static String userWrongPhoneNumber = "手机号码错误";
	/**
	 * 手机号码为空
	 */
	public static String userPhoneNumberIsEmpty = "手机号码不能为空";

	/**
	 * 手机未注册
	 */
	public static String userNotRegister = "手机号码未注册";

	/**
	 * 密码错误
	 */
	public static String userLoginError = "密码错误登录失败";
	/**
	 * 保存用户错误
	 */
	public static String userSqlIsWrong = "数据库保存用户错误";

	// 4.资讯发布=================================================================
	/**
	 * 资讯为空
	 */
	public static String artTitleIsNull = "资讯标题不能为空";
	/**
	 * 资讯描述为空
	 */
	public static String artDescIsNull = "资讯描述不能为空";
	/**
	 * 作者信息为空
	 */
	public static String artUserIsNull = "资讯作者不能为空";
	/**
	 * 文章类目为空
	 */
	public static String artCartIsNull = "资讯类目不能为空";
	/**
	 * 文章内容为空
	 */
	public static String artHtmlIsNull = "资讯内容不能为空";
	// 5.综合网络错误=================================================================
	/**
	 * 网络有问题
	 */
	public static String netWorkError = "网络有问题，稍微在请求该操作";
}
