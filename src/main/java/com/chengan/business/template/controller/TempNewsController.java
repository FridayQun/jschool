package com.chengan.business.template.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.artcle.service.ArtcleCateService;
import com.chengan.business.artcle.service.ArtcleService;
import com.chengan.business.base.BaseController;
import com.chengan.business.operate.service.CommentService;
import com.chengan.business.repo.model.JkNews;
import com.chengan.business.repo.model.JkNewsCate;
import com.github.pagehelper.Page;

@Controller()
@RequestMapping("/template/news")
public class TempNewsController extends BaseController {

	@Autowired
	ArtcleService artcleService;
	@Autowired
	CommentService commemtService;
	@Autowired
	ArtcleCateService artcleCateService;

	/**
	 * 获取资讯列表
	 * 
	 * @param request
	 * @param page
	 * @param pageSize
	 * @param title
	 *            标题
	 * @param type
	 *            类型
	 * @return
	 */
	@RequestMapping(value = "getNewsList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getNewsList(HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") Integer pageNumber,
			@RequestParam(required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(required = false) Integer uid, @RequestParam(required = false) String title,
			@RequestParam(required = false) String phone, @RequestParam(required = false) Integer type,
			@RequestParam(required = false) Integer status) {
		// 1.根据参数获取资讯列表
		List<JkNews> list = artcleService.getArtcleList(title, phone, type, null, status, null, pageNumber, pageSize);
//		List<JkNewsCate> cateList = artcleCateService.getArtcleCateList(null, null, null, null);
		// 2.转成page对象
		Page<JkNews> pageList = (Page<JkNews>) list;

		Map<Object, Object> map = getResult("newsList", list);
		// 分页总页数
		map.put("rows", pageList);
		// 分页总条数
		map.put("total", pageList.getTotal());
		return map;
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
		artcleService.delete(id);
		return getResult(true, "");
	}

	/**
	 * 头条审核
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
		artcleService.check(id, status);
		return getResult(true, "");
	}

	/**
	 * 置顶头条
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "topNews", method = RequestMethod.GET)
	@ResponseBody
	public int topNews(Integer id) {
		return artcleService.topProject(id);
	}

	/**
	 * 推荐头条
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "commentProject", method = RequestMethod.GET)
	@ResponseBody
	public int commentProject(Integer id) {
		return artcleService.commentProject(id);
	}

	/**
	 * 获取资讯列表
	 * 
	 * @param request
	 * @param page
	 * @param pageSize
	 * @param title
	 *            标题
	 * @param type
	 *            类型
	 * @return
	 */
	@RequestMapping(value = "getCommentsList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getCommentsList(HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") Integer pageNumber,
			@RequestParam(required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(required = false) Integer fid) {
		// 1.根据参数获取资讯列表
		// List<JkNews> list = artcleService.getArtcleList(title, phone, type, null, status, null, pageNumber, pageSize);
		List<Map<Object, Object>> comments = commemtService.selectCimmentList(null, fid, 2, pageNumber, pageSize);
		// 2.转成page对象
		Page<Map<Object, Object>> pageList = (Page<Map<Object, Object>>) comments;

		Map<Object, Object> map = getResult("commentsList", comments);
		// 分页总页数
		map.put("rows", pageList);
		// 分页总条数
		if(pageList != null) {
			map.put("total", pageList.getTotal());
		} else {
			map.put("total", 0);
		}
		return map;
	}
	
	@RequestMapping(value = "getCateListPage", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getCateListPage(HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") Integer pageNumber,
			@RequestParam(required = false, defaultValue = "20") Integer pageSize) {
		// 1.根据参数获取资讯列表
		// List<JkNews> list = artcleService.getArtcleList(title, phone, type, null, status, null, pageNumber, pageSize);
		List<JkNewsCate> cateList = artcleCateService.getArtcleCateList(null, null, pageNumber, pageSize);
		// 2.转成page对象
		Page<JkNewsCate> pageList = (Page<JkNewsCate>) cateList;

		Map<Object, Object> map = getResult("cateList", cateList);
		// 分页总页数
		map.put("rows", pageList);
		// 分页总条数
		if(pageList != null) {
			map.put("total", pageList.getTotal());
		} else {
			map.put("total", 0);
		}
		return map;
	}

	@RequestMapping(value = "deleteCommentById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> deleteCommentById(HttpServletRequest request, Integer id) {
		commemtService.delete(id);
		return getResult(true, "");
	}

	@RequestMapping(value = "changeCateState", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> changeCateState(HttpServletRequest request, Integer id) {
		JkNewsCate cate = artcleCateService.getJkNewsCateById(id);
		if(cate.getIsRecomment() == null || cate.getIsRecomment() == 0) {
			cate.setIsRecomment(1);
		} else {
			cate.setIsRecomment(0);
		}
		artcleCateService.change(cate);
		return getResult(true, "");
	}

	@RequestMapping(value = "deleteCateById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> deleteCateById(HttpServletRequest request, Integer id) {
		artcleCateService.delete(id);
		return getResult(true, "");
	}
	
	@RequestMapping(value = "saveOrUpdate", method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(HttpServletRequest request, @RequestParam(required = false) Integer id
			, String cateName, @RequestParam(required = false) String cateDesc) {
		JkNewsCate cate = new JkNewsCate();
		cate.setId(id);
		cate.setCateName(cateName);
		cate.setCateDesc(cateDesc);
		artcleCateService.saveOrUpdate(cate);
		return new ModelAndView("redirect:/template/login/toGrid?gridName=NewsCate");
	}
}