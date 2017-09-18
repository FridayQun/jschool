package com.chengan.business.score.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.repo.model.JkScoreExchange;
import com.chengan.business.score.service.ScoreExchangeService;

@Controller
@RequestMapping("/exchange")
public class ScoreExChangeController extends BaseController {
	@Autowired
	ScoreExchangeService scoreExchangeService;

	@RequestMapping(value = "getlist", method = RequestMethod.POST)
	@ResponseBody
	public List<JkScoreExchange> geListOfExchange(Integer uid, Integer type, Integer Page, Integer pageSize,
			int ispid) {
		boolean pid = false;
		if (ispid == 1) {
			pid = true;
		}
		if (ispid == 1) {
			pid = false;
		}
		return scoreExchangeService.getListOfExchange(uid, type, Page, pageSize, pid);

	}

	@RequestMapping(value = "getexchangemalllist", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getexchangemalllist(Integer uid, Integer type, // 操作类型
																					// 0用户
																					// 1兑换
			Integer creattime, // 时间排序 0降 1升
			Integer Page, Integer pageSize, String keywords) {

		return scoreExchangeService.selectexchangmalllist(uid, type, creattime, keywords, Page, pageSize);

	}
}
