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

public class filter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain rchain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest hrequest = (HttpServletRequest) req;
		HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper((HttpServletResponse) resp);
		// hrequest.getSession().setAttribute("login_openId",
		// "odn33v2GMKMcd_KNR1BW36JoS5y8");
		String url = hrequest.getRequestURI();
		if(! (url.startsWith(hrequest.getContextPath() + "/template/") || (url.startsWith(hrequest.getContextPath() + "/mobileuserino/")) || (url.startsWith(hrequest.getContextPath() + "/login/toUser")))) {
			rchain.doFilter(req, resp);
			return;
		}
		if (url.indexOf("/template/login/toLogin") >= 0 || url.indexOf("/template/login/login") >= 0) {
			rchain.doFilter(req, resp);
			return;
		}
		if (url.equals(hrequest.getContextPath() + "/login/toLogin")) {
			rchain.doFilter(req, resp);
			return;
		}
		if (url.equals(hrequest.getContextPath() + "/mobile/login/toLogin")) {
			rchain.doFilter(req, resp);
			return;
		}
		if (url.startsWith(hrequest.getContextPath() + "/template/")) {
			if (hrequest.getSession().getAttribute("login_adminId") == null) {
				wrapper.sendRedirect(hrequest.getContextPath()+"/template/login/toLogin");
				return;
			} else {
				rchain.doFilter(req, resp);
				return;
			}
		} else if(url.startsWith(hrequest.getContextPath() + "/mobileuserino/")) {
			String ua = ((HttpServletRequest) req).getHeader("user-agent").toLowerCase();
			if(ua.indexOf("micromessenger") >= 0) {		// 微信浏览器
				// DO NOTHING
			} else {
				if(hrequest.getSession().getAttribute("login_userId") == null) {
					wrapper.sendRedirect(hrequest.getContextPath()+"/mobile/login/toLogin");
					return;
				}
			}
		} else if(url.startsWith(hrequest.getContextPath() + "/login/toUser")) {	// 电脑页面
			if(hrequest.getSession().getAttribute("login_userId") == null) {
				wrapper.sendRedirect(hrequest.getContextPath()+"/login/toLogin");
				return;
			}
		}

		rchain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
