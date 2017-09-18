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

import com.chengan.business.base.BaseController;
import com.chengan.business.score.service.ScoreExchangeService;
import com.github.pagehelper.Page;

@Controller
@RequestMapping("/template/score")
public class TemplateScoreExChangeController extends BaseController {
	@Autowired
	ScoreExchangeService scoreExchangeService;

	@RequestMapping(value = "toScoreexchange", method = RequestMethod.GET)
	public String toScoreexchange() {
		return "template/ScoreRecordGrid";
	}

	@RequestMapping(value = "getexchangemalllist", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getexchangemalllist(Integer uid, Integer type, // 操作类型
																				// 0用户
																				// 1兑换
			Integer creattime, // 时间排序 0降 1升
			Integer Page, Integer pageSize, String keywords) {

		Page<Map<String, Object>> list = (Page<Map<String, Object>>) scoreExchangeService.selectexchangmalllist(uid,
				type, creattime, keywords, Page, pageSize);
		Map<Object, Object> result = new HashMap<Object, Object>();
		result = getResult("rows", list);
		result.put("total", list.getTotal());
		return result;

	}

	@RequestMapping(value = "selectlisthavausermall", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectlisthavausermall(@RequestBody Map map) {
		String username = (String) map.get("username");
		Integer type = (Integer) map.get("type");
		String productname = (String) map.get("productname");
		Integer pageNumber = (Integer) map.get("pageNumber");
		Integer pageSize = (Integer) map.get("pageSize");
		List<Map<String, Object>> list = scoreExchangeService.selectlisthavausermall(username, productname, type,
				pageNumber, pageSize);
		Map<String, Object> result = new HashMap<>();
		result.put("rows", (Page<Map<String, Object>>) list);
		result.put("total", ((Page<Map<String, Object>>) list).getTotal());
		return result;

	}

}
