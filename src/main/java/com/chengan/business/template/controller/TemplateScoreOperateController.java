package com.chengan.business.template.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.base.BaseController;
import com.chengan.business.repo.model.JkScoreOperate;
import com.chengan.business.score.service.ScoreOperateService;
import com.github.pagehelper.Page;

/**
 * 
 * @author y
 *
 */
@Controller
@RequestMapping("/template/scoreoperate")
public class TemplateScoreOperateController extends BaseController {
	@Autowired
	ScoreOperateService scoreOperateService;

	@RequestMapping(value = "getListPage", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getAdListPage(String operateName, HttpServletRequest request, Integer pageNumber,
			Integer pageSize) {
		// 1.根据参数获取标签列表
		Page<JkScoreOperate> list = (Page<JkScoreOperate>) scoreOperateService.getList(operateName, pageNumber,
				pageSize);

		Map<Object, Object> result = new HashMap<Object, Object>();
		result = getResult("rows", list);
		result.put("total", list.getTotal());
		return result;
	}

	@RequestMapping(value = "saveOrUpdate", method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(HttpServletRequest request, JkScoreOperate jkScoreOperate) throws ParseException {
		scoreOperateService.saveOrUpdate(jkScoreOperate);
		return new ModelAndView("redirect:/template/login/toGrid?gridName=scoreGrid");
	}

	@RequestMapping(value = "deleteById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> delete(HttpServletRequest request, Integer id) {
		scoreOperateService.delete(id);
		return getResult(true, "");
	}
}
