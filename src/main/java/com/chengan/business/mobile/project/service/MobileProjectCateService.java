package com.chengan.business.mobile.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.project.dao.ProjectCateDao;
import com.chengan.business.project.dao.ProjectDao;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.repo.model.JkProjectCate;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.tag.service.TagService;

import net.sf.json.JSONArray;

@Service
public class MobileProjectCateService {

	@Autowired
	ProjectCateDao projectCateDao;
	@Autowired
	ProjectCateService projectCateService;
	@Autowired
	ProjectDao projectDao;
	@Autowired
	TagService tagService;

	// 获取项目列表页分类条件数据，特定json格式（供手机端调用用）
	public String getFilterData() {

		Map<String, Object> map = new HashMap<String, Object>();
		// 1.类型
		List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
		map.put("title", "服务");
		map.put("mark", 0);
		map.put("type", "类型");
		typeList.add(map);
		map = new HashMap<String, Object>();
		map.put("title", "资金");
		map.put("mark", 1);
		map.put("type", "类型");
		typeList.add(map);
		// 2.地区
		List<Map<String, Object>> locaList = new ArrayList<Map<String, Object>>();
		List<String> locations = projectDao.queryLocationList();
		for (String location : locations) {
			map = new HashMap<String, Object>();
			map.put("title", location);
			map.put("mark", location);
			map.put("type", "地区");
			locaList.add(map);
		}
		// 3.标签
		List<Map<String, Object>> tagList = new ArrayList<Map<String, Object>>();
		List<JkTags> tags = tagService.getAllTagsList(1);
		for (JkTags tag : tags) {
			map = new HashMap<String, Object>();
			map.put("title", tag.getTagName());
			map.put("mark", tag.getId());
			map.put("type", "标签");
			tagList.add(map);
		}
		// 4.类目
		List<Map<String, Object>> cateList = new ArrayList<Map<String, Object>>();
		List<JkProjectCate> cates = projectCateService.getAllCateList();
		for (JkProjectCate cate : cates) {
			map = new HashMap<String, Object>();
			map.put("title", cate.getCateName());
			map.put("mark", cate.getId());
			map.put("type", "类目");
			cateList.add(map);
		}

		// 5.将前面获得的数据放在一起按前端需求格式组成json数组
		List<List<Map<String, Object>>> list = new ArrayList<List<Map<String, Object>>>();
		list.add(typeList);
		list.add(locaList);
		list.add(tagList);
		list.add(cateList);

		return JSONArray.fromObject(list).toString();
	}

}
