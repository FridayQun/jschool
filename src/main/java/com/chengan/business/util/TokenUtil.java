package com.chengan.business.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSONObject;
import com.chengan.business.repo.model.JkUser;

public class TokenUtil {
	static Map<String, String> tokenMap = new HashMap<String, String>();
	static Properties pro;
	static String path;

	protected static Logger log = org.slf4j.LoggerFactory.getLogger(TokenUtil.class);
	// public static Logger LOG = LoggerFactory.getLogger(Token.class);

	static void saveTokenKey(String key, String sideWord) {
		/*
		 * tokenMap.put(key, sideWord); pro.setProperty(key, sideWord); try {
		 * pro.store(new FileOutputStream(path), "Update '" + key + "' value");
		 * } catch (IOException e) { e.printStackTrace(); }
		 */
	}

	static String getTokenKey(String key) {
		return tokenMap.get(key);
	}

	/**
	 * 根据用户信息生成TOKEN
	 * 
	 * @param UserExt
	 *            user :用户信息
	 * @return String : token
	 */
	public static Map<String, String> createToken(JkUser user, String sideWord) {
		Map<String, String> uInfo = new HashMap<String, String>();
		uInfo.put("phoneNumber", user.getPhone());
		uInfo.put("id", user.getId() + "");
		String t = Long.toString(System.currentTimeMillis());
		uInfo.put("t", t);
		Map<String, String> token = new HashMap<String, String>();
		String tokenVal = encode(uInfo, sideWord.replaceAll("\\d", ""));
		// String key = DigestUtils.md5Hex(tokenVal);
		// RedisComponent redisComponent =;
		// redisComponent.set(key, sideWord, 30*24*3600L);
		// saveTokenKey(key, sideWord);
		token.put("key", tokenVal);
		token.put("hash_code", md5(t + Conf.CODE_KEY));
		return token;
	}

	public static Boolean checkTokenHashKey(String tokenT, String hashCode) {
		if (md5(tokenT + Conf.CODE_KEY).equals(hashCode)) {
			return true;
		} else {
			return false;
		}
	}

	public static JkUser getUserByToken(String token) {
		String key = DigestUtils.md5Hex(token);
		String sideWord = getTokenKey(key);
		return getUserByToken(token, sideWord);
	}

	/**
	 * 根据TOKEN获取用户信息
	 * 
	 * @param token
	 * @return 用户信息
	 */
	public static JkUser getUserByToken(String token, String sideWord) {
		try {
			if (StringUtils.isEmpty(token) || StringUtils.isEmpty(sideWord)) {
				return null;
			}
			JSONObject jsonObj = (JSONObject) decode(token, sideWord.replaceAll("\\d", ""));
			if (jsonObj == null) {
				return null;
			}
			Long t = Long.valueOf(jsonObj.get("t").toString());

			JkUser user = new JkUser();

			user.setId(Integer.parseInt(jsonObj.get("id").toString()));
			user.setPhone(jsonObj.get("phoneNumber").toString());
			// if(t + Conf.TOKEN_LEFTTIME < System.currentTimeMillis()){
			// //TODO 过期
			// user.setIsExprie(t);;
			//// user.setTokenT(t.toString());
			// } else {
			// user.setTimeOut(false);
			// }
			user.setLoginTime(new Date(t));
			return user;
		} catch (Exception e) {

			log.error("根据TOKEN获取用户信息异常,token:" + token + ",sideWord：" + sideWord, e);
			return null;
		}
	}

	/**
	 * 加密
	 * 
	 * @param obj
	 *            加密对象
	 * @param sideWord
	 *            干扰码
	 * @return 加密串
	 */
	public static String encode(Object obj, String sideWord) {
		StringBuffer str = new StringBuffer();
		String oldStr = JSONUtils.toJSONString(obj);
		String key = md5(Conf.CODE_KEY + sideWord);
		int keyLen = key.length();
		int strLen = oldStr.length();
		for (int i = 0; i < strLen; i++) {
			int k = i % keyLen;
			str.append((char) (oldStr.charAt(i) ^ key.charAt(k)));
		}
		return base64Encode(str.toString());
	}

