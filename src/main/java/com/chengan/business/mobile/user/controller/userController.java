package com.chengan.business.mobile.user.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chengan.business.artcle.service.ArtcleService;
import com.chengan.business.fans.service.FansService;
import com.chengan.business.fansfollows.service.FansFollowsService;
import com.chengan.business.follows.service.FollowsSevice;
import com.chengan.business.login.service.LoginService;
import com.chengan.business.login.service.SmsAlidayuService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.operate.service.AdmireService;
import com.chengan.business.operate.service.CollectService;
import com.chengan.business.operate.service.CommentService;
import com.chengan.business.project.service.ProjectApplyService;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserCeritifired;
import com.chengan.business.repo.model.JkUserFansFollows;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.score.service.ScoreMallService;
import com.chengan.business.tag.service.TagService;
import com.chengan.business.user.service.UserCeritifiredService;
import com.chengan.business.user.service.UserHistoryService;
import com.chengan.business.user.service.UserInfoService;
// import com.sleepycat.je.tree.IN;

@Controller
@RequestMapping("/mobileuserino")
public class userController {

	@Autowired
	SmsAlidayuService smsService;
	@Autowired
	ProjectService projectService;
	@Autowired
	LoginService loginService;
	@Autowired
	TagService tagService;
	@Autowired
	ProjectApplyService projectApplyService;
	@Autowired
	ProjectCateService projectCateService;
	@Autowired
	CollectService collectService;
	@Autowired
	AdmireService admireService;
	@Autowired
	ArtcleService artcleService;
	@Autowired
	UserService userService;
	@Autowired
	UserInfoService userInfoService;
	@Autowired
	TagService TagService;
	@Autowired
	FansService fansService;
	@Autowired
	FollowsSevice followsSevice;
	@Autowired
	CommentService commentService;
	@Autowired
	UserHistoryService userHistoryService;
	@Autowired
	ScoreMallService scoreMallService;
	@Autowired
	ScoreExchangeService scoreExchangeService;
	@Autowired
	UserCeritifiredService userCeritifiredService;

	@Autowired
	mesgService mesgService;

	@Autowired
	FansFollowsService fansFollowsService;

	@RequestMapping(value = "toMobileUserMesg", method = RequestMethod.GET)
	public String tomesg() {
		return "mobile/user-message";
	}

