package com.chengan.business.operate.controller;

import java.text.ParseException;
import java.util.HashMap;
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
import com.chengan.business.login.service.UserService;
import com.chengan.business.operate.service.AdmireService;
import com.chengan.business.operate.service.CollectService;
import com.chengan.business.operate.service.CommentService;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.service.ScoreExchangeService;

@Controller
@RequestMapping("/operate")
public class OperateController extends BaseController {

	@Autowired
	AdmireService admireService;
	@Autowired
	CollectService collectService;
	@Autowired
	CommentService commentService;
	@Autowired
	UserService userService;
	@Autowired
	ScoreExchangeService scoreExchangeService;

	/**
	 * 点赞
	 * 
	 * @param request
	 * @param fid
	 *            对象id
	 * @param uid
	 *            用户id
	 * @param type
	 *            类型
	 * @param description
	 *            点赞描述
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "admire", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> admire(HttpServletRequest request, Integer fid, Integer type, String description)
			throws ParseException {
		// 获取当前登录用户(既操作者)
		JkUser user = userService.getUserBySession(request);
		// 若用户未登录，则返回
		if (user == null) {
			return getResult(false);
		}
		// 1.保存赞
		admireService.saveAdmire(fid, user.getId(), type, description);
		// 2.用户点赞获得积分
		scoreExchangeService.save(user, null, null, 5, "点赞", 0);
		return getResult();
	}

	/**
	 * 收藏
	 * 
	 * @param request
	 * @param fid
	 *            对象id
	 * @param uid
	 *            用户id
	 * @param type
	 *            类型
	 * @param description
	 *            收藏描述述
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "collect", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> collect(HttpServletRequest request, Integer fid, Integer type, String collectionDesc)
			throws ParseException {
		// 获取当前登录用户(既操作者)
		JkUser user = userService.getUserBySession(request);
		// 若用户未登录，则返回
		if (user == null) {
			return getResult(false);
		}
		// 1.保存
		collectService.saveCollect(fid, user.getId(), type, collectionDesc);
		// 2.用户收藏获得积分
		scoreExchangeService.save(user, null, null, 5, "收藏", 0);
		return getResult();
	}

	/**
	 * 评论
	 * 
	 * @param request
	 * @param fid
	 * @param uid
	 * @param type
	 * @param comment
	 * @param scroe
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "comment", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> comment(HttpServletRequest request, Integer fid, String type, String comment,
			Integer score) throws ParseException {
		// 获取当前登录用户(既操作者)
		JkUser user = userService.getUserBySession(request);
		// 若用户未登录，则返回登录页面
		if (user == null) {
			return getResult(false, "未登录");
		}
		// 用户已登录，则保存
		commentService.saveComment(fid, user.getId(), type, comment, score);
		// 用户评论获得积分
		scoreExchangeService.save(user, null, null, 5, "评论", 0);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("user", user);
		map.put("error", "0");
		return map;
	}

	@RequestMapping(value = "getCommentList", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getCommentList(HttpServletRequest request
			, @RequestParam(required = false) Integer uid, Integer fid
			, @RequestParam(required = false) Integer pageNum, @RequestParam(required = false) Integer pageSize) throws ParseException {
		List<Map<Object, Object>> list = commentService.selectCimmentList(uid, fid, 2, pageNum, pageSize);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("list", list);
		map.put("error", "0");
		return map;
	}

	// /**
	// * 审核（待定）
	// * @param request
	// * @param fid
	// * @param uid
	// * @param type
	// * @param comment
	// * @param scroe
	// * @return
	// */
	// @RequestMapping(value = "check",method = RequestMethod.POST)
	// @ResponseBody
	// public Map<Object, Object> check(HttpServletRequest request){
	//
	// return getResult();
	// }
	// 了

}
