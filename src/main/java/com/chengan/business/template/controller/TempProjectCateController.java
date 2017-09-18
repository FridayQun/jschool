package com.chengan.business.template.controller;

import java.util.ArrayList;
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
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.repo.model.JkProjectCate;

@Controller()
@RequestMapping("/template/projectcate")
public class TempProjectCateController extends BaseController {

	@Autowired
	ProjectCateService projectCateService;

	/**
	 * 获取类目列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "getCateList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getFirstAndSecondCateList() {
		List<JkProjectCate> list = new ArrayList<JkProjectCate>();
		List<JkProjectCate> firstCateList = projectCateService.getFirstCateList();
		List<JkProjectCate> secondCateList = projectCateService.getSecondCateList(null);
		for (JkProjectCate JkProjectCate : firstCateList) {
			list.add(JkProjectCate);
			for (JkProjectCate JkProjectCate1 : secondCateList) {
				if (JkProjectCate1.getParentId() == JkProjectCate.getId())
					list.add(JkProjectCate1);
			}
		}
		Map<Object, Object> map = new HashMap<Object, Object>();
		map = getResult("rows", list);
		return map;
	}

	@RequestMapping(value = "saveOrUpdate", method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(HttpServletRequest request, JkProjectCate jkProjectCate) {
		// 判断有没有父类型id
		if (jkProjectCate.getParentId() == null)
			jkProjectCate.setCateLevel(0);
		else
			jkProjectCate.setCateLevel(1);
		projectCateService.saveOrUpdate(jkProjectCate);
		return new ModelAndView("redirect:/template/login/toGrid?gridName=ProjectCateGrid");
	}

	@RequestMapping(value = "deleteById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> delete(HttpServletRequest request, Integer id) {
		projectCateService.delete(id);
		return getResult(true, "");
	}

}
