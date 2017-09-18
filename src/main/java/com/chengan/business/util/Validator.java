package com.chengan.business.util;

import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.codec.digest.DigestUtils;

public class Validator {

	static String str = "0123456789";

	/**
	 * 验证手机号码
	 * 
	 * @param phone
	 * @return
	 */
	public static String checkPhone(String phone) {
		if (phone == null || phone.equals(""))
			return TipUtil.userPhoneNumberIsEmpty;
		Pattern p = Pattern.compile("^((1[0-9]))\\d{9}$");
		Matcher m = p.matcher(phone);
		if (m.matches())
			return null;
		else
			return TipUtil.userWrongPhoneNumber;
	}

	/**
	 * 获取发送验证码时的HASH码
	 * 
	 * @param phone
	 * @return
	 */
	public static String getSMSHashCode(String phone) {
		String str = phone + new Date().getTime() + phone.hashCode();
		return DigestUtils.md5Hex(str);
	}

	/**
	 * 获取验证码
	 * 
	 * @return
	 */
	public static String getYzcode() {
		StringBuilder sb = new StringBuilder(4);
		for (int i = 0; i < 4; i++) {
			char ch = str.charAt(new Random().nextInt(str.length()));
			sb.append(ch);
		}
		return sb.toString();
	}

	/**
	 * 获取今天日期
	 * 
	 * @return
	 */
	public static Date getToday() {
		Calendar c = Calendar.getInstance();
		// c.clear(Calendar.HOUR_OF_DAY);
		c.set(Calendar.HOUR_OF_DAY, 0);
		// c.clear(Calendar.HOUR);
		c.clear(Calendar.MINUTE);
		c.clear(Calendar.SECOND);
		c.clear(Calendar.MILLISECOND);
		return c.getTime();
	}

	public static Date getDayOffsetToday(int days) {
		Date date = getToday();
		date.setTime(date.getTime() + days * 86400 * 1000);
		return date;
	}
}
