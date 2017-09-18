package com.chengan.business.fans.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.fans.service.FansService;
import com.chengan.business.repo.model.JkUserFans;

@RequestMapping("/fans")
@Controller
public class FansController extends BaseController {
	@Autowired
	FansService fansService;

	/**
	 * 通过用户id获取粉丝信息
	 * 
	 * @param uid
	 * @param fanid
	 * 
	 */
	@RequestMapping(value = "getfanslist", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getFansList(@RequestParam(required = true) int id,
			@RequestParam(required = true) int fanid, @RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "20") Integer pageSize) {
		List<JkUserFans> list = fansService.getfanslist(id, fanid, page, pageSize);
		return getResult("list", list);
	}
}
