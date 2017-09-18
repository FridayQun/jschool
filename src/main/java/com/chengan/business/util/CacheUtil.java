package com.chengan.business.util;

import java.util.HashMap;
import java.util.Map;

public class CacheUtil {

	public static Map<Object, Object> pool = new HashMap<>();

	public static void putObj2Cache(Object k, Object v) {
		pool.put(k, v);
	}

	public static Object getObjFromCache(Object k) {
		return pool.get(k);
	}

	public static Object removeObjFromCache(Object k) {
		return pool.remove(k);
	}
}
