package com.chengan.business.mesg.controller;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.repo.model.JkSysMesg;
import com.github.pagehelper.Page;

@Controller
@RequestMapping("/mesg")
public class mesgController extends BaseController {
	@Autowired
	mesgService mesgService;

	@RequestMapping(value = "getmesglist", method = RequestMethod.POST)
	public List<JkSysMesg> getJkSysMesgList(Integer pageNumber, Integer pageSize, Integer type, Integer fromid,
			Integer toid, Integer id) {
		return mesgService.getJkSysMesgList(pageNumber, pageSize, type, fromid, toid, id);
	}

	@RequestMapping(value = "getmesgUserlist", method = RequestMethod.POST)
	public List<JkSysMesg> getJkSysMesgUserList(Integer pageNumber, Integer pageSize, Integer type, Integer fromid,
			Integer toid) {
		return mesgService.getJkSysMesgList(pageNumber, pageSize, type, fromid, toid, null);
	}

	@RequestMapping(value = "addmesg", method = RequestMethod.POST)
	@ResponseBody
	public int addmesg(HttpServletRequest req, JkSysMesg jkSysMesg) {
		int loginid = (int) req.getSession().getAttribute("login_userId");
		jkSysMesg.setSendTime(new Date());
		jkSysMesg.setFromId(loginid);
		return mesgService.addmesg(jkSysMesg);
	}

	@RequestMapping(value = "getmesglistuser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getmesglistuser(HttpServletRequest req, Integer pageNumber, Integer pageSize,
			Integer fromid, Integer toid) {
		Map<String, Object> map = new HashMap<>();
		if (toid == null) {
			Object sessionid = req.getSession().getAttribute("login_userId");
			if (sessionid == null) {
			}
			toid = (int) sessionid;
		}
		List<Map<String, Object>> list = mesgService.getmesglistuser(pageNumber, pageSize, fromid, toid);

		if (pageNumber != null && pageNumber != null) {
			// 分页不分页
			map.put("rows", (Page<Map<String, Object>>) list);
		} else {
			map.put("rows", list);
		}
		return map;

	}

	@RequestMapping(value = "getmesglistuserone", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getmesglistuserone(HttpServletRequest req, Integer userid, Integer loginid) {
		if (loginid == null) {
			Object sessionid = req.getSession().getAttribute("login_userId");
			if (sessionid == null) {
			}
			loginid = (int) sessionid;
		}
		mesgService.updateisread(userid, loginid);
		return mesgService.getmesglistuserone(userid, loginid);

	}

	@RequestMapping(value = "getmesglistbyex", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getmesglistbyex(@RequestBody Map<String, Object> reqmap) {
		List<Integer> type = (List<Integer>) reqmap.get("type");
		Integer istop = (Integer) reqmap.get("istop");
		Integer pageNumber = (Integer) reqmap.get("pageNumber");
		Integer pageSize = (Integer) reqmap.get("pageSize");
		Map<String, Object> map = new HashMap<String, Object>();
		List<JkSysMesg> list = mesgService.getmesglistbyex(type, istop, pageNumber, pageSize);
		if (pageNumber != null && pageSize != null) {
			map.put("rows", (Page<JkSysMesg>) list);
			map.put("total", ((Page<JkSysMesg>) list).getTotal());
		} else if (pageNumber == null && pageSize == null) {
			map.put("rows", list);
			map.put("total", list.size());
		}
		return map;
	}

	// 底部信息
	@RequestMapping(value = "getmesglistbyexlast", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getmesglistbyexlast(String type) {
		String[] stringlist = type.split(",");
		List<Integer> typelist = new ArrayList<Integer>();

		for (String s : stringlist) {
			typelist.add(Integer.parseInt(s));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		List<JkSysMesg> list = mesgService.getmesglistbyex(typelist, null, null, null);

		map.put("rows", list);
		map.put("total", list.size());

		return map;
	}

	@RequestMapping(value = "getcountbyuidnotread", method = RequestMethod.POST)
	@ResponseBody
	public String getcountbyuidnotread(HttpServletRequest req) {
		int toid = 0;
		try {
			toid = (int) req.getSession().getAttribute("login_userId");
		} catch(NullPointerException e){}

		return mesgService.getcountbyuidnotread(toid);
	}

	@RequestMapping(value = "addtempmesg", method = RequestMethod.POST)
	@ResponseBody
	public int addtempmesg(HttpServletRequest req, JkSysMesg jkSysMesg) {
		jkSysMesg.setSendTime(new Date());
		return mesgService.addmesg(jkSysMesg);
	}

}
