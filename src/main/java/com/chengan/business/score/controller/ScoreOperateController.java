package com.chengan.business.score.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.repo.model.JkScoreOperate;
import com.chengan.business.score.service.ScoreOperateService;

@Controller
@RequestMapping("/operate")
public class ScoreOperateController extends BaseController {
	@Autowired
	ScoreOperateService scoreOperateService;

	@RequestMapping(value = "getList", method = RequestMethod.GET)
	@ResponseBody
	public List<JkScoreOperate> geList(String operateName, Integer Page, Integer pageSize) {
		return scoreOperateService.getList(operateName, Page, pageSize);

	}

}
