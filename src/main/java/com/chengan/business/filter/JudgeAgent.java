package com.chengan.business.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 * Servlet Filter implementation class JudgeAgent
 */
public class JudgeAgent implements Filter {
	private static final String[] mobileAgents = { "iphone", "android", "ipad", "phone", "mobile", "wap", "netfront",
			"java", "opera mobi", "opera mini", "ucweb", "windows ce", "symbian", "series", "webos", "sony",
			"blackberry", "dopod", "nokia", "samsung", "palmsource", "xda", "pieplus", "meizu", "midp", "cldc",
			"motorola", "foma", "docomo", "up.browser", "up.link", "blazer", "helio", "hosin", "huawei", "novarra",
			"coolpad", "webos", "techfaith", "palmsource", "alcatel", "amoi", "ktouch", "nexian", "ericsson", "philips",
			"sagem", "wellcom", "bunjalloo", "maui", "smartphone", "iemobile", "spice", "bird", "zte-", "longcos",
			"pantech", "gionee", "portalmmm", "jig browser", "hiptop", "benq", "haier", "^lct", "320x320", "240x320",
			"176x220", "w3c ", "acs-", "alav", "alca", "amoi", "audi", "avan", "benq", "bird", "blac", "blaz", "brew",
			"cell", "cldc", "cmd-", "dang", "doco", "eric", "hipt", "inno", "ipaq", "java", "jigs", "kddi", "keji",
			"leno", "lg-c", "lg-d", "lg-g", "lge-", "maui", "maxo", "midp", "mits", "mmef", "mobi", "mot-", "moto",
			"mwbp", "nec-", "newt", "noki", "oper", "palm", "pana", "pant", "phil", "play", "port", "prox", "qwap",
			"sage", "sams", "sany", "sch-", "sec-", "send", "seri", "sgh-", "shar", "sie-", "siem", "smal", "smar",
			"sony", "sph-", "symb", "t-mo", "teli", "tim-", "tosh", "tsm-", "upg1", "upsi", "vk-v", "voda", "wap-",
			"wapa", "wapi", "wapp", "wapr", "webc", "winw", "winw", "xda", "xda-", "Googlebot-Mobile" };

	/**
	 * Default constructor.
	 */
	public JudgeAgent() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper((HttpServletResponse) response);
		String url = hrequest.getRequestURI();
		System.out.println(url);
		System.out.println(url.startsWith(hrequest.getContextPath() + "/template/"));
		if(! (url.startsWith(hrequest.getContextPath() + "/template/") || (url.startsWith(hrequest.getContextPath() + "/mobileuserino/")) || (url.startsWith(hrequest.getContextPath() + "/mobile/")) || (url.startsWith(hrequest.getContextPath() + "/login/")) || (url.equals(hrequest.getContextPath() + "/")))) {
			chain.doFilter(request, response);
			return;
		}
		// 不关心后台
		if (url.startsWith(hrequest.getContextPath() + "/template")) {
			chain.doFilter(request, response);
			return;
		}
		boolean isPhone = false;
		if (hrequest.getHeader("User-Agent") != null) {
			String agent = hrequest.getHeader("User-Agent");
			for (String s : mobileAgents) {
				if (agent.toLowerCase().indexOf(s) >= 0 && agent.toLowerCase().indexOf("windows nt") < 0
						&& agent.toLowerCase().indexOf("macintosh") < 0) {
					isPhone = true;
					break;
				}
			}
		}
		if (url.startsWith(hrequest.getContextPath() + "/mobile")) {
			if (isPhone == false) {
				wrapper.sendRedirect(hrequest.getContextPath() + "/");
				return;
			}
		} else {
			if (isPhone == true) {
				wrapper.sendRedirect(hrequest.getContextPath() + "/mobile/login/toHome");
				return;
			}
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
