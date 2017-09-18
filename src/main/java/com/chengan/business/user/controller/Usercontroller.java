package com.chengan.business.user.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
import com.chengan.business.repo.model.JkProjectCate;
import com.chengan.business.repo.model.JkSysMesg;
import com.chengan.business.repo.model.JkSysSms;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserCeritifired;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.repo.model.JkWXUser;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.tag.service.TagMatchService;
import com.chengan.business.tag.service.TagService;
import com.chengan.business.user.service.UserCeritifiredService;
import com.chengan.business.user.service.UserCollectionService;
import com.chengan.business.user.service.UserInfoService;
import com.chengan.business.util.MD5Util;
import com.chengan.business.util.OSSClientUtil;
import com.github.pagehelper.Page;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/user")
public class Usercontroller extends BaseController {
	@Autowired
	OSSClientUtil ossUtil;
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
	UserCeritifiredService userCeritifiredService;

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

	@RequestMapping(value = "toUserCenter", method = RequestMethod.GET)
	public String toUserCenterJsp(HttpServletRequest req) {
		@SuppressWarnings("unused")
		JkUser jkuser = (JkUser) req.getSession().getAttribute("jkuser");
		return "userCenter";
	}

	// 去项目管理
	@RequestMapping(value = "toMyProject", method = RequestMethod.GET)
	public String toMyProject(HttpServletRequest req, Model model) {
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

		List<JkProjectCate> catelist = projectCateService.getFirstCateList();
		int appcount = projectApplyService.selectcountbyuid(userid);
		// 登陆后获取我的项目收藏数
		int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
		// 登陆后获取我的头条收藏数
		int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
		model.addAttribute("collectioncount", totalcollectionpro + totalcollectionnews);
		model.addAttribute("catelist", catelist);
		model.addAttribute("appcount", appcount);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		return "user-publish";
	}

	// 去头条管理
	@RequestMapping(value = "toMyNews", method = RequestMethod.GET)
	public String toMyNews(HttpServletRequest req, int id, Model model) {
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
		List<JkProjectCate> catelist = projectCateService.getFirstCateList();
		int appcount = projectApplyService.selectcountbyuid(userid);
		// 登陆后获取我的项目收藏数
		int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
		// 登陆后获取我的头条收藏数
		int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
		model.addAttribute("collectioncount", totalcollectionpro + totalcollectionnews);
		model.addAttribute("catelist", catelist);
		model.addAttribute("appcount", appcount);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		return "user-news";
	}

	// 去安全管理
	@RequestMapping(value = "toSecurity", method = RequestMethod.GET)
	public String toSecurity(HttpServletRequest req, Model model) {
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
		int appcount = projectApplyService.selectcountbyuid(userid);
		// 登陆后获取我的项目收藏数
		int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
		// 登陆后获取我的头条收藏数
		int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
		model.addAttribute("collectioncount", totalcollectionpro + totalcollectionnews);
		model.addAttribute("appcount", appcount);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);

