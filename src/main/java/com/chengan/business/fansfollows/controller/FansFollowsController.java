package com.chengan.business.fansfollows.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.fansfollows.service.FansFollowsService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.repo.model.JkUserFansFollows;
import com.github.pagehelper.Page;

@Controller
@RequestMapping("/fansfollows")
public class FansFollowsController {
	@Autowired
	FansFollowsService fansFollowsService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "addfanfollow", method = RequestMethod.POST)
	@ResponseBody
	public synchronized Integer addfanfollow(@RequestParam(required = true) Integer fanid,
			@RequestParam(required = true) Integer followid) {
		JkUserFansFollows fansFollows = fansFollowsService.getOneFansByFollowId(fanid, followid);
		if (fansFollows != null) {
			return 0;
		}

		int fl = fansFollowsService.addfanfollow(fanid, followid);
		if (fl == 1) {
			userService.updatefans(followid);
			userService.updatefollows(fanid);
		}
		return fl;
	}

	@RequestMapping(value = "delfanfollow", method = RequestMethod.POST)
	@ResponseBody
	public Integer delfanfollow(@RequestParam(required = true) Integer fanid,
			@RequestParam(required = true) Integer followid) {
		int state = fansFollowsService.delfanfollow(fanid, followid);
		if (state == 1) {
			userService.updatefanscancle(followid);
			userService.updatefollowscancle(fanid);
		}
		return state;

	}

	@RequestMapping(value = "getAllFansByFollowId", method = RequestMethod.POST)

	public Integer getOneFansByFollowId(@RequestParam(required = false) Integer fanid,
			@RequestParam(required = false) Integer followid) {
		return fansFollowsService.addfanfollow(fanid, followid);
	}

	@RequestMapping(value = "getfanslistpage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getfanslistpage(HttpServletRequest req, Integer pageSize, Integer pageNumber, @RequestParam(required = false) String username) {
		Object sessionid = req.getSession().getAttribute("login_userId");

		int id = (int) sessionid;
		List<Map<String, Object>> list = fansFollowsService.selectfanslistpage(1, 10, id, username);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fanslist", ((Page<Map<String, Object>>) list));
		return map;
	}

	@RequestMapping(value = "getfowllowslistpage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getfowllowslistpage(HttpServletRequest req, Integer pageSize, Integer pageNumber, @RequestParam(required = false) String username) {
		Object sessionid = req.getSession().getAttribute("login_userId");

		int id = (int) sessionid;
		List<Map<String, Object>> list = fansFollowsService.selectfollowslistpage(pageNumber, pageSize, id, username);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("followslist", ((Page<Map<String, Object>>) list));
		return map;
	}

}
