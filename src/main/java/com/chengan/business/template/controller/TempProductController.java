package com.chengan.business.template.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.base.BaseController;
import com.chengan.business.repo.model.JkScoreMall;
import com.chengan.business.score.service.ScoreMallService;
import com.github.pagehelper.Page;

@Controller()
@RequestMapping("/template/product")
public class TempProductController extends BaseController {

	@Autowired
	ScoreMallService scoreMallService;

	@RequestMapping(value = "getProductList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getMallListPage(Integer pageNumber, Integer pageSize, String productName) {
		List<JkScoreMall> list = scoreMallService.getMallListPage(productName, pageNumber, pageSize);
		// 转成page对象
		Page<JkScoreMall> pageList = (Page<JkScoreMall>) list;

		Map<Object, Object> result = new HashMap<Object, Object>();
		result = getResult("rows", pageList);
		result.put("total", pageList.getTotal());
		return result;
	}

	@RequestMapping(value = "saveOrUpdate", method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(HttpServletRequest request, JkScoreMall jkScoreMall) {
		scoreMallService.saveOrUpdate(jkScoreMall);
		return new ModelAndView("redirect:/template/login/toGrid?gridName=ProductGrid");
	}

	@RequestMapping(value = "deleteById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> delete(HttpServletRequest request, Integer id) {
		scoreMallService.delete(id);
		return getResult(true, "");
	}
}
