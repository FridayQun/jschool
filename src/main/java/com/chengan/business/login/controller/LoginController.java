package com.chengan.business.login.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.advertisement.service.AdvertisementService;
import com.chengan.business.artcle.service.ArtcleCateService;
import com.chengan.business.artcle.service.ArtcleService;
import com.chengan.business.base.BaseController;
import com.chengan.business.base.BaseService.ServiceResult;
import com.chengan.business.fans.service.FansService;
import com.chengan.business.fansfollows.service.FansFollowsService;
import com.chengan.business.file.service.FileService;
import com.chengan.business.follows.service.FollowsSevice;
import com.chengan.business.foot.service.FooterService;
import com.chengan.business.login.service.LoginService;
import com.chengan.business.login.service.SmsAlidayuService;
import com.chengan.business.login.service.SmsService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.mobile.login.controller.MobileLoginController;
import com.chengan.business.operate.service.AdmireService;
import com.chengan.business.operate.service.CollectService;
import com.chengan.business.operate.service.CommentService;
import com.chengan.business.project.service.ProjectApplyService;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkAdmire;
import com.chengan.business.repo.model.JkAdvertisement;
import com.chengan.business.repo.model.JkFile;
import com.chengan.business.repo.model.JkFoot;
import com.chengan.business.repo.model.JkFootDetail;
import com.chengan.business.repo.model.JkNews;
import com.chengan.business.repo.model.JkNewsCate;
import com.chengan.business.repo.model.JkProject;
import com.chengan.business.repo.model.JkProjectApply;
import com.chengan.business.repo.model.JkProjectCate;
import com.chengan.business.repo.model.JkProjectComment;
import com.chengan.business.repo.model.JkScoreMall;
import com.chengan.business.repo.model.JkSysSms;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserCeritifired;
import com.chengan.business.repo.model.JkUserCollection;
import com.chengan.business.repo.model.JkUserFans;
import com.chengan.business.repo.model.JkUserFansFollows;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.score.service.ScoreMallService;
import com.chengan.business.tag.service.TagService;
import com.chengan.business.user.service.UserCeritifiredService;
import com.chengan.business.user.service.UserCollectionService;
import com.chengan.business.user.service.UserHistoryService;
import com.chengan.business.user.service.UserInfoService;
import com.chengan.business.util.TokenUtil;
import com.chengan.business.util.URLUtil;
import com.github.pagehelper.Page;
import com.mysql.jdbc.StringUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author y
 *
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

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
	ArtcleCateService artcleCateService;
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
	FileService fileService;
	@Autowired
	AdvertisementService advertisementService;
	@Autowired
	UserCeritifiredService userCeritifiredService;
	@Autowired
	FansFollowsService fansFollowsService;
	@Autowired
	UserCollectionService userCollectionService;
	@Autowired
	MobileLoginController mobileLoginController;
	@Autowired
	FooterService footerService;

	/**
	 * 去登陆页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toLogin", method = RequestMethod.GET)
	String toLoginJsp(String error, Model model) {
		model.addAttribute("error", error);
		return "login";
	}

	/**
	 * 去底侧导航栏页面
	 *
	 * @return
	 */
	//	@RequestMapping(value = "toHelp", method = RequestMethod.GET)
	//	public String toHelp(String pageName, Model model) {
	//		model.addAttribute("pageName", pageName);
	//		return pageName;
	//	}
	// NOTE
	// 修改成了跳转到about
	@RequestMapping(value = "toHelp", method = RequestMethod.GET)
	public String toHelp(String pageName, Model model) {
		model.addAttribute("pageName", pageName);
		List<JkFoot> foots = footerService.getListPage(null, null, null, null);
		List<JkFootDetail> details = null;
		for (JkFoot foot : foots) {
			if (StringUtils.isNullOrEmpty(foot.getFootUri()) == false) {
				if (foot.getFootUri().equals(pageName)) {
					details = footerService.getDetailListPage(foot.getId(), null, null);
					break;
				}
			}
		}
		model.addAttribute("foots", foots);
		model.addAttribute("details", details);
		model.addAttribute("detailCount", details.size());
		return "about";
	}

	/**
	 * 去关于鲸客页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toRegister", method = RequestMethod.GET)
	public String toRegisterJsp() {
		return "register";
	}

	/**
	 * 去用户中心页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toUser", method = RequestMethod.GET)
	String toUser(HttpServletRequest req, Model model, @RequestParam(required = false) String item, @RequestParam(required = false) String username) {
		if (item == null || item.length() == 0) {
			// 默认显示项目
			item = "item";
		}

		Integer userid = (Integer) req.getSession().getAttribute("login_userId");
		// 登陆后获取用户信息
		JkUser jkUser = userService.getUserById(userid);
		// 登陆后获取用户详细信息
		JkUserInfo jkUserInfo = userInfoService.getUserInfo(userid).getT();
		// 登陆后获取标签信息
		List<JkTags> taglist = TagService.getTagsList(userid, 0);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		// 是否通过认证
		JkUserCeritifired jkUserCeritifired = userCeritifiredService.ischecked(userid, 1);
		// 是否等待认证
		JkUserCeritifired jkUserCeritifiredwait = userCeritifiredService.ischecked(userid, 0);
		model.addAttribute("jkUserCeritifiredwait", jkUserCeritifiredwait);
		model.addAttribute("jkUserCeritifired", jkUserCeritifired);

		if(item.equals("item")) {
			List<JkProjectCate> catelist = projectCateService.getFirstCateList();
			model.addAttribute("catelist", catelist);
			return "user-item";
		} else if(item.equals("top")) {
			List<JkNewsCate> catelist = artcleCateService.getArtcleCateList(null, null, null, null);
			model.addAttribute("catelist", catelist);
			return "user-top";
		} else if(item.equals("collectionItem")) {
			int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
			int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
			model.addAttribute("totalofproject", totalcollectionpro);
			model.addAttribute("totalofnews", totalcollectionnews);
			return "user-favorite-items";
		} else if(item.equals("collectionTop")) {
			int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
			int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
			model.addAttribute("totalofproject", totalcollectionpro);
			model.addAttribute("totalofnews", totalcollectionnews);
			return "user-favorite-tops";
		} else if(item.equals("authentication")) {
			return "user-authentication";
		} else if(item.equals("security")) {
			return "user-security";
		} else if(item.equals("moduserinfo")) {
			return "user-moduserinfo";
		} else if(item.equals("integral")) {
			int createProjectNum = projectService.getTotalofProjectByIdToday(userid, null).getT();
			int commentProjectNum = commentService.countToday(userid, null, null);
			int createNewsNum = artcleService.getCountToday(userid);
			int applyProjectNum = projectApplyService.selectcountbyuidToday(userid);
			int admireCount = admireService.selectCountToday(userid);
			int collectionCount = userCollectionService.getCountToday(userid);
			model.addAttribute("createProjectNum", createProjectNum);
			model.addAttribute("commentProjectNum", commentProjectNum);
			model.addAttribute("createNewsNum", createNewsNum);
			model.addAttribute("applyProjectNum", applyProjectNum);
			model.addAttribute("admireCount", admireCount);
			model.addAttribute("collectionCount", collectionCount);
			return "user-integral";
		} else if(item.equals("integralDetails")) {
			int countofexchang = scoreExchangeService.selectcountofexshop(userid, 1);
			model.addAttribute("countofexchang", countofexchang);
			return "user-integral-details";
		} else if(item.equals("exchange")) {
			return "user-exchange";
		} else if(item.equals("fans")) {
			// 登陆后获取我的粉丝
			List<Map<String, Object>> fanslist = fansFollowsService.selectfanslist(userid, username);
			model.addAttribute("list", fanslist);
			model.addAttribute("fansFollows", "fans");
			return "user-fans";
		} else if(item.equals("follows")) {
			// 登陆后获取我的关注
			List<Map<String, Object>> myFollowslist = fansFollowsService.selectfollowslist(userid, username);
			model.addAttribute("list", myFollowslist);
			model.addAttribute("fansFollows", "follows");
			return "user-fans";
		}

		/*
		// 登陆后获取项目数量
		List<Integer> projstatuslist = Arrays.asList([-1, 0, 1, 2, 3, 4]);
		int totalofproject = projectService.getTotalofProjectById(userid, projstatuslist).getT();
		// 登陆后获取头条数量
		List<Integer> newsstatuslist = new ArrayList<Integer>();
		newsstatuslist.add(0);
		newsstatuslist.add(1);
		int totalofnews = artcleService.getTotalOfNews(userid, newsstatuslist).getT();
		// 登陆后获取我的粉丝
		List<Map<String, Object>> fanslist = fansFollowsService.selectfanslist(userid);
		// 登陆后获取我的关注
		List<Map<String, Object>> myFollowslist = fansFollowsService.selectfollowslist(userid);
		// 登陆后获取申请项目数量
		int appcount = projectApplyService.selectcountbyuid(userid);
		// 登陆后获取我的项目收藏数
		int totalcollectionpro = userCollectionService.getcollectList(userid, 1, null, null).size();
		// 登陆后获取我的头条收藏数
		int totalcollectionnews = userCollectionService.getcollectList(userid, 2, null, null).size();
		// 获取自己是否认证
		JkUserCeritifired jkUserCeritifired = userCeritifiredService.ischecked(userid, 1);

		model.addAttribute("jkUserCeritifired", jkUserCeritifired);
		model.addAttribute("collectioncount", totalcollectionpro + totalcollectionnews);
		model.addAttribute("appcount", appcount);
		model.addAttribute("myFollowslist", myFollowslist);
		model.addAttribute("fanslist", fanslist);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		*/
		return "user";
	}

	/**
	 * 去其他用户中心页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toOtherUser", method = RequestMethod.GET)
	String toOtherUser(HttpServletRequest req, Integer userid, @RequestParam(required = false) String item, @RequestParam(required = false) String username, Model model) {
		// type 1 表示自己中心页面 0 表示别人 中心页面 会隐藏和修改部分信息

		Object loginid = req.getSession().getAttribute("login_userId");
		if (loginid == null) {
			return "login";
		}

		if (loginid.equals(userid)) {
			return this.toUser(req, model, null, null);
		}
		List<Integer> projstatuslist = new ArrayList<Integer>();
		projstatuslist.add(1);
		projstatuslist.add(3);
		projstatuslist.add(4);
		// 登陆后获取项目数量
		int totalofproject = projectService.getTotalofProjectById(userid, projstatuslist).getT();
		// 登陆后获取头条数量
		List<Integer> newsstatuslist = new ArrayList<Integer>();
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

		List<Map<String, Object>> fanslist = fansFollowsService.selectfanslist(userid, username);
		List<Map<String, Object>> myFollowslist = fansFollowsService.selectfollowslist(userid, username);
		JkUserFansFollows jkUserFansFollows = fansFollowsService.getOneFansByFollowId((Integer) loginid, userid);
		// 获取用户是否认证
		JkUserCeritifired jkUserCeritifired = userCeritifiredService.ischecked(userid, 1);
		model.addAttribute("jkUserCeritifired", jkUserCeritifired);
		model.addAttribute("jkUserFansFollows", jkUserFansFollows);
		model.addAttribute("myFollowslist", myFollowslist);
		model.addAttribute("fanslist", fanslist);
		model.addAttribute("totalofproject", totalofproject);
		model.addAttribute("totalofnews", totalofnews);
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);
		model.addAttribute("type", 0);
		if(item!= null && item.equals("fans")) {
			model.addAttribute("fansFollows", "fans");
			model.addAttribute("list", fanslist);
			return "otherUserFans";
		} else if(item != null && item.equals("follows")) {
			model.addAttribute("fansFollows", "follows");
			model.addAttribute("list", myFollowslist);
			return "otherUserFans";
		}
		return "otherUser";
	}

	/**
	 * 去校园头条页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toHeadline", method = RequestMethod.GET)
	String toHeadline(Model model, @RequestParam(required = false, defaultValue = "1") Integer page,
					  @RequestParam(required = false, defaultValue = "20") Integer pageSize,
					  @RequestParam(required = false, defaultValue = "-1") Integer type,
					  @RequestParam(required = false) String keywords, @RequestParam(required = false) String tagName) {
		// 当前头条的分类列表
		List<JkNewsCate> cateList = artcleCateService.getArtcleCateList(null, null, null, null);

		// 首次进入的项目列表
		List<JkNews> newsList = artcleService.getArtcleList(keywords, null, type, null, 1, null, page, 5);

		model.addAttribute("cateList", cateList);
		// 头条列表数据
		model.addAttribute("newsList", newsList);
		// 分页总页数
		model.addAttribute("pages", ((Page<JkNews>) newsList).getPages());
		model.addAttribute("total", ((Page<JkNews>) newsList).getTotal());
		// 分类
		model.addAttribute("type", type);
		// 导航栏名
		model.addAttribute("tagName", tagName);
		// 搜索关键字
		if (!StringUtils.isNullOrEmpty(keywords))
			model.addAttribute("keywords", keywords);

		return "headline";
	}

	/**
	 * 去红人馆页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toCelebrity", method = RequestMethod.GET)
	String toCelebrity(Model model, String keywords, String tagName) {
		// 标签列表
		List<JkTags> jkTagList = new ArrayList<JkTags>();
		jkTagList = tagService.getAllTagsList(0);
		// 获取广告位
		List<JkAdvertisement> celebretyAds = advertisementService.getListPageOfAd(null, 3, 1, 3) == null
				|| advertisementService.getListPageOfAd(null, 3, 1, 3).size() <= 0 ? null
				: advertisementService.getListPageOfAd(null, 3, 1, 3);

		List<Map<String, Object>> recomments = userService.getTopUser(3);
		model.addAttribute("recomments", recomments);
		model.addAttribute("jkTagList", jkTagList);
		model.addAttribute("celebretyAds", celebretyAds);
		// 搜索关键字
		model.addAttribute("keywords", keywords);
		model.addAttribute("tagName", tagName);

		return "celebrity";
	}

	/**
	 * 去发布头条页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toNewsPublish", method = RequestMethod.GET)
	String toNewsPublish(Model model) {
		List<JkNewsCate> cates = artcleCateService.getArtcleCateList(null, null, null, null);
		model.addAttribute("cates", cates);
		return "headline-publish";
	}

	/**
	 * 去头条详情页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toNewsDetails", method = RequestMethod.GET)
	String toNewsDetails(HttpServletRequest request, Model model, Integer id) {
		// 获取登录用户
		JkUser user = userService.getUserBySession(request);
		// 初始化热门资讯
		List<JkNews> newsList = artcleService.getArtcleList(null, null, null, null, 1, null, 1, 10);
		model.addAttribute("newsList", newsList);
		// 广告位
		List<JkAdvertisement> newsAds = advertisementService.getListPageOfAd(null, 4, 1, 3);
		model.addAttribute("newsAds", newsAds);



		if(id == -1) {
			if(user != null) {
				model.addAttribute("user", user);
				model.addAttribute("jkUser", user);
				ServiceResult<JkUserInfo> JkUserInfo = userInfoService.getUserInfo(user.getId());
				model.addAttribute("JkUserInfo", JkUserInfo.getT());
			}
			return "headline-preview2";
		}



		// 获取头条详情
		JkNews jkNews = artcleService.getNewsById(id);
		// 获取头条发布者详情
		JkUser jkUser = null;
		if (jkNews != null) {
			jkUser = userService.getUserById(jkNews.getUid());
			ServiceResult<JkUserInfo> JkUserInfo = userInfoService.getUserInfo(jkUser.getId());
			model.addAttribute("JkUserInfo", JkUserInfo.getT());
		}
		// 获取头条的评论
		List<Map<Object, Object>> commentList = commentService.selectCimmentList(null, jkNews.getId(), 2, 1, 10);
		int commentsCount = commentService.count(null, jkNews.getId(), 2);
		// 该项目浏览量自增1
		artcleService.addBrowsevolume(id);
		// 我是否关注该头条
		JkUserFansFollows jkUserFansFollows = null;
		if (user != null)
			jkUserFansFollows = fansFollowsService.getOneFansByFollowId(user.getId(), jkNews.getUid());
		model.addAttribute("jkUserFansFollows", jkUserFansFollows);

		// 用户已登录状态下，获取该用户是否点赞、收藏该头条
		int hasCollect = 0;
		int hasAdmire = 0;
		if (user != null) {
			// 1.
			// 获取点赞和收藏对象，判断是否被点赞和被收藏
			JkUserCollection jkUserCollection = collectService.selectCollect(jkNews.getId(), user.getId(), 2);
			JkAdmire JkAdmire = admireService.selectAdmire(jkNews.getId(), user.getId(), 2, 0);
			if (jkUserCollection != null)
				hasCollect = 1;
			if (JkAdmire != null)
				hasAdmire = 1;
			model.addAttribute("hasCollect", hasCollect);
			model.addAttribute("hasAdmire", hasAdmire);

			// 2.
			// 创建用户浏览记录
			userHistoryService.save(2, id, user.getId(), jkNews.getHeadPicPath(), "浏览头条");

		}

		model.addAttribute("user", user);
		model.addAttribute("jkNews", jkNews);
		model.addAttribute("jkUser", jkUser);
		model.addAttribute("commentList", commentList);
		model.addAttribute("commentsCount", commentsCount);

		return "headline-details";
	}

	/**
	 * 去忘记密码页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toForgetPw", method = RequestMethod.GET)
	public String toForgetPw() {
		return "passwd-find";
	}

	/**
	 * 去发布项目页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toPublish", method = RequestMethod.GET)
	public String toPublish(HttpServletRequest request, Model model, Integer pid) {
		HttpSession session = request.getSession();
		Object login_userId = session.getAttribute("login_userId");
		model.addAttribute("login_userId", login_userId);
		// 查询草稿
		JkProject dreaftProj = projectService.getProjectById(pid);
		if (dreaftProj == null) {
			return "publish";
		}
		if (dreaftProj != null) {
			// 去掉回车空格符
			Pattern p = Pattern.compile("\\r|\n");
			dreaftProj.setProjDesc(p.matcher(dreaftProj.getProjDesc()).replaceAll(""));
			// zai zhe li ti huan
			dreaftProj.setProjDesc(dreaftProj.getProjDesc().replaceAll("\"", "\\\\\\\""));
			System.out.println("test------------------------------------>>>>>>>>>>>>>");
			model.addAttribute("dreaftProj", JSONObject.fromObject(dreaftProj).toString());
		}
		// 草稿项目关联的标签
		List<JkTags> dreaftTagList = tagService.getTagsList(pid, 1);
		if (dreaftTagList != null && dreaftTagList.size() > 0)
			model.addAttribute("dreaftTagList", JSONArray.fromObject(dreaftTagList).toString());
		// 草稿项目关联的类目
		if (dreaftProj.getCid() != null) {
			JkProjectCate dreaftCate = projectCateService.getCateById(dreaftProj.getCid());
			if (dreaftCate != null)
				model.addAttribute("dreaftCate", JSONObject.fromObject(dreaftCate).toString());
		}
		return "publish";
	}

	/**
	 * 去项目申请页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toProjectApply", method = RequestMethod.GET)
	public String toProjectApply(Integer projId, String projName, Model model) {
		model.addAttribute("projId", projId);
		model.addAttribute("projName", projName);
		return "project-apply";
	}

	/**
	 * 去项目预览页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toProjectPreview", method = RequestMethod.GET)
	public String toProjectApply(Integer id, Model model, HttpServletRequest request) {
		// 项目详情
		JkProject JkProject = projectService.getProjectById(id);
		model.addAttribute("JkProject", JkProject);
		// 项目标签(1为项目)
		List<JkTags> jkTags = tagService.getTagsList(id, 1);
		model.addAttribute("jkTags", jkTags);
		// 项目发布人
		JkUser projUser = userService.getUserById(JkProject.getUid());
		model.addAttribute("projUser", projUser);
		ServiceResult<JkUserInfo> JkUserInfo = userInfoService.getUserInfo(projUser.getId());
		model.addAttribute("JkUserInfo", JkUserInfo.getT());
		// 项目申请人列表
		List<JkProjectApply> jkProjectApplyList = projectApplyService.getApplierList(id, null);
		model.addAttribute("jkProjectApplyList", jkProjectApplyList);
		// 项目附件列表
		List<JkFile> fileList = fileService.getFileList(id, 1);
		model.addAttribute("fileList", fileList);
		// 该项目流流浪浏览量自增1
		projectService.addBrowsevolume(id);

		return "publish-preview";
	}

	@RequestMapping(value = "toProjectDetailToMobileOrPc", method = RequestMethod.GET)
	public String toProjectDetailToMobileOrPc(Integer id, Model model, HttpServletRequest request) {
		// ModelAndView modelview=new ModelAndView();
		// request.getSession().setAttribute("login_openId",
		// "odn33v2GMKMcd_KNR1BW36JoS5y8");
		Object obj = request.getSession().getAttribute("login_openId");
		if (obj == null) {
			// 去pc端
			return toProjectDetail(id, model, request);
		} else {
			// 去手机端
			return mobileLoginController.toProjectDetail(id, model, request);
		}

	}

	/**
	 * 去项目详情页面
	 *
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "toProjectDetail", method = RequestMethod.GET)
	public String toProjectDetail(Integer id, Model model, HttpServletRequest request) {

		// 获取当前登录用户(既操作者)
		HttpSession session = request.getSession();
		Object login_userId = session.getAttribute("login_userId");
		// 如果不为null，则说明用户已登录
		JkUser user = null;
		if (login_userId != null)
			user = userService.getUserById(Integer.valueOf(login_userId.toString()));

		// 获取广告位
		List<JkAdvertisement> projectAds = advertisementService.getListPageOfAd(null, 7, 1, 3);
		if (projectAds.size() == 0) {
			projectAds = null;
		}
		model.addAttribute("projectAds", projectAds);

		if(id == -1) {
			model.addAttribute("projUser", user);
			ServiceResult<JkUserInfo> JkUserInfo = userInfoService.getUserInfo(user.getId());
			model.addAttribute("JkUserInfo", JkUserInfo.getT());
			model.addAttribute("user", user);
			return "publish-preview2";
		}

		// 项目详情
		JkProject jkProject = projectService.getProjectById(id);
		model.addAttribute("JkProject", jkProject);
		// 项目发布人
		JkUser projUser = userService.getUserById(jkProject.getUid());
		model.addAttribute("projUser", projUser);
		ServiceResult<JkUserInfo> JkUserInfo = userInfoService.getUserInfo(projUser.getId());
		model.addAttribute("JkUserInfo", JkUserInfo.getT());
		// 项目标签(1为项目)
		List<JkTags> jkTags = tagService.getTagsList(id, 1);
		model.addAttribute("jkTags", jkTags);
		// 项目申请人列表
		List<Map<String, Object>> jkProjectApplyList = projectApplyService.getApplierListDetail(id, null);
		model.addAttribute("jkProjectApplyList", jkProjectApplyList);
		// 项目附件列表
		List<JkFile> fileList = fileService.getFileList(id, 1);
		model.addAttribute("fileList", fileList);
		// 我是否关注该用户
		JkUserFansFollows jkUserFansFollows = null;
		if (user != null)
			jkUserFansFollows = fansFollowsService.getOneFansByFollowId(user.getId(), jkProject.getUid());
		model.addAttribute("jkUserFansFollows", jkUserFansFollows);

		// 该项目流流浪浏览量自增1
		projectService.addBrowsevolume(id);
		// 若用户未登录
		if (user == null) {
			// 构造一个不存在的user
			user = new JkUser();
			user.setId(-1);
		}
		// 若用户已登录
		// 1.
		// 当前用户是否收藏（默认为0）
		int hasCollect = 0;
		// 当前用户是否点赞（默认为0）
		int hasAdmire = 0;
		// 获取点赞和收藏对象，判断是否被点赞和被收藏
		JkUserCollection jkUserCollection = collectService.selectCollect(jkProject.getId(), user.getId(), 1);
		JkAdmire JkAdmire = admireService.selectAdmire(jkProject.getId(), user.getId(), 1, 0);
		if (jkUserCollection != null)
			hasCollect = 1;
		if (JkAdmire != null)
			hasAdmire = 1;

		// 2.
		// 当前项目已被点赞数
		int hasAdmires = 0;
		// 获取当前项目的点赞对象列表
		List<JkAdmire> jkAdmireList = admireService.selectByFidAndType(jkProject.getId(), 1);
		if (jkAdmireList != null)
			hasAdmires = jkAdmireList.size();

		// 3
		// 创建用户浏览记录
		userHistoryService.save(2, id, user.getId(), jkProject.getProjPicPath(), "浏览项目");
		// 4
		// 推荐项目
		List<Map<String, Object>> recommProjList = projectService.getProjectList(null, null, jkProject.getCid(),
				null, jkProject.getProjType(), null, null, null, null, null, null, null,
				jkProject.getProjLocation(), null, "istop desc,createTime desc", 1, 20, 1);
		// 去掉当前项目
		List<Map<String, Object>> recommProjList1 = new ArrayList<Map<String, Object>>();
		for (Map<String, Object> map : recommProjList) {
			if (!map.get("uid").toString().equals(user.getId().toString())
					&& !map.get("id").toString().equals(jkProject.getId().toString())) {
				recommProjList1.add(map);
			}
		}

		List<Map<String, String>> recomments = projectService.getRecomment(-1, 5);
		model.addAttribute("recomments", recomments);
		model.addAttribute("recommProjList", recommProjList1);
		model.addAttribute("hasCollect", hasCollect);
		model.addAttribute("hasAdmire", hasAdmire);
		model.addAttribute("hasAdmires", hasAdmires);
		if(user.getId() != -1)
			model.addAttribute("user", user);

		return "project-details";

	}

	/**
	 * 去项目列表页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toProjectList", method = RequestMethod.GET)
	public String toProjectList(Model model, @RequestParam(required = false, defaultValue = "1") Integer page,
								@RequestParam(required = false, defaultValue = "5") Integer pageSize,
								@RequestParam(required = false) Integer firstCateId, @RequestParam(required = false) Integer projType,
								@RequestParam(required = false) String keywords, @RequestParam(required = false) String tagName) {
		// 项目一级分类
		List<JkProjectCate> firstCateList = new ArrayList<JkProjectCate>();
		firstCateList = projectCateService.getFirstCateList();
		// 项目一级分类
		List<JkProjectCate> secondCateList = new ArrayList<JkProjectCate>();
		secondCateList = projectCateService.getSecondCateList(null);
		// 标签列表
		List<JkTags> jkTagList = new ArrayList<JkTags>();
		jkTagList = tagService.getAllTagsList(1);
		// 初始类型
		JkProjectCate firstCate = projectCateService.getCateById(firstCateId);
		if (firstCate != null)
			model.addAttribute("thefirstCate", firstCate);

		model.addAttribute("jkTagList", jkTagList);
		model.addAttribute("cateList", firstCateList);
		model.addAttribute("secondCateList", secondCateList);
		// 初始化类型
		model.addAttribute("firstCateId", firstCateId);
		// 初始化项目类别
		model.addAttribute("projType", projType);
		// 搜索关键字
		model.addAttribute("keywords", keywords);
		// 主页切换凭证
		model.addAttribute("tagName", tagName);
		// 获取广告位
		List<JkAdvertisement> projectAds = advertisementService.getListPageOfAd(null, 2, 1, 3) == null
				|| advertisementService.getListPageOfAd(null, 2, 1, 3).size() <= 0 ? null
				: advertisementService.getListPageOfAd(null, 2, 1, 3);
		model.addAttribute("projectAds", projectAds);
		List<Map<String, String>> recomments = projectService.getRecomment(-1, 5);
		model.addAttribute("recomments", recomments);
		model.addAttribute("pageSize", 10);
		return "list";
	}

	@RequestMapping(value = "toPage", method = RequestMethod.GET)
	public String toPage(@RequestParam(required = true) String tagName) {
		return tagName;
	}

	/***
	 * 去创意大赛页面
	 *
	 * @return
	 */
	@RequestMapping(value = "toCreativityList", method = RequestMethod.GET)
	public String toCreativityList(Model model, @RequestParam(required = false, defaultValue = "1") Integer page,
								   @RequestParam(required = false, defaultValue = "12") Integer pageSize,
								   @RequestParam(required = false) Integer firstCateId, @RequestParam(required = false) Integer projType,
								   @RequestParam(required = false) String keywords) {
		// 搜索关键字
		model.addAttribute("keywords", keywords);
		// 默认创意大赛
		JkTags tag = tagService.getEntityByName("创意策划大赛");
		model.addAttribute("jkTagId", tag != null ? tag.getId() : null);
		// 获取广告位
		JkAdvertisement theHeadPic = advertisementService.getListPageOfAd(null, 6, 1, 1) == null
				|| advertisementService.getListPageOfAd(null, 6, 1, 1).size() <= 0 ? null
				: advertisementService.getListPageOfAd(null, 6, 1, 1).get(0);
		model.addAttribute("theHeadPic", theHeadPic);

		return "creativity";
	}

	/**
	 * 去积分商城页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "toScoreMall", method = RequestMethod.GET)
	public String toProjectList(Model model) {
		// 商品列表
		List<JkScoreMall> productList = new ArrayList<JkScoreMall>();
		productList = scoreMallService.getScoreProductList();

		model.addAttribute("productList", productList);

		return "integral-shop";
	}

	@RequestMapping(value = "toShopDetails", method = RequestMethod.GET)
	public String toShopDetails(Model model, Integer id) {

		// 获取项目详情
		JkScoreMall jkScoreMall = scoreMallService.getScoreProductById(id);

		model.addAttribute("jkScoreMall", jkScoreMall);

		return "integral-shop-details";
	}

	/**
	 * 注册方法:
	 *
	 * @param type
	 * @param phone
	 * @param yzcode
	 * @param password
	 * @param deviceCode
	 * @param inviteCode
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> register(@RequestParam(required = false) Integer type, // 用户类型
										String phone, // 手机号码
										String yzcode, // 验证码
										String sid, // 三方发送短信的ID
										String password, // 密码
										@RequestParam(required = false) String deviceCode, // 设备唯一编码
										@RequestParam(required = false) String inviteCode, // 邀请注册码
										HttpServletRequest request, Locale locale, Model model) throws ParseException { // 注册邀请码
		// 1.手机号码是否已经注册过
		ServiceResult<JkUser> resUser = loginService.isUserNotExistsByPhone(phone);
		if (resUser.getResultCode() != LoginService.SUCCESS) {
			return getResult(false, resUser.getResultStr());
		}
		// 1.1若已注册，返回
		if (resUser.getT() != null) {
			return getResult(false, "该手机号码已注册");
		}
		// 2.确认验证码是否合法
		ServiceResult<JkSysSms> resSms = smsService.checkYzCode(phone, yzcode, sid);
		if (resSms.getResultCode() != SmsService.SUCCESS) {
			return getResult(false, resSms);
		}
		// 3.注册手机号码用户
		if (deviceCode == null)
			deviceCode = request.getHeader("User-Agent");
		resUser = loginService.createUser(phone, password, deviceCode, inviteCode);
		if (resUser.getResultCode() != LoginService.SUCCESS) {
			return getResult(false, resUser.getResultStr());
		}
		// 4.创建token
		String sideWord = request.getHeader("User-Agent");
		Map<String, String> token = TokenUtil.createToken(resUser.getT(), sideWord);
		// 5.返回结果
		Map<Object, Object> result = getResult("user", resUser.getT());
		result.put("token", token);

		// 6.用户注册获得积分
		scoreExchangeService.save(resUser.getT(), null, null, 50, "注册", 0);

		return result;
	}

	/**
	 * 通过手机号码登录用户
	 *
	 * @param phone
	 * @param password
	 * @param type
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(String phone, String password, @RequestParam(required = false) Integer type,
							  @RequestParam(required = false) String deviceCode, @RequestParam(required = false) String from, HttpServletRequest request, Locale locale, Model model)
			throws ParseException, UnsupportedEncodingException {
		// 1.查找用户
		if (deviceCode == null)
			deviceCode = request.getHeader("User-Agent");
		ServiceResult<JkUser> resUser = loginService.loginUser(phone, password, deviceCode);
		// 1.1用户登录有误
		if (resUser.getResultCode() != LoginService.SUCCESS) {
			model.addAttribute("result", getResult(false, resUser.getResultStr()));
			return new ModelAndView("redirect:/login/toLogin?error=1");
		}
		if (resUser.getT().getExtraInt() != 0) {
			model.addAttribute("result", getResult(false, "您已经被禁言"));
			return new ModelAndView("redirect:/login/toLogin?error=1");
		}
		// 2.创建token
		String sideWord = request.getHeader("User-Agent");
		Map<String, String> token = TokenUtil.createToken(resUser.getT(), sideWord);
		// 3.返回结果
		Map<Object, Object> result = getResult("user", resUser.getT());
		result.put("token", token);
		model.addAttribute("result", result);
		// 4.用户登录获得积分
		scoreExchangeService.save(resUser.getT(), null, null, 10, "登录", 0);

		// 设置用户登陆信息到session
		HttpSession session = request.getSession();
		JkUser user = resUser.getT();
		session.setAttribute("token", token);
		session.setAttribute("login_userId", user.getId());
		session.setAttribute("login_phone", user.getPhone());
		session.setAttribute("user_level", user.getUserLevel());

		/*
		 * //登陆后获取项目数量 int
		 * totalofproject=projectService.getTotalofProjectById(user.getId()).
		 * getT(); //登陆后获取头条数量 int
		 * totalofnews=artcleService.getTotalOfNews(user.getId()).getT();
		 */
		// 登陆后获取用户信息
		JkUser jkUser = userService.getUserById(user.getId());
		// 登陆后获取用户详细信息
		JkUserInfo jkUserInfo = userInfoService.getUserInfo(user.getId()).getT();
		// 登陆后获取标签信息
		List<JkTags> taglist = TagService.getTagsList(user.getId(), 0);
		// 登陆后获取我的粉丝
		List<JkUserFans> fanslist = fansService.getfanslist(user.getId(), null, null, null);
		// 登陆后获取我的关注
		List<JkUserFans> myattentionlist = fansService.getfanslist(null, user.getId(), null, null);

		model.addAttribute("myattentionlist", myattentionlist);
		model.addAttribute("fanslist", fanslist);
		/*
		 * model.addAttribute("totalofproject", totalofproject);
		 * model.addAttribute("totalofnews",totalofnews);
		 */
		model.addAttribute("jkuser", jkUser);
		model.addAttribute("jkuserinfo", jkUserInfo);
		model.addAttribute("taglist", taglist);

		if(!StringUtils.isNullOrEmpty(from))
			return new ModelAndView("redirect:"+new URLUtil(URLDecoder.decode(from, "utf-8")).encodeParams());
		return new ModelAndView("redirect:/");
	}

	/**
	 * 退出登录
	 *
	 * @param request
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "loginOut", method = RequestMethod.GET)
	public ModelAndView loginOut(HttpServletRequest request, Locale locale, Model model) {
		// 删除session信息
		HttpSession session = request.getSession();

		session.removeAttribute("token");
		session.removeAttribute("login_userId");
		session.removeAttribute("login_phone");
		session.removeAttribute("user_level");

		return new ModelAndView("redirect:/");
	}

	/**
	 * 忘记密码
	 *
	 * @param phone
	 * @param password
	 * @param type
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "resetpwd", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> resetPwd(@RequestParam(required = false) Integer type, // 用户类型
										String phone, // 手机号码
										String yzcode, // 验证码
										String sid, // 三方发送短信的ID
										String password, // 密码
										@RequestParam(required = false) String deviceCode, // 设备唯一编码
										@RequestParam(required = false) String inviteCode, // 邀请注册码
										HttpServletRequest request, Locale locale, Model model) {
		// 1.用户是否存在
		ServiceResult<JkUser> resUser = loginService.isUserExistsByPhone(phone);
		if (resUser.getResultCode() != LoginService.SUCCESS) {
			model.addAttribute("result", getResult(false, resUser.getResultStr()));
			return getResult(false, resUser.getResultStr());
		}
		// 2.确认验证码是否合法
		ServiceResult<JkSysSms> resSms = smsService.checkYzCode(phone, yzcode, sid);
		if (resSms.getResultCode() != SmsService.SUCCESS) {
			model.addAttribute("result", getResult(false, resSms.getResultStr()));
			return getResult(false, resUser.getResultStr());
		}
		// 3.更新用户
		if (deviceCode == null)
			deviceCode = request.getHeader("User-Agent");
		resUser = loginService.resetPwd(phone, password, deviceCode);
		if (resUser.getResultCode() != LoginService.SUCCESS) {
			model.addAttribute("result", getResult(false, resUser.getResultStr()));
			return getResult(false, resUser.getResultStr());
		}
		// 2.创建token
		String sideWord = request.getHeader("User-Agent");
		Map<String, String> token = TokenUtil.createToken(resUser.getT(), sideWord);
		// 3.返回结果
		Map<Object, Object> result = getResult("user", resUser.getT());
		result.put("token", token);
		model.addAttribute("result", result);
		return getResult(true, "修改成功");
	}

	/**
	 * 重新获取token
	 *
	 * @param phone
	 * @param password
	 * @param deviceCode
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getToken", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getToken(String phone, // 手机号码
										String password, // 密码
										@RequestParam(required = false) String deviceCode, // 设备唯一编码
										HttpServletRequest request) {
		// 1.查找用户
		if (deviceCode == null)
			deviceCode = request.getHeader("User-Agent");
		ServiceResult<JkUser> resUser = loginService.loginUser(phone, password, deviceCode);
		// 1.1用户未注册
		if (resUser.getResultCode() != LoginService.SUCCESS)
			return getResult(false, resUser.getResultStr());
		// 2.创建token
		String sideWord = request.getHeader("User-Agent");
		Map<String, String> token = TokenUtil.createToken(resUser.getT(), sideWord);
		return getResult("token", token);
	}

	@RequestMapping(value = "torecomlist", method = RequestMethod.GET)
	public String torecomlist(HttpServletRequest req, Model model, Integer cid, Integer projType, String projLocation) {
		// req.getSession().setAttribute("login_openId",
		// "odn33v2GMKMcd_KNR1BW36JoS5y8");
		if (projLocation == null || projLocation.equals("null")) {
			projLocation = null;
		}
		List<Map<String, Object>> list = projectService.getProjectList(null, null, cid, null, projType, null, null,
				null, null, null, null, null, projLocation, null, null, null, null, 1);
		model.addAttribute("jkProjectList", list);
		Object loginopenId = req.getSession().getAttribute("login_openId");
		if (loginopenId != null) {
			return "mobile/project-recomment";
		}
		return "recomlist";
	}

}