	/**
	 * 解密
	 * 
	 * @param oldStr
	 *            解密字符串
	 * @param sideWord
	 *            干扰码
	 * @return 解密之后的对象
	 */
	public static Object decode(String oldStr, String sideWord) {
		oldStr = base64Decode(oldStr);
		StringBuffer str = new StringBuffer();
		String key = md5(Conf.CODE_KEY + sideWord);
		int keyLen = key.length();
		int strLen = oldStr.length();
		for (int i = 0; i < strLen; i++) {
			int k = i % keyLen;
			str.append((char) (oldStr.charAt(i) ^ key.charAt(k)));
		}
		String jsonStr = str.toString();
		if (StringUtils.isEmpty(jsonStr) || jsonStr.indexOf("/*") > -1) {
			return null;
		}
		return JSONObject.parseObject(jsonStr);
	}

	/**
	 * MD5加密字符串
	 * 
	 * @param str
	 *            字符串
	 * @return 加密之后的字符串
	 */
	public static String md5(String str) {
		MessageDigest md;
		try {
			// 生成一个MD5加密计算摘要
			md = MessageDigest.getInstance("MD5");
			// 计算md5函数
			md.update(str.getBytes());
			// digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
			// BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
			String retStr = new BigInteger(1, md.digest()).toString(16);
			return retStr;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}

	/**
	 * 对字符串进行BASE64编码
	 * 
	 * @param s
	 * @return
	 */
	public static String base64Encode(String s) {
		if (s == null)
			return null;
		return Base64.encodeBase64String(s.getBytes()).replaceAll("\r\n", "").replaceAll("\n", "");
	}

	public static String base64Encode(byte[] s) {
		if (s == null)
			return null;
		return Base64.encodeBase64String(s);
	}

	/**
	 * 将 BASE64 编码的字符串 进行解码
	 * 
	 * @param s
	 * @return
	 */
	public static String base64Decode(String s) {
		if (s == null)
			return null;
		try {
			byte[] b = Base64.decodeBase64(s);
			return new String(b);
		} catch (Exception e) {
			return null;
		}
	}

	public static Map<String, Object> apiBack(String error, Object retVal) {
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("error", error);
		ret.put("result", retVal);
		return ret;
	}

	public static Map<String, Object> apiBack(String error, Object retVal, Object info) {
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("error", error);
		ret.put("result", retVal);
		ret.put("disc", info);
		return ret;
	}

	public static Map<String, Object> apiBack(String error) {
		return apiBack(error, "");
	}

	/**
	 * 加密字符串
	 * 
	 * @param oldStr
	 *            加密对象字符串
	 * @param sideWord
	 *            干扰码
	 * @return 加密串
	 */
	public static String encodeStr(String oldStr, String sideWord) {
		if (StringUtils.isEmpty(oldStr)) {
			return "";
		}
		oldStr = "{" + oldStr + "}";
		StringBuffer str = new StringBuffer();
		String key = md5(Conf.CODE_KEY + sideWord);
		int keyLen = key.length();
		int strLen = oldStr.length();
		for (int i = 0; i < strLen; i++) {
			int k = i % keyLen;
			str.append((char) (oldStr.charAt(i) ^ key.charAt(k)));
		}
		return base64Encode(str.toString());
	}

	/**
	 * 解密字符串
	 * 
	 * @param oldStr
	 *            解密字符串
	 * @param sideWord
	 *            干扰码
	 * @return 解密之后的字符串
	 */
	public static String decodeStr(String oldStr, String sideWord) {
		if (StringUtils.isEmpty(oldStr)) {
			return "";
		}
		oldStr = base64Decode(oldStr);
		StringBuffer str = new StringBuffer();
		String key = md5(Conf.CODE_KEY + sideWord);
		int keyLen = key.length();
		int strLen = oldStr.length();
		for (int i = 0; i < strLen; i++) {
			int k = i % keyLen;
			str.append((char) (oldStr.charAt(i) ^ key.charAt(k)));
		}
		String retStr = str.toString();
		if (StringUtils.isNotEmpty(retStr) && retStr.substring(0, 1).equals("{")
				&& retStr.substring(strLen - 1, strLen).equals("}")) {
			return retStr.substring(1, strLen - 1);
		} else {
			return null;
		}
	}
}
