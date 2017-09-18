package com.chengan.business.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class URLUtil {
	private String url;
	private Map<String, String> params;
	private String hash;
	public URLUtil(String url) {
		this.url = url;
		params = new HashMap<>();
		if(url.indexOf('?') > -1) {
			this.url = url.substring(0, url.indexOf('?'));
			int length = url.length();
			if(url.indexOf('#') > -1) {
				length = url.indexOf('#');
				hash = url.substring(length);
			}
			url = url.substring(url.indexOf('?')+1, length);
			String[] ps = url.split("&");
			for(String s : ps) {
				String sa[] = s.split("=");
				params.put(sa[0], sa[1]);
			}
		}
	}
	public URLUtil addParam(String key, String value) {
		params.put(key, value);
		return this;
	}
	public String encodeParams() throws UnsupportedEncodingException {
		StringBuilder sb = new StringBuilder();
		sb.append(url);
		if(params.keySet().size() != 0) {
			sb.append("?");
		}
		for(String key : params.keySet()) {
			sb.append(key);
			sb.append("=");
			sb.append(URLEncoder.encode(params.get(key), "utf-8"));
			sb.append("&");
		}
		if(params.keySet().size() != 0) {
			sb.deleteCharAt(sb.length()-1);
		}
		if(hash != null) {
			sb.append(hash);
		}
		return sb.toString();
	}
}
