package com.chengan.business.advice.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.advice.service.AdviceService;
import com.chengan.business.base.BaseController;
import com.chengan.business.repo.model.JKAdvice;
import com.github.pagehelper.Page;

@Controller
@RequestMapping("/advice")
public class AdviceController extends BaseController {

	@Autowired
	AdviceService adviceService;

	@RequestMapping(value = "/addadvice", method = RequestMethod.POST)
	@ResponseBody
	public String addadvice(HttpServletRequest req, JKAdvice jkAdvice) {
		if (jkAdvice.getUid() == null) {
			jkAdvice.setUid((int) req.getSession().getAttribute("login_userId"));
		}
		jkAdvice.setCreatTime(new Date());
		adviceService.addadvice(jkAdvice);
		return "1";

	}

	@RequestMapping(value = "/getadvicelist", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAdviceList(@RequestBody Map<String, Object> pagemap) {
		int pageSize = (int) pagemap.get("pageSize");
		int pageNumber = (int) pagemap.get("pageNumber");

		Map<String, Object> resmap = new HashMap<String, Object>();
		List<Map<String, Object>> list = adviceService.getAdviceList(pageSize, pageNumber);
		resmap.put("rows", (Page) list);
		resmap.put("total", ((Page) list).getTotal());

		return resmap;
	}

}
