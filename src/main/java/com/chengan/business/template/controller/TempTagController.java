package com.chengan.business.template.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
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
import com.chengan.business.repo.model.JkProjectCate;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.tag.service.TagService;
import com.github.pagehelper.Page;

@Controller()
@RequestMapping("/template/tag")
public class TempTagController extends BaseController {

	@Autowired
	TagService tagService;

	/**
	 * 获取所有的标签列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getTagListPage", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getTagListPage(HttpServletRequest request, Integer pageNumber, Integer pageSize) {
		// 1.根据参数获取标签列表
		List<JkTags> firstList = tagService.getTagsFirstListPage(null, null);
		List<JkTags> secondList = tagService.getTagsSecondListPage(null, null);
		System.out.println("firstList: "+secondList.size());
		List<JkTags> list = new LinkedList<JkTags>();
		int start = (pageNumber-1)*pageSize;
		int end = (pageNumber)*pageSize;
		int count = 0;
		for(JkTags first : firstList) {
			count++;
			if(count >= end) {
				break;
			}
			if(count >= start) {
				list.add(first);
			}
			for(JkTags second : secondList) {
				if(second.getParentId().equals(first.getId())) {
					count++;
					if(count >= end) {
						break;
					}
					if(count > start) {
						list.add(second);
					}
				}
			}
		}

		Map<Object, Object> result = new HashMap<Object, Object>();
		result = getResult("rows", list);
		result.put("total", firstList.size()+secondList.size());
		return result;
	}
	
	@RequestMapping(value = "saveOrUpdate", method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(HttpServletRequest request, JkTags jkTags) {
		tagService.saveOrUpdate(jkTags);
		return new ModelAndView("redirect:/template/login/toGrid?gridName=TagGrid");
	}

	@RequestMapping(value = "deleteById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> delete(HttpServletRequest request, Integer id) {
		tagService.delete(id);
		return getResult(true, "");
	}

}
