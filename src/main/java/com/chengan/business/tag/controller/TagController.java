package com.chengan.business.tag.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.tag.service.TagService;
import com.github.pagehelper.Page;

@Controller
@RequestMapping("/tag")
public class TagController extends BaseController {

	@Autowired
	TagService tagService;

	/**
	 * 获取标签列表byFidAndType
	 * 
	 * @param request
	 * @param fid
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "getTagList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getTagList(HttpServletRequest request, @RequestParam(required = false) Integer fid,
			@RequestParam(required = false) Integer type) {
		// 1.根据参数获取标签列表
		List<JkTags> list = tagService.getTagsList(fid, type);
		return getResult("tagsList", list);
	}
	
	// 用于手机红人馆
	@RequestMapping(value = "getTagList2", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getTagList2(HttpServletRequest request, @RequestParam(required = false) Integer fid,
			@RequestParam(required = false) Integer type) {
		// 1.根据参数获取标签列表
		List<JkTags> list = tagService.getTagsList2(type, fid);
		return getResult("tagsList", list);
	}
	
	@RequestMapping(value = "getFirstTagList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getFirstTagList(HttpServletRequest request) {
		Page<JkTags> list = (Page<JkTags>) tagService.getTagsFirstListPage(1, 100);
		System.out.println(list.size());
		return getResult("tagsList", list);
	}

	/**
	 * 获取所有的标签列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getAllTagList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getAllTagList(HttpServletRequest request,
			@RequestParam(required = false) Integer tagType) {
		// 1.根据参数获取标签列表
		List<JkTags> list = tagService.getAllTagsList(tagType);
		return getResult("tagsList", list);
	}

}