		return "security";

	}
	
	@RequestMapping(value = "getFansList", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getFansList(HttpServletRequest req, @RequestParam(required=false) Integer pageNumber, @RequestParam(required=false) Integer pageSize, @RequestParam(required=true) Integer id, @RequestParam(required=true) String username) {
		return getResult("rows", fansFollowsService.selectfanslistpage(pageNumber, pageSize, id, username));
	}
	
	@RequestMapping(value = "getFollowsList", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getFollowsList(HttpServletRequest req, @RequestParam(required=false) Integer pageNumber, @RequestParam(required=false) Integer pageSize, @RequestParam(required=true) Integer id, @RequestParam(required=true) String username) {
		return getResult("rows", fansFollowsService.selectfollowslistpage(pageNumber, pageSize, id, username));
	}

	/**
	 * 去积分中心页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toIntegral", method = RequestMethod.GET)
	public String toIntegral(HttpServletRequest req, Model model) {
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
		// 登陆后获取我的项目收藏数
		int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
		// 登陆后获取我的头条收藏数
		int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
		model.addAttribute("collectioncount", totalcollectionpro + totalcollectionnews);
		model.addAttribute("appcount", appcount);
		model.addAttribute("myFollowslist", myFollowslist);
		model.addAttribute("fanslist", fanslist);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		model.addAttribute("type", "1");
		return "integral";
	}

	/**
	 * 去兑换明细页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toExchange", method = RequestMethod.GET)
	public String toExchange(HttpServletRequest req, Model model) {
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
		// 登陆后获取我的项目收藏数
		int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
		// 登陆后获取我的头条收藏数
		int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
		model.addAttribute("collectioncount", totalcollectionpro + totalcollectionnews);
		model.addAttribute("appcount", appcount);
		model.addAttribute("myFollowslist", myFollowslist);
		model.addAttribute("fanslist", fanslist);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		model.addAttribute("type", "1");
		return "exchange-record";
	}

	/**
	 * 去兑换页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toIntegralDetils", method = RequestMethod.GET)
	public String toIntegralDetils(HttpServletRequest req, Model model) {
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
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

		int countofexchang = scoreExchangeService.selectcountofexshop(userid, 1);
		// 登陆后获取我的项目收藏数
		int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
		// 登陆后获取我的头条收藏数
		int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
		model.addAttribute("collectioncount", totalcollectionpro + totalcollectionnews);
		model.addAttribute("countofexchang", countofexchang);
		model.addAttribute("appcount", appcount);
		model.addAttribute("myFollowslist", myFollowslist);
		model.addAttribute("fanslist", fanslist);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		model.addAttribute("type", "1");
		return "integral-exchange";
	}

	// 去认证管理
	@RequestMapping(value = "toAuthentication", method = RequestMethod.GET)
	public String toAuthentication(HttpServletRequest req, Model model) {
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

		return "authentication";

	}

	// 去修改用户
	@RequestMapping(value = "moduserinfo", method = RequestMethod.GET)
	public String toModuseinfo(HttpServletRequest req, Model model) {
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
		int appcount = projectApplyService.selectcountbyuid(userid);
		// 登陆后获取我的项目收藏数
		int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
		// 登陆后获取我的头条收藏数
		int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
		model.addAttribute("collectioncount", totalcollectionpro + totalcollectionnews);
		model.addAttribute("appcount", appcount);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		return "user-modify";
	}

	@RequestMapping(value = "toUserInfo", method = RequestMethod.GET)
	public String toUserInfoJsp() {
		return "userinfo";
	}

	/**
	 * 获取用户信息
	 * 
	 * @param 用户id
	 **/
	@RequestMapping(value = "getUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getUserInfo(@RequestParam(required = true) int id) {
		JkUserInfo jkUserInfo = userInfoService.getUserInfo(id).getT();
		Map<Object, Object> ret = getResult("userinfo", jkUserInfo);
		ret.put("user", userService.getUserById(id));
		ret.put("taglist", TagService.getTagsList(id, 0));
		return ret;
	}

	/**
	 * 修改用户信息
	 * 
	 * @param 用户id
	 * @throws ParseException
	 **/
	@RequestMapping(value = "modUser", method = RequestMethod.POST)
	@ResponseBody
	public synchronized Map<Object, Object> modUser(JkUserInfo jkUserInfo, JkUser jkUser,
			@RequestParam(required = false) String ulocation, @RequestParam(required = false) String ulocationinfo,
			@RequestParam(required = false) Integer uid, @RequestParam(required = false) String tags,
			@RequestParam(required = false) Integer uinfoid) throws ParseException {
		jkUserInfo.setLocation(ulocationinfo);
		jkUser.setLocation(ulocation);
		JkUserInfo sqluserinfo = userInfoService.getUserInfo(uid).getT();
		jkUser.setId(uid);
		if (sqluserinfo != null) {
			jkUserInfo.setId(sqluserinfo.getId());
		}
		userInfoService.updateuser(jkUserInfo, jkUser, tags);

		return getResult(" ", null);
	}
	
	@RequestMapping(value = "modUserBackground", method = RequestMethod.POST)
	@ResponseBody
	public synchronized Map<Object, Object> modUserBackground(@RequestParam(required = false) Integer uid,
			@RequestParam(required = false) String backgroundPicture) throws ParseException {
		JkUser jkUser = new JkUser();
		jkUser.setId(uid);
		jkUser.setBackgroundPicture(backgroundPicture);
		userService.updatenotnull(jkUser);

		return getResult(" ", null);
	}

	// 修改用户图片
	@RequestMapping(value = "modelbackgroundpicture", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> modelbackgroundpicture(
			@RequestParam(value = "file", required = false) CommonsMultipartFile[] files,
			@RequestParam(required = false, defaultValue = "0") Integer type,
			@RequestParam(required = false, defaultValue = "0") Integer isCover, HttpServletRequest req) {

		List<String> urlList = new ArrayList<>();
		if (files == null)
			return getResult(false, "no files");
		if (isCover == 1 && files.length > 0) {
			files = new CommonsMultipartFile[] { files[files.length - 1] };
		}
		for (MultipartFile f : files) {
			String name = ossUtil.uploadImg2Oss(f);
			String url = ossUtil.getImgUrl(name);
			urlList.add(url);
			InputStream is = null, is1 = null;
			ByteArrayOutputStream bos = null;
			if (type != null && type == 1) {
				try {
					is = f.getInputStream();
					bos = new ByteArrayOutputStream();
					// 压缩图片
					Thumbnails.of(is).scale(0.4).toOutputStream(bos);
					byte[] b = bos.toByteArray();
					is1 = new ByteArrayInputStream(b);
					String newName = name.substring(0, name.lastIndexOf(".")) + "_mini"
							+ name.substring(name.lastIndexOf("."));
					ossUtil.uploadFile2OSS(is1, newName);
					url = ossUtil.getImgUrl(newName);
					urlList.add(url);
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						is.close();
						is1.close();
						bos.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		int loginid = (int) req.getSession().getAttribute("login_userId");
		JkUser jkUser = new JkUser();
		jkUser.setBackgroundPicture(urlList.get(0));
		jkUser.setId(loginid);
		userService.updatenotnull(jkUser);
		return null;

	}

	// 修改头像图片
	@RequestMapping(value = "modelhendpicture", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> modelhendpicture(
			@RequestParam(value = "file", required = false) CommonsMultipartFile[] files,
			@RequestParam(required = false, defaultValue = "0") Integer type,
			@RequestParam(required = false, defaultValue = "0") Integer isCover, HttpServletRequest req) {

		List<String> urlList = new ArrayList<>();
		if (files == null)
			return getResult(false, "no files");
		if (isCover == 1 && files.length > 0) {
			files = new CommonsMultipartFile[] { files[files.length - 1] };
		}
		for (MultipartFile f : files) {
			String name = ossUtil.uploadImg2Oss(f);
			String url = ossUtil.getImgUrl(name);
			urlList.add(url);
			InputStream is = null, is1 = null;
			ByteArrayOutputStream bos = null;
			if (type != null && type == 1) {
				try {
					is = f.getInputStream();
					bos = new ByteArrayOutputStream();
					// 压缩图片
					Thumbnails.of(is).scale(0.4).toOutputStream(bos);
					byte[] b = bos.toByteArray();
					is1 = new ByteArrayInputStream(b);
					String newName = name.substring(0, name.lastIndexOf(".")) + "_mini"
							+ name.substring(name.lastIndexOf("."));
					ossUtil.uploadFile2OSS(is1, newName);
					url = ossUtil.getImgUrl(newName);
					urlList.add(url);
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						is.close();
						is1.close();
						bos.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		int loginid = (int) req.getSession().getAttribute("login_userId");
		JkUser jkUser = new JkUser();
		jkUser.setHeadPicPath(urlList.get(0));
		jkUser.setId(loginid);
		userService.updatenotnull(jkUser);
		return null;

	}

	// 修改密码
	@RequestMapping(value = "modUserPassWord", method = RequestMethod.POST)
	@ResponseBody
	public String moduserpassword(@RequestParam(required = false) String hipassword,
			@RequestParam(required = false) String newpassword1, @RequestParam(required = false) String newpassword2,
			HttpServletRequest req, HttpServletResponse rep) {
		System.out.println("1111111");
		int id = (int) req.getSession().getAttribute("login_userId");
		JkUser hijkuser = userService.getUserById(id);
		String hipwmad5 = MD5Util.md5(hipassword.toString().getBytes());
		if (hijkuser.getPassword().equals(hipwmad5) && newpassword1.equals(newpassword2)) {
			hijkuser.setPassword(MD5Util.md5(newpassword1.toString().getBytes()));
			userService.updatenotnull(hijkuser);
			// try {
			// req.getRequestDispatcher(req.getContextPath()+"/login/toLogin").forward(req,rep);
			// } catch (ServletException | IOException e) {
			// // TODO Auto-generated catch block
			// e.printStackTrace();
			// }

			return "1";
		}
		return "0";
	}

	// 确认验证码
	@RequestMapping(value = "checkYzid", method = RequestMethod.POST)
	@ResponseBody
	public String checkYzid(@RequestParam(required = true) String phone, @RequestParam(required = true) String yzCode,
			@RequestParam(required = true) String sid) {
		JkSysSms result = smsService.checkYzCode(phone, yzCode, sid).getT();
		if (result != null) {
			return "1";
		} else {
			return "0";
		}
	}

	// 修改用户手机
	@RequestMapping(value = "moduserphone", method = RequestMethod.POST)
	@ResponseBody
	public String moduserphone(@RequestParam(required = true) String phone,
			@RequestParam(required = true) String yzCode, @RequestParam(required = true) String sid,
			HttpServletRequest req, HttpServletResponse resp) {
		JkSysSms jkSysSms = smsService.checkYzCode(phone, yzCode, sid).getT();
		// 模拟微信登陆
		// req.getSession().setAttribute("login_openId","odn33v2GMKMcd_KNR1BW36JoS5y8");
		Object id = req.getSession().getAttribute("login_userId");
		Object openId = req.getSession().getAttribute("login_openId");
		if (jkSysSms != null) {
			if (id != null) {
				JkUser jkUser = userService.getUserById((int) id);
				jkUser.setPhone(phone);
				jkUser.setUsername(phone);
				userService.updatenotnull(jkUser);
				return "1";// 直接修改成功
			} else if (id == null && openId != null) {
				// 通过 openid获取微信
				JkWXUser jkWXUser = loginService.selectWXUser((String) openId);
				// 通过手机号 获取user对象
				JkUser jkUser = loginService.isUserExistsByPhone(phone).getT();
				// 修改微信 手机
				if (jkUser == null) {
					return "3"; // 区注册页面
				}
				jkWXUser.setPhone(phone);

				jkUser.setWxopenid((String) openId);
				WxUserService.update(jkWXUser);
				userService.updatenotnull(jkUser);
				req.getSession().setAttribute("user_level", 1);
				req.getSession().setAttribute("login_userId", jkUser.getId());
				return "1";// 绑定成功
			} else {				// 不是微信
				return "3";
			}
		} else {
			return "0";
		}
	}

	// 获取用户列表
	@RequestMapping(value = "getUserList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getUserList(@RequestParam(required = false) String usernmae,
			@RequestParam(required = false) String nicknmae, @RequestParam(required = false) List<Integer> tags,
			@RequestParam(required = false) String location, @RequestParam(required = false) Integer gender,
			@RequestParam(required = false) Integer userlevel, @RequestParam(required = false) String orderStr,
			@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer pageSize) {
		List<Integer> userid = null;
		if (tags != null && tags.size() > 0)
			userid = tagMatchService.getUserIdByTagPid(tags, 0);
		List<Map<String, Object>> list = userInfoService.getUserList(userid, usernmae, nicknmae, location, null, gender,
				userlevel, orderStr, null, page, pageSize);
		Map<Object, Object> map = getResult("newsList", list);
		// 分页数据树
		map.put("pages", ((Page<Map<String, Object>>) list).getPages());
		map.put("total", ((Page<Map<String, Object>>) list).getTotal());
		return map;

	}

	// 获取用户列表
	@RequestMapping(value = "getUserCollect", method = RequestMethod.GET)
	public String tousercollect(Model model, HttpServletRequest req) {
		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		// 登陆后获取用户信息
		JkUser jkUser = userService.getUserById(userid);
		// 登陆后获取用户详细信息
		JkUserInfo jkUserInfo = userInfoService.getUserInfo(userid).getT();
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		return "user-favorites";

	}

	// 获取置顶用户
	@RequestMapping(value = "getuserlisttop", method = RequestMethod.POST)
	@ResponseBody
	public List<JkUser> getuserlisttop(Integer type) {
		return userService.getuserlisttop(type);
	}

	@RequestMapping(value = "toNoticeById", method = RequestMethod.GET)
	public String toNotice(int id, Model model) {
		List<JkSysMesg> list = mesgService.getJkSysMesgList(null, null, null, null, null, id);

		model.addAttribute("JkSysMesg", list.get(0));
		return "notice";
	}

}
