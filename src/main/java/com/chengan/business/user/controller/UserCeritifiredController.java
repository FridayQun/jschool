package com.chengan.business.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.artcle.service.ArtcleService;
import com.chengan.business.base.BaseController;
import com.chengan.business.fans.service.FansService;
import com.chengan.business.fansfollows.service.FansFollowsService;
import com.chengan.business.login.service.LoginService;
import com.chengan.business.login.service.SmsService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.login.service.WxUserService;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.project.service.ProjectApplyService;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserCeritifired;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.tag.service.TagMatchService;
import com.chengan.business.tag.service.TagService;
import com.chengan.business.user.service.UserCeritifiredService;
import com.chengan.business.user.service.UserCollectionService;
import com.chengan.business.user.service.UserInfoService;

@Controller
@RequestMapping(value = "/userceritifired")
public class UserCeritifiredController extends BaseController {

	@Autowired
	UserCeritifiredService userCeritifiredService;

	@Autowired
	UserInfoService userInfoService;

	@Autowired
	ProjectService projectService;

	@Autowired
	ArtcleService artcleService;

	@Autowired
	UserService userService;

	@Autowired
	TagService TagService;

	@Autowired
	FansService fansService;
	@Autowired
	ProjectApplyService projectApplyService;

	@Autowired
	SmsService smsService;

	@Autowired
	ProjectCateService projectCateService;

	@Autowired
	FansFollowsService fansFollowsService;

	@Autowired
	ScoreExchangeService scoreExchangeService;

	@Autowired
	TagMatchService tagMatchService;

	@Autowired
	LoginService loginService;

	@Autowired
	WxUserService WxUserService;

	@Autowired
	mesgService mesgService;

	@Autowired
	UserCollectionService userCollectionService;

	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public int adduserceritifired(JkUserCeritifired jkUserCeritifired) {

		return userCeritifiredService.addUserCeritifired(jkUserCeritifired);
	}

	@RequestMapping(value = "cancle", method = RequestMethod.GET)
	public String cancle(int cid, int uid, HttpServletRequest req, Model model) {
		req.getSession().setAttribute("user_level", 1);
		userCeritifiredService.cancle(cid, uid);
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		// 登陆后获取项目数量
		List<Integer> projstatuslist = new ArrayList<Integer>();
		projstatuslist.add(-1);
		projstatuslist.add(0);
		projstatuslist.add(1);
		projstatuslist.add(2);
		projstatuslist.add(3);
		projstatuslist.add(4);
		int totalofproject = projectService.getTotalofProjectById(userid, projstatuslist).getT();
		// 登陆后获取头条数量
		List<Integer> newsstatuslist = new ArrayList<Integer>();
		newsstatuslist.add(0);
		newsstatuslist.add(1);
		int totalofnews = artcleService.getTotalOfNews(userid, newsstatuslist).getT();
		// 登陆后获取用户信息
		JkUser jkUser = userService.getUserById(userid);
		// 登陆后获取用户详细信息
		JkUserInfo jkUserInfo = userInfoService.getUserInfo(userid).getT();
		// 登陆后获取标签信息
		List<JkTags> taglist = TagService.getTagsList(userid, 0);
		// 是否通过认证
		JkUserCeritifired jkUserCeritifired = userCeritifiredService.ischecked(userid, 1);
		// 是否等待认证
		JkUserCeritifired jkUserCeritifiredwait = userCeritifiredService.ischecked(userid, 0);

		int appcount = projectApplyService.selectcountbyuid(userid);

		// 登陆后获取我的项目收藏数
		int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
		// 登陆后获取我的头条收藏数
		int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
		model.addAttribute("collectioncount", totalcollectionpro + totalcollectionnews);
		model.addAttribute("jkUserCeritifiredwait", jkUserCeritifiredwait);
		model.addAttribute("jkUserCeritifired", jkUserCeritifired);
		model.addAttribute("appcount", appcount);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);

		return "user-authentication";

	}
}
