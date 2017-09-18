package com.chengan.business.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.repo.model.JkProjectCate;

@Controller
@RequestMapping("/projectcate")
public class ProjectCateController extends BaseController {

	@Autowired
	ProjectCateService projectCateService;

	/**
	 * 获取一级类目列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "getFirstCateList", method = RequestMethod.GET)
	@ResponseBody
	public List<JkProjectCate> getFirstCateList() {
		List<JkProjectCate> firstCateList = projectCateService.getFirstCateList();
		return firstCateList;
	}

	/**
	 * 获取二级类目列表
	 * 
	 * @param parentId
	 * @return
	 */
	@RequestMapping(value = "getSecondCateList", method = RequestMethod.GET)
	@ResponseBody
	public List<JkProjectCate> getSecondCateList(Integer parentId) {
		List<JkProjectCate> secondCateList = projectCateService.getSecondCateList(parentId);
		return secondCateList;
	}

	/**
	 * 获取一级类目和二级类目列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "getFirstAndSecondCateList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getFirstAndSecondCateList() {
		List<JkProjectCate> firstCateList = projectCateService.getFirstCateList();
		List<JkProjectCate> secondCateList = new ArrayList<JkProjectCate>();
		if (firstCateList.size() > 0) {
			secondCateList = projectCateService.getSecondCateList(firstCateList.get(0).getId());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("firstCateList", firstCateList);
		map.put("secondCateList", secondCateList);
		return map;
	}

}
