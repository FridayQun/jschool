package com.chengan.business.mobile.integral.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chengan.business.base.BaseController;
import com.chengan.business.login.service.UserService;
import com.chengan.business.repo.model.JkScoreMall;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.service.ScoreMallService;

@Controller
@RequestMapping("/integral")
public class integralController extends BaseController {
	@Autowired
	UserService userService;

	@Autowired
	ScoreMallService scoreMallService;

	// 去积分首页
	@RequestMapping(value = "tointegralindex", method = RequestMethod.GET)
	public String toIntegralindex(HttpServletRequest req, Model model) {
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/login";
		}
		int userid = (int) sessionid;
		JkUser jkUser = userService.getUserById(userid);
		model.addAttribute("jkuser", jkUser);
		return "mobile/user-integral";
	}

	// 去兑换记录页
	@RequestMapping(value = "tointegralexchange", method = RequestMethod.GET)
	public String toIntegralexChange(HttpServletRequest req, Model model) {
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/login";
		}
		int userid = (int) sessionid;
		JkUser jkUser = userService.getUserById(userid);
		model.addAttribute("jkuser", jkUser);
		return "mobile/integral-record";
	}

	@RequestMapping(value = "toDetails", method = RequestMethod.GET)
	public String toDetails(HttpServletRequest req, int id, Model model) {
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/login";
		}
		JkScoreMall jkScoreMall = scoreMallService.getScoreProductById(id);
		model.addAttribute("jkScoreMall", jkScoreMall);
		int userid = (int) sessionid;
		JkUser jkUser = userService.getUserById(userid);
		model.addAttribute("jkuser", jkUser);
		return "mobile/user-integral-details";
	}
	
	@RequestMapping(value = "toShippingAddress", method = RequestMethod.GET)
	public String toShippingAddress(HttpServletRequest req, int id, Model model) {
		model.addAttribute("jkScoreMallId", id);
		return "mobile/shippingAddress";
	}
}
