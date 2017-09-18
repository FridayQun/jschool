package com.chengan.business.score.controller;

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

import com.chengan.business.base.BaseController;
import com.chengan.business.login.service.UserService;
import com.chengan.business.repo.model.JkScoreMall;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.score.service.ScoreMallService;

@Controller
@RequestMapping("/mall")
public class ScoreMallController extends BaseController {

	@Autowired
	UserService userService;
	@Autowired
	ScoreMallService scoreMallService;
	@Autowired
	ScoreExchangeService scoreExchangeService;

	@RequestMapping(value = "exchange", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> publishNews(HttpServletRequest request, @RequestParam(required = true) Integer id,
			@RequestParam(required = false) String addOn, @RequestParam(required = true, defaultValue="1") Integer type) throws ParseException {
		// 获取当前登录用户(既操作者)
		JkUser user = userService.getUserBySession(request);
		// 获取当前兑换商品
		JkScoreMall product = scoreMallService.getScoreProductById(id);
		// 用户或商品为空都返回
		if (user == null || product == null)
			return getResult(false, "未找到用户或者商品");
		if (user.getPoint() < product.getNeedScore())
			return getResult(false, "您的当前积分不够兑换改商品！");
		// 保存兑换记录
		scoreExchangeService.save(user, product.getId(), null, -product.getNeedScore(), "积分商城兑换礼品", type, addOn);

		return getResult();
	}

	@RequestMapping(value = "getmallpage", method = RequestMethod.POST)
	@ResponseBody
	public List<JkScoreMall> getMallListPage(String productName, Integer page, Integer pageSize) {
		return scoreMallService.getMallListPage(productName, page, pageSize);
	}

}
