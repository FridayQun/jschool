package com.chengan.business.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.login.service.UserService;
import com.chengan.business.user.service.UserCollectionService;
import com.github.pagehelper.Page;

@Controller
@RequestMapping("/usercollection")
public class UserCollection {

	@Autowired
	UserCollectionService userCollectionService;

	@RequestMapping(value = "getcollectionlist", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getcollectionlist(HttpServletRequest req, int type, Integer pageSize, Integer pageNumber) {
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = userCollectionService.getcollectList(userid, type, pageSize, pageNumber);
		map.put("rows", list);
		map.put("total", list.size());
		map.put("size", list.size());
		return (map);
	}
}
