package com.chengan.business.template.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.login.service.UserService;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkProjectCate;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.tag.service.TagMatchService;
import com.chengan.business.tag.service.TagService;
import com.github.pagehelper.Page;
import com.mysql.jdbc.StringUtils;

@Controller()
@RequestMapping("/template/project")
public class TempProjectController extends BaseController {

	@Autowired
	ProjectService projectService;
	@Autowired
	TagMatchService tagMatchService;
	@Autowired
	ProjectCateService projectCateService;
	@Autowired
	UserService userService;
	@Autowired
	TagService tagService;
	@Autowired
	ScoreExchangeService scoreExchangeService;

	@RequestMapping(value = "getProjectList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getNewsList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false, defaultValue = "1") Integer pageNumber,
			@RequestParam(required = false, defaultValue = "10") Integer pageSize,
			@RequestParam(required = false) Integer projType, @RequestParam(required = false) String projName,
			@RequestParam(required = false) String projLocation, @RequestParam(required = false) Integer squareNeeds,
			@RequestParam(required = false) Integer peopleNeeds, @RequestParam(required = false) Integer timesNumber,
			@RequestParam(required = false) String phone, @RequestParam(required = false) Integer uid,
			@RequestParam(required = false) Integer cid, @RequestParam(required = false) String cateName,
			@RequestParam(required = false) Integer parentCid, @RequestParam(required = false) Integer status,
			@RequestParam(required = false) List<Integer> tags, @RequestParam(required = false) String tagsName,
			@RequestParam(required = false, defaultValue = "istop desc,createTime desc") String orderStr) {
		// 判断是否有标签集合参数，若有，则获取拥有该标签的项目id集合，已以作为筛选条件
		if (tags == null)
			tags = new ArrayList<Integer>();
		if (!StringUtils.isNullOrEmpty(tagsName)) { // 根据标签名搜索，讲获取的标签id插入tags作为筛选条件
			List<JkTags> tagList = tagService.getTagsList(tagsName);
			for (JkTags jkTags : tagList) {
				tags.add(jkTags.getId());
			}
		}
		List<Integer> projectIds = null;
		if (tags != null && tags.size() > 0)
			projectIds = tagMatchService.getProjectListByTagids(tags, 1);

		// parentCid为筛选条件：类型的id，可能为一级目录，也可能为二级目录，这里要判断
		JkProjectCate projCate = projectCateService.getCateById(parentCid);
		if (projCate != null && projCate.getCateLevel() == 1) {
			cid = parentCid;
			parentCid = null;
		}
		// 根据参数获取项目列表(暂时默认按积分排序)
		// 1.获取登录用户id作为查询条件，未登录传null
		Integer loginUid = null;
		JkUser user = userService.getUserBySession(request);
		if (user != null)
			loginUid = user.getId();
		List<Map<String, Object>> list = projectService.getProjectList(uid, loginUid, cid, parentCid, projType,
				projName, cateName, squareNeeds, peopleNeeds, timesNumber, phone, status, projLocation, projectIds,
				orderStr, pageNumber, pageSize, null);
		// 设置返回map
		// 分页数据
		Map<Object, Object> map = getResult("rows", list);
		map.put("total", ((Page<Map<String, Object>>) list).getTotal());
		return map;
	}

	@RequestMapping(value = "topProject", method = RequestMethod.GET)
	@ResponseBody
	public int topProject(HttpServletRequest req, Integer id) throws ParseException {
		return projectService.topProject(id, null);
	}

	/**
	 * 删除by id
	 * 
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "deleteById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> delete(HttpServletRequest request, Integer id) {
		projectService.deleteById(id);
		return getResult(true, "");
	}

	/**
	 * 项目审核
	 * 
	 * @param request
	 * @param id
	 * @param status
	 *            1通过 2不通过
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "check", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> check(HttpServletRequest request, Integer id, Integer status) throws ParseException {
		projectService.check(id, status);
		return getResult(true, "");
	}

}
