package com.chengan.business.template.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.repo.model.JKAdminUser;
import com.chengan.business.template.service.TempAdminUserService;
import com.github.pagehelper.Page;

@Controller
@RequestMapping("tempadminuser")
public class TemplateAdminUser {
	@Autowired
	TempAdminUserService tempAdminUserService;

	@RequestMapping(value = "toadminuser", method = RequestMethod.GET)
	public String toadminuser() {
		return "template/adminuser";
	}

	@RequestMapping(value = "getAdminUserList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAdminUserList(@RequestBody Map<String, Object> map) {
		Integer phone = (Integer) map.get("phone");
		Integer pageNumber = (Integer) map.get("pageNumber");
		Integer pageSize = (Integer) map.get("pageSize");
		String loginname = null;
		if (map.get("loginname") != null) {
			loginname = (String) map.get("loginname");
		}
		Integer id = null;
		if (map.get("id") != null) {
			id = (Integer) map.get("id");
		}
		Map<String, Object> resultmap = new HashMap<>();

		List<JKAdminUser> list = tempAdminUserService.getAdminUserList(phone, pageNumber, pageSize, loginname, id);

		resultmap.put("rows", ((Page) list));
		resultmap.put("total", ((Page) list).getTotal());
		return resultmap;
	}

	@RequestMapping(value = "addAdminUser", method = RequestMethod.POST)
	@ResponseBody
	public int addAdminUser(JKAdminUser jkAdminUser) {
		return tempAdminUserService.addAdminUser(jkAdminUser);
	}

	@RequestMapping(value = "isrepeatloginname", method = RequestMethod.POST)
	@ResponseBody
	public int isrepeatLoginName(String loginname, Integer id) {
		List<JKAdminUser> list = tempAdminUserService.getAdminUserList(null, null, null, loginname, id);
		if (list.size() == 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@RequestMapping(value = "deladminuser", method = RequestMethod.POST)
	@ResponseBody
	public int delAdminUser(JKAdminUser jkAdminUser) {
		return tempAdminUserService.delAdminUser(jkAdminUser);
	}

}
