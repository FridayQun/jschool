package com.chengan.business.template.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.base.BaseController;
import com.chengan.business.repo.model.JKAdminUser;
import com.chengan.business.template.service.TempAdminUserService;

/**
 * 
 * @author y
 *
 */
@Controller
@RequestMapping("/template/login")
public class TemplateLoginController extends BaseController {

	@Autowired
	TempAdminUserService tempAdminUserService;

	/**
	 * 去登陆页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toLogin", method = RequestMethod.GET)
	String toLoginJsp(String error, Model model) {
		model.addAttribute("error", error);
		return "template/index";
	}

	/**
	 * 去注册页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toRegister", method = RequestMethod.GET)
	public String toRegisterJsp() {
		return "register";
	}

	/**
	 * 去grid页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toGrid", method = RequestMethod.GET)
	public String toGrid(String gridName, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		model.addAttribute("role", session.getAttribute("login_role"));
		model.addAttribute("gridName", gridName);
		return "template/" + gridName;
	}

	/**
	 * 通过手机号码登录用户
	 * 
	 * @param phone
	 * @param password
	 * @param type
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(String loginname, String password, HttpServletRequest request, Locale locale,
			Model model) {
		// 1.查找用户
		if (loginname == null || password == null) {
			return new ModelAndView("redirect:/template/login/toLogin?error=1");
		}

		JKAdminUser user = tempAdminUserService.getLoginUser(loginname, password);
		// 1.1用户登录有误
		if (user == null) {
			return new ModelAndView("redirect:/template/login/toLogin?error=1");
		}
		// 设置用户登陆信息到session
		HttpSession session = request.getSession();
		session.setAttribute("login_role", user.getRole());
		session.setAttribute("login_adminId", user.getId());
		session.setAttribute("login_adminPhone", user.getPhone());

		return new ModelAndView("redirect:/template/login/toGrid?gridName=adminuser");
	}

}