	// 去用户详情页
	@RequestMapping(value = "toMobileUserInfo", method = RequestMethod.GET)
	public String toUserInfo(HttpServletRequest req, Model model) {
		// Integer
		// userid=(Integer)req.getSession().getAttribute("login_userId");
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/bind-mobile-newphone";
		}
		int userid = (int) sessionid;
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
		// 登陆后获取我的粉丝
		// List<JkUserFans> fanslist=fansService.getfanslist(userid,null, null,
		// null);
		// 登陆后获取我的关注
		// List<JkUserFollows>
		// myFollowslist=followsSevice.getFllowsListByUid(userid);
		List<Map<String, Object>> fanslist = fansFollowsService.selectfanslist(userid, null);
		List<Map<String, Object>> myFollowslist = fansFollowsService.selectfollowslist(userid, null);
		// 登陆后获取申请项目数量
		int appcount = projectApplyService.selectcountbyuid(userid);
		model.addAttribute("appcount", appcount);
		model.addAttribute("myFollowslist", myFollowslist);
		model.addAttribute("fanslist", fanslist);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		model.addAttribute("type", "1");
		return "mobile/user-home";
	}

	// 去其他用户详情页
	@RequestMapping(value = "toMobileOtherUserInfo", method = RequestMethod.GET)
	public String toOtherUserInfo(HttpServletRequest req, Model model, int userid) {
		// Integer
		// userid=(Integer)req.getSession().getAttribute("login_userId");
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/bind-mobile-newphone";
		}
		int loginid = (int) sessionid;
		System.out.println(loginid == userid);
		if (loginid == userid) {
			this.toUserInfo(req, model);// 如果目标用户 和登陆用户是相同的，去自己首页
			return "mobile/user-home";
		}
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
		// 登陆后获取我的粉丝
		// List<JkUserFans> fanslist=fansService.getfanslist(userid,null, null,
		// null);
		// 登陆后获取我的关注
		// List<JkUserFollows>
		// myFollowslist=followsSevice.getFllowsListByUid(userid);
		List<Map<String, Object>> fanslist = fansFollowsService.selectfanslist(userid, null);
		List<Map<String, Object>> myFollowslist = fansFollowsService.selectfollowslist(userid, null);
		// 登陆后获取申请项目数量
		int appcount = projectApplyService.selectcountbyuid(userid);
		JkUserFansFollows jkUserFansFollows = fansFollowsService.getOneFansByFollowId(loginid, userid);
		model.addAttribute("jkUserFansFollows", jkUserFansFollows);
		model.addAttribute("appcount", appcount);
		model.addAttribute("myFollowslist", myFollowslist);
		model.addAttribute("fanslist", fanslist);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		model.addAttribute("type", "0");
		return "mobile/user-home";
	}

	// 去用户修改页面
	@RequestMapping(value = "toModUserInfo", method = RequestMethod.GET)
	public String toModUserInfo(Model model, HttpServletRequest req) {
		// Integer
		// userid=(Integer)req.getSession().getAttribute("login_userId");
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/bind-mobile-newphone";
		}
		int userid = (int) sessionid;

		// 登陆后获取用户信息
		JkUser jkUser = userService.getUserById(userid);
		// 登陆后获取用户详细信息
		JkUserInfo jkUserInfo = userInfoService.getUserInfo(userid).getT();
		// 登陆后获取标签信息
		List<JkTags> taglist = TagService.getTagsList(userid, 0);
		int appcount = projectApplyService.selectcountbyuid(userid);
		model.addAttribute("appcount", appcount);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		return "mobile/user-modify";
	}

	// 去用户首页
	@RequestMapping(value = "toUserIndex", method = RequestMethod.GET)
	public String toUserInfex(HttpServletRequest req, Model model) {
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/bind-mobile-newphone";
		}
		int userid = (int) sessionid;
		// int userid=1;
		// 登陆后获取用户信息
		JkUser jkUser = userService.getUserById(userid);
		// 登陆后获取用户详细信息
		JkUserInfo jkUserInfo = userInfoService.getUserInfo(userid).getT();
		// 登陆后获取标签信息
		List<JkTags> taglist = TagService.getTagsList(userid, 0);
		String count = mesgService.getcountbyuidnotread(userid);
		model.addAttribute("count", count);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		return "mobile/user";
	}

	// 去认证管理
	@RequestMapping(value = "touserauth", method = RequestMethod.GET)
	public String toUserAuth(HttpServletRequest req, Model model, Integer type) {
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/bind-mobile-newphone";
		}
		int userid = (int) sessionid;
		// int userid=1;
		JkUserCeritifired jkUserCeritifired = userCeritifiredService.ischecked(userid, 1);
		model.addAttribute("loginid", userid);
		model.addAttribute("jkUserCeritifired", jkUserCeritifired);
		model.addAttribute("type", type);
		return "mobile/user-auth";
	}

	@RequestMapping(value = "touserauthcomp", method = RequestMethod.GET)
	public String touserauthcomp(HttpServletRequest req, Integer type, Model model) {
		model.addAttribute("type", type);
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/bind-mobile-newphone";
		}
		int userid = (int) sessionid;
		model.addAttribute("loginid", userid);
		JkUserCeritifired jkUserCeritifired = userCeritifiredService.ischecked(userid, 1);
		model.addAttribute("jkUserCeritifired", jkUserCeritifired);
		return "mobile/user-auth-comp";
	}

	// 去安全管理
	@RequestMapping(value = "tousersecurity", method = RequestMethod.GET)
	public String tousersecurity(HttpServletRequest req, Model model) {
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		JkUser jkUser = userService.getUserById(userid);
		JkUserInfo jkUserInfo = userInfoService.getUserInfo(userid).getT();
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		return "mobile/user-security";
	}

	// 去修改密码
	@RequestMapping(value = "tomodpassword", method = RequestMethod.GET)
	public String toModPassword(HttpServletRequest req, Model model) {
		/*
		 * Object sessionid=req.getSession().getAttribute("login_userId");
		 * if(sessionid==null){ return "mobile/login"; }
		 */
		// int userid=(int)sessionid;
		// 登陆后获取用户信息
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		JkUser jkUser = userService.getUserById(userid);
		model.addAttribute("jkuser", jkUser);
		return "mobile/modify-password";
	}

	// 去验证老手机手机
	@RequestMapping(value = "tomodphone", method = RequestMethod.GET)
	public String toModphone(HttpServletRequest req, Model model) {
		/*
		 * Object sessionid=req.getSession().getAttribute("login_userId");
		 * if(sessionid==null){ return "mobile/login"; }
		 */
		// int userid=(int)sessionid;
		// 登陆后获取用户信息
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		JkUser jkUser = userService.getUserById(userid);
		model.addAttribute("jkuser", jkUser);
		return "mobile/bind-mobile";
	}

	// 去新手机
	@RequestMapping(value = "tomonewdphone", method = RequestMethod.GET)
	public String toModnewphone(Model model) {
		/*
		 * Object sessionid=req.getSession().getAttribute("login_userId");
		 * if(sessionid==null){ return "mobile/login"; }
		 */
		// int userid=(int)sessionid;
		// 登陆后获取用户信息
		return "mobile/bind-mobile-newphone";
	}

	@RequestMapping(value = "touserfavorite", method = RequestMethod.GET)
	public String touserfavorite(HttpServletRequest req) {
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		return "mobile/user-favorite";
	}

	@RequestMapping(value = "tomyfolloeslist", method = RequestMethod.GET)
	public String toMyFollowsList(HttpServletRequest req) {
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		return "mobile/user-attention";
	}
	
	@RequestMapping(value = "tomyfanslist", method = RequestMethod.GET)
	public String toMyFansList(HttpServletRequest req) {
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		return "mobile/user-fans";
	}

	@RequestMapping(value = "toUserChet", method = RequestMethod.GET)
	public String toUserChet(HttpServletRequest req, Integer userid, Model model) {

		model.addAttribute("userid", userid);
		Integer loginid = (Integer) req.getSession().getAttribute("login_userId");
		JkUser jkUser = userService.getUserById(loginid);
		model.addAttribute("loginuser", jkUser);
		return "mobile/chat";
	}

	@RequestMapping(value = "toauhome", method = RequestMethod.GET)
	public String toUserChet(HttpServletRequest req, Model model) {
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			// return "mobile/register";

		}
		int userid = (int) sessionid;
		// 是否等待认证
		JkUserCeritifired jkUserCeritifiredwait = userCeritifiredService.ischecked(userid, 0);

		JkUserCeritifired jkUserCeritifired = userCeritifiredService.ischecked(userid, 1);
		model.addAttribute("jkUserCeritifired", jkUserCeritifired);
		model.addAttribute("jkUserCeritifiredwait", jkUserCeritifiredwait);
		return "mobile/user-auth-home";
	}

	@RequestMapping(value = "tohotuser", method = RequestMethod.GET)
	public String tohotuser() {
		return "mobile/";
	}

}
