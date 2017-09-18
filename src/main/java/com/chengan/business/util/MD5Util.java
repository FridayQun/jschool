package com.chengan.business.util;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5Util {

	public static String md5(byte[] bytes) {
		return DigestUtils.md5Hex(bytes);
	}
}
