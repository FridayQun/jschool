package com.chengan.business.mobile.login.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import com.chengan.business.follows.service.FollowsSevice;
import com.chengan.business.login.service.LoginService;
import com.chengan.business.login.service.SmsAlidayuService;
import com.chengan.business.login.service.SmsService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.login.service.WxUserService;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.mobile.project.service.MobileProjectCateService;
import com.chengan.business.operate.service.AdmireService;
import com.chengan.business.operate.service.CollectService;
import com.chengan.business.operate.service.CommentService;
import com.chengan.business.project.service.ProjectApplyService;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkAdmire;
import com.chengan.business.repo.model.JkAdvertisement;
import com.chengan.business.repo.model.JkNews;
import com.chengan.business.repo.model.JkNewsCate;
import com.chengan.business.repo.model.JkProject;
import com.chengan.business.repo.model.JkProjectApply;
import com.chengan.business.repo.model.JkProjectCate;
import com.chengan.business.repo.model.JkProjectComment;
import com.chengan.business.repo.model.JkScoreMall;
import com.chengan.business.repo.model.JkSysMesg;
import com.chengan.business.repo.model.JkSysModule;
import com.chengan.business.repo.model.JkSysSms;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserCollection;
import com.chengan.business.repo.model.JkUserFans;
import com.chengan.business.repo.model.JkUserFansFollows;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.repo.model.JkWXUser;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.score.service.ScoreMallService;
import com.chengan.business.sysmodule.service.SysModuleService;
import com.chengan.business.tag.service.TagService;
import com.chengan.business.user.service.UserHistoryService;
import com.chengan.business.user.service.UserInfoService;
import com.chengan.business.util.TokenUtil;
import com.github.pagehelper.Page;
import com.mysql.jdbc.StringUtils;

import net.sf.json.JSONObject;

/**
 * 
 * @author y
 *
 */
@Controller
@RequestMapping("/mobile/login")
public class MobileLoginController extends BaseController {

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
	MobileProjectCateService mobileProjectCateService;
	@Autowired
	WxUserService wxUserService;
	@Autowired
	AdvertisementService advertisementService;
	@Autowired
	mesgService mesgService;
	@Autowired
	FansFollowsService fansFollowsService;
	@Autowired
	SysModuleService sysModuleService;

	//返回积分商城
	@RequestMapping(value = "redirecttointegralindex", method = RequestMethod.GET)
	String redirect(){

		return "redirect:/integral/tointegralindex";
	}

	// 所有页面跳转接口
	/**
	 * 去登陆页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toLogin", method = RequestMethod.GET)
	String toLoginJsp() {
		return "mobile/login";
	}

	/**
	 * 去注册页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toRegister", method = RequestMethod.GET)
	public String toRegisterJsp(Model model, String phone, String yzcode, String sid) {
		if (StringUtils.isNullOrEmpty(phone) || StringUtils.isNullOrEmpty(yzcode) || StringUtils.isNullOrEmpty(sid))
			return "mobile/bind-mobile-newphone";
		model.addAttribute("yzcode", yzcode);
		model.addAttribute("phone", phone);
		model.addAttribute("sid", sid);
		return "mobile/register";
	}

	/**
	 * 去校园头条页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toHeadline", method = RequestMethod.GET)
	String toHeadline(Model model, @RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(required = false, defaultValue = "0") Integer type) {
		// 首次进入的项目列表
		List<JkNews> newsList = artcleService.getArtcleList(null, null, type, null, 1, null, page, 5);
		
		List<JkNewsCate> cateList = artcleCateService.getArtcleCateList(null, null, null, null);

		// 头条列表数据
		model.addAttribute("newsList", newsList);
		// 分页总页数
		model.addAttribute("pages", ((Page<JkNews>) newsList).getPages());
		// 分类
		model.addAttribute("type", type);
		
		model.addAttribute("cateList", cateList);

		return "mobile/news";
	}

	/**
	 * 去红人馆页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toCelebrity", method = RequestMethod.GET)
	String toCelebrity(Model model, String keywords) {
		// 搜索关键字
		model.addAttribute("keywords", keywords);
		List<JkTags> fTags = tagService.getTagsList2(0, 0);
		model.addAttribute("fTags", fTags);
		if(fTags!=null && fTags.size() > 0) {
			List<JkTags> tags = tagService.getTagsList2(0, fTags.get(0).getId());
			model.addAttribute("tags", tags);
		}

		return "mobile/celebrity";
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
		// 获取头条详情
		JkNews jkNews = artcleService.getNewsById(id);
		// 获取头条发布者详情
		JkUser jkUser = null;
		if (jkNews != null)
			jkUser = userService.getUserById(jkNews.getUid());
		// 获取头条的评论
		List<Map<Object, Object>> commentList = commentService.selectCimmentList(null, jkNews.getId(), 2);
		// 该项目浏览量自增1
		artcleService.addBrowsevolume(id);
		// 获取关注对象
		if (user != null) {
			JkUserFansFollows jkUserFansFollows = fansFollowsService.getOneFansByFollowId(user.getId(),
					jkNews.getUid());
			model.addAttribute("jkUserFansFollows", jkUserFansFollows);
		}

		// 用户已登录状态下，获取该用户是否点赞、收藏该头条 ,关注该用户
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

		return "mobile/news-details";
	}

	/**
	 * 去忘记密码页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toForgetPw", method = RequestMethod.GET)
	public String toForgetPw() {
		return "mobile/find-pwd";
	}

	/**
	 * 去发布项目页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toPublish", method = RequestMethod.GET)
	public String toPublish(HttpServletRequest request, Model model) {
		// 一级类目
		List<JkProjectCate> firstCateList = projectCateService.getFirstCateList();
		// 标签列表
		List<JkTags> tagList = tagService.getAllTagsList(1);

		model.addAttribute("firstCateList", firstCateList);
		model.addAttribute("tagList", tagList);
		return "mobile/project-publish";
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

		// 项目详情
		JkProject JkProject = projectService.getProjectById(id);
		model.addAttribute("JkProject", JkProject);
		// 项目标签(1为项目)
		List<JkTags> jkTags = tagService.getTagsList(id, 1);
		model.addAttribute("jkTags", jkTags);
		// 项目发布者
		Map<String, Object> jkUserWithInfo = userService.getUserWithInfoByUId(JkProject.getUid());
		model.addAttribute("jkUserWithInfo", jkUserWithInfo);
		// 项目申请人列表
		List<JkProjectApply> jkProjectApplyList = projectApplyService.getApplierList(id, null);
		model.addAttribute("jkProjectApplyList", jkProjectApplyList);
		// 如果该项目不是当前登录者发布多，则推荐项目
		if (user != null && JkProject.getUid() != user.getId()) {
			List<Map<String, Object>> recommProjList = projectService.getProjectList(null, null, JkProject.getCid(),
					null, JkProject.getProjType(), null, null, null, null, null, null, null,
					JkProject.getProjLocation(), null, "istop desc,createTime desc", 1, 20, 1);
			// 去掉当前项目
			List<Map<String, Object>> recommProjList1 = new ArrayList<Map<String, Object>>();
			for (Map<String, Object> map : recommProjList) {
				if (!map.get("uid").toString().equals(user.getId().toString())
						&& !map.get("id").toString().equals(JkProject.getId().toString())) {
					recommProjList1.add(map);
				}
			}
			model.addAttribute("recommProjList", recommProjList1);
			// 当前用户是否收藏（默认为0）
			int hasCollect = 0;
			// 当前用户是否点赞（默认为0）
			int hasAdmire = 0;
			// 获取点赞和收藏对象，判断是否被点赞和被收藏
			JkUserCollection jkUserCollection = collectService.selectCollect(JkProject.getId(), user.getId(), 1);
			JkAdmire JkAdmire = admireService.selectAdmire(JkProject.getId(), user.getId(), 1, 0);
			if (jkUserCollection != null)
				hasCollect = 1;
			if (JkAdmire != null)
				hasAdmire = 1;
			model.addAttribute("hasCollect", hasCollect);
			model.addAttribute("hasAdmire", hasAdmire);
		}

		// 该项目流流浪浏览量自增1
		projectService.addBrowsevolume(id);

		return "mobile/project-details";

	}

	/***
	 * 去项目列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "toProjectList", method = RequestMethod.GET)
	public String toProjectList(Model model, @RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "5") Integer pageSize,
			@RequestParam(required = false) Integer firstCateId, @RequestParam(required = false) Integer projType,
			@RequestParam(required = false) String keywords, @RequestParam(required = false) String tagName) {

		// 筛选条件
		// String filterData = mobileProjectCateService.getFilterData();

		// 一级类目
		List<JkProjectCate> firstCateList = projectCateService.getFirstCateList();
		// 二级类目
		List<JkProjectCate> secondCateList = projectCateService.getSecondCateList(null);
		// 获取查询条件标签id
		JkTags jkTag = tagService.getEntityByName(tagName);

		model.addAttribute("firstCateList", firstCateList);
		model.addAttribute("secondCateList", secondCateList);
		// 初始化类型
		model.addAttribute("firstCateId", firstCateId);
		// 初始化项目类别
		model.addAttribute("projType", projType);
		// 搜索关键字
		model.addAttribute("keywords", keywords);
		// 初始化标签
		if (jkTag != null)
			model.addAttribute("jkTagId", jkTag.getId());

		return "mobile/project";
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

	// 去单品详情
	@RequestMapping(value = "toShopDetails", method = RequestMethod.GET)
	public String toShopDetails(Model model, Integer id) {

		// 获取商品详情
		JkScoreMall jkScoreMall = scoreMallService.getScoreProductById(id);

		model.addAttribute("jkScoreMall", jkScoreMall);

		return "integral-shop-details";
	}

	// 去首页
	@RequestMapping(value = "/toHome", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, Integer isPublish) {
		logger.info("Welcome home! The client locale is {}.", locale);

		// request.getSession().setAttribute("login_openId",
		// "odn33v37it6Z-ee20ETJ8sWLkMJc");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		// 当前时间
		model.addAttribute("serverTime", formattedDate);

		// 获取项目类型列表（校园赞助，校园场地，第三方服务，校园媒体，技能服务）
		List<JkProjectCate> supportCateList = new ArrayList<JkProjectCate>();
		List<JkProjectCate> addressCateList = new ArrayList<JkProjectCate>();
		List<JkProjectCate> thirdServerCateList = new ArrayList<JkProjectCate>();
		List<JkProjectCate> mediaCateList = new ArrayList<JkProjectCate>();
		List<JkProjectCate> skillCateList = new ArrayList<JkProjectCate>();

		JkProjectCate supportCate = projectCateService.getCateByName("校园赞助");
		JkProjectCate addressCate = projectCateService.getCateByName("校园场地");
		JkProjectCate thirdServerCate = projectCateService.getCateByName("第三方服务");
		JkProjectCate mediaCate = projectCateService.getCateByName("线上媒体");
		JkProjectCate skillCate = projectCateService.getCateByName("技能服务");
		if(true) {
			List<JkProjectCate> cates = projectCateService.getFirstCateList();
			if(cates != null && cates.size()>0 && supportCate==null)
				supportCate = cates.get(0);
			if(cates != null && cates.size()>1 && addressCate==null)
				addressCate = cates.get(1);
			if(cates != null && cates.size()>2 && thirdServerCate==null)
				thirdServerCate = cates.get(2);
			if(cates != null && cates.size()>3 && mediaCate==null)
				mediaCate = cates.get(3);
			if(cates != null && cates.size()>4 && skillCate==null)
				skillCate = cates.get(4);
		}

		if (supportCate != null)
			supportCateList = projectCateService.getSecondCateList(supportCate.getId());
		if (addressCate != null)
			addressCateList = projectCateService.getSecondCateList(addressCate.getId());
		if (thirdServerCate != null)
			thirdServerCateList = projectCateService.getSecondCateList(thirdServerCate.getId());
		if (mediaCate != null)
			mediaCateList = projectCateService.getSecondCateList(mediaCate.getId());
		if (skillCate != null)
			skillCateList = projectCateService.getSecondCateList(skillCate.getId());

		// 获取首次加载时的项目列表
		List<Map<String, Object>> supportProjectList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> addressProjectList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> thirdServerProjectList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> mediaProjectList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> skillProjectList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> recomment1 = new ArrayList<Map<String, Object>>();// 推荐项目：赞助/场地
		List<Map<String, Object>> recomment2 = new ArrayList<Map<String, Object>>();// 推荐项目：第三方服务/校园媒体

		if (supportCate != null)
			supportProjectList = projectService.getProjectListByFirstCate(supportCate.getId(), null, 3,
					"istop desc,createTime desc", 1, 5);
		if (addressCate != null)
			addressProjectList = projectService.getProjectListByFirstCate(addressCate.getId(), null, 3,
					"istop desc,createTime desc", 1, 5);
		if (thirdServerCate != null)
			thirdServerProjectList = projectService.getProjectListByFirstCate(thirdServerCate.getId(), null, 3,
					"istop desc,createTime desc", 1, 5);
		if (thirdServerCate != null)
			mediaProjectList = projectService.getProjectListByFirstCate(mediaCate.getId(), null, 3,
					"istop desc,createTime desc", 1, 5);
		if (thirdServerCate != null)
			skillProjectList = projectService.getProjectListByFirstCate(skillCate.getId(), null, 3,
					"istop desc,createTime desc", 1, 5);
		// 获取校园达人
		List<Map<String, Object>> starList = userInfoService.getUserList(null, null, null, null, null, null, null, null,
				1, 1, 10);
		// 获取初始化的热门资讯
		List<JkNews> newsList = artcleService.getArtcleList(null, null, null, null, 1, null, 1, 10);
		// 获取公告信息
		List<Integer> measgtype = new ArrayList<Integer>();
		measgtype.add(1);
		List<JkSysMesg> mesgList = mesgService.getmesglistbyex(measgtype, 1, null, null);
		model.addAttribute("mesgList", mesgList);
		// 推荐项目：赞助/场地
		recomment1.addAll(supportProjectList);
		recomment1.addAll(addressProjectList);
		// 推荐项目：第三方服务/校园媒体
		recomment2.addAll(thirdServerProjectList);
		recomment2.addAll(mediaProjectList);
		// 获取wxUser
		HttpSession session = request.getSession();
		Object openId = session.getAttribute("login_openId");
		if (openId != null) {
			JkWXUser jkWXUser = wxUserService.getByOpenid(String.valueOf(openId));
			if (jkWXUser != null && jkWXUser.getPhone() != null)
				model.addAttribute("wx_phone", jkWXUser.getPhone());
		}
		// 获取首页轮播图
		List<JkAdvertisement> bunnerImgList = advertisementService.getListPageOfAd(null, 5, 1, 3);
		// 获取导航栏
		List<JkSysModule> sysModuleList = sysModuleService.getListPage(null, 0, null, null);
		// 项目推荐
		List<Map<String, String>> recomments = projectService.getRecomment(-1, 8);

		// 设置
		model.addAttribute("supportCate", supportCate);
		model.addAttribute("addressCate", addressCate);
		model.addAttribute("thirdServerCate", thirdServerCate);
		model.addAttribute("mediaCate", mediaCate);
		model.addAttribute("skillCate", skillCate);
		model.addAttribute("supportCateList", supportCateList);
		model.addAttribute("addressCateList", addressCateList);
		model.addAttribute("thirdServerCateList", thirdServerCateList);
		model.addAttribute("mediaCateList", mediaCateList);
		model.addAttribute("skillCateList", skillCateList);
		model.addAttribute("recomment1", recomment1);
		model.addAttribute("recomment2", recomment2);
		model.addAttribute("skillProjectList", skillProjectList);
		model.addAttribute("starList", starList);
		model.addAttribute("bunnerImgList", bunnerImgList);
		model.addAttribute("newsList", newsList);
		model.addAttribute("sysModuleList", sysModuleList);
		model.addAttribute("isPublish", isPublish);
		model.addAttribute("recomments", recomments);

		return "mobile/home";
	}

	@RequestMapping(value = "toPage", method = RequestMethod.GET)
	public String toPage(@RequestParam(required = true) String tagName) {
		return "mobile/"+tagName;
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

		HttpSession session = request.getSession(true);
		Object openId = session.getAttribute("login_openId");
		// 1.手机号码是否已经注册过
		ServiceResult<JkUser> resUser = loginService.isUserNotExistsByPhone(phone);
		if (resUser.getResultCode() != LoginService.SUCCESS) {
			return getResult(false, resUser.getResultStr());
		}
		// 1.1若注册过，则返回
		if (resUser.getT() != null) {
			return getResult(false, "该号码已经注册！");
		}
		// 2.确认验证码是否合法
		ServiceResult<JkSysSms> resSms = smsService.checkYzCode(phone, yzcode, sid);
		if (resSms.getResultCode() != SmsService.SUCCESS) {
			return getResult(false, resSms);
		}
		// 3.1注册手机号码用户
		if (deviceCode == null)
			deviceCode = request.getHeader("User-Agent");
		resUser = loginService.createUser(phone, password, deviceCode, inviteCode);
		if (resUser.getResultCode() != LoginService.SUCCESS) {
			return getResult(false, resUser.getResultStr());
		}
		// 3.2绑定微信
		JkWXUser wxUser = null;
		if (openId != null) {
			wxUser = loginService.selectWXUser(String.valueOf(openId));
		}
		if (wxUser != null) {
			// 不为空，则双向绑定
			JkUser user = resUser.getT();
			user.setWxopenid(wxUser.getOpenid());
			wxUser.setPhone(user.getPhone());
			userService.update(user);
			wxUserService.update(wxUser);
			// 设置用户信息到session
			session.setAttribute("login_phone", user.getPhone());
			session.setAttribute("login_userId", user.getId());
			session.setAttribute("user_level", 1);
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
	 * 微信登录时将微信用户与GB用户绑定， 根据phone查询 如果有将user表记录返回，如果没有在user表 创建记录，将微信信息录入
	 * 
	 * @param //phone
	 *            微信登录时需要发送短信验证 获取的电话
	 * @param //openid
	 *            微信用户授权后返回的id
	 * @param //headPicPath
	 *            微信用户头像路径
	 * @param
	 *            //微信用户性别 0示未知 1表示男 2表示女
	 * @param
	 *            //微信昵称
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "WXlogin", method = RequestMethod.GET)
	public ModelAndView wxLogin(Model model, String code, String state, HttpServletRequest request)
			throws ParseException {
		String accessToken = null;// 微信回调的token
		String openid = null;// 微信回调的id
		String wxopenid = null;// 微信id
		String wxNickName = null;// 微信用户昵称
		Integer wxSex = null;// 微信用户性别 值为1时是男性，值为2时是女性，值为0时是未知
		String wxHeadPicPath = null;// 微信用户头像
		String wxlocation = null;// 微信用户所在城市
		String url = null;// 将图片路径转译

		// 1、请求微信服务器，通过code换取网页授权access_token
		String resultAcess = loginService.sendGetToken(code);
		if (resultAcess != null) {
			// 将Json字符串转为java对象
			JSONObject obj = JSONObject.fromObject(resultAcess);
			accessToken = obj.getString("access_token");
			openid = obj.getString("openid");
		}
		// 2、若第1步执行成功，请求微信服务器，拉取用户信息(需scope为 snsapi_userinfo)
		String resultOpenid = loginService.doGetOpenid(accessToken, openid);
		if (resultOpenid != null) {
			// 将Json字符串转为java对象
			JSONObject obj = JSONObject.fromObject(resultOpenid);
			wxopenid = obj.getString("openid");
			wxNickName = obj.getString("nickname");
			wxSex = obj.getInt("sex");
			wxHeadPicPath = obj.getString("headimgurl");

			try {
				url = URLDecoder.decode(wxHeadPicPath, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			wxlocation = obj.getString("city");

		}
		// 3、根据微信用户信息OPENID查询用户表是否有记录
		JkUser gbuser = loginService.selectUser(wxopenid);
		// 4、若3查无用户记录，则查询微信用户表是否有记录
		JkWXUser wxUser = null;
		Map<String, String> token = null;
		wxUser = loginService.selectWXUser(wxopenid);
		if (gbuser != null) {
			if(gbuser.getExtraInt() != 0) {
				return new ModelAndView("redirect:/mobile/login/toLogin?error=您被禁言");
			}
			// 3.设置用户连续登录天数
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currentdate = sdf.format(date);
			Date logintime = gbuser.getLoginTime();
			String logindate = sdf.format(logintime);
			Date parlogindate = null;
			Date parcurrentdate = null;
			try {
				parlogindate = sdf.parse(logindate);
				parcurrentdate = sdf.parse(currentdate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			long diff = parcurrentdate.getTime() - parlogindate.getTime();
			long days = diff / (1000 * 60 * 60 * 24);
			if (days == 1) {
				// 表示连续登录
				gbuser.setLoginTimes(gbuser.getLoginTimes() + 1);
			} else if (days > 1) {
				// 表示中间有没登录过，连续登录中断 重置为1
				gbuser.setLoginTimes(1);
			} else if (days == 0) {
				// 表示一天内登录好多次
			}
		}

		if (gbuser != null) {
			String sideWord = request.getHeader("User-Agent");
			gbuser.setLoginTime(new Date());
			userService.update(gbuser);
			token = TokenUtil.createToken(gbuser, sideWord);
		}
		// 5、若4查无用户记录，则新建微信用户表用户记录
		if (wxUser == null)
			wxUser = loginService.creatWXUser(wxNickName, wxopenid, wxSex, url, wxlocation);

		// 6、设置用户登陆信息到session
		HttpSession session = request.getSession();
		session.setAttribute("token", token);
		session.setAttribute("login_openId", wxUser.getOpenid());
		session.setAttribute("login_phone", wxUser.getPhone());
		if (gbuser != null)
			session.setAttribute("login_userId", gbuser.getId());
		if (gbuser == null)
			session.setAttribute("user_level", 0);
		else
			session.setAttribute("user_level", gbuser.getUserLevel());

		// 7.用户登录获得积分
		if (gbuser != null)
			scoreExchangeService.save(gbuser, null, null, 10, "登录", 0);
		return new ModelAndView("redirect:/mobile/login/toHome");
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(String phone, String password, @RequestParam(required = false) String deviceCode, HttpServletRequest request, Model model)
			throws ParseException {
		// 1.查找用户
		if (deviceCode == null)
			deviceCode = request.getHeader("User-Agent");
		ServiceResult<JkUser> resUser = loginService.loginUser(phone, password, deviceCode);
		// 1.1用户登录有误
		if (resUser.getResultCode() != LoginService.SUCCESS) {
			model.addAttribute("result", getResult(false, resUser.getResultStr()));
			return new ModelAndView("redirect:/mobile/login/toLogin?error=1");
		}
		if (resUser.getT().getExtraInt() != 0) {
			model.addAttribute("result", getResult(false, "您已经被禁言"));
			return new ModelAndView("redirect:/mobile/login/toLogin?error=1");
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

		return new ModelAndView("redirect:/mobile/login/toHome");
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
		session.removeAttribute("login_openId");
		session.removeAttribute("user_level");

		return new ModelAndView("redirect:/mobile/login/toLogin");
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
			return getResult(false, "用户已存在");
		}
		// 2.确认验证码是否合法
		ServiceResult<JkSysSms> resSms = smsService.checkYzCode(phone, yzcode, sid);
		if (resSms.getResultCode() != SmsService.SUCCESS) {
			model.addAttribute("result", getResult(false, resSms.getResultStr()));
			return getResult(false, "验证码不合法");
		}
		// 3.更新用户
		if (deviceCode == null)
			deviceCode = request.getHeader("User-Agent");
		resUser = loginService.resetPwd(phone, password, deviceCode);
		if (resUser.getResultCode() != LoginService.SUCCESS) {
			model.addAttribute("result", getResult(false, resUser.getResultStr()));
			return getResult(false, "");
		}
		// 2.创建token
		String sideWord = request.getHeader("User-Agent");
		Map<String, String> token = TokenUtil.createToken(resUser.getT(), sideWord);
		// 3.返回结果
		Map<Object, Object> result = getResult("user", resUser.getT());
		result.put("token", token);
		model.addAttribute("result", result);
		return getResult(true, "");
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

	@RequestMapping(value = "tomesg", method = RequestMethod.GET)
	public String tomesg(int id, Model model) {
		List<JkSysMesg> list = mesgService.getJkSysMesgList(null, null, null, null, null, id);

		model.addAttribute("JkSysMesg", list.get(0));
		return "mobile/notice";
	}

	@RequestMapping(value = "tofeedback", method = RequestMethod.GET)
	public String tofeedback(HttpServletRequest req) {
		Object sessionid = req.getSession().getAttribute("login_userId");
		if (sessionid == null) {
			return "mobile/bind-mobile-newphone";
		}
		return "mobile/feedback";
	}

	@RequestMapping(value = "toCreativityList", method = RequestMethod.GET)
	public String toCreativity(Model model, HttpServletRequest req) {
		Object loginopenId = req.getSession().getAttribute("login_userId");
		if (loginopenId == null) {
			return "redirect:/mobile/login/toLogin";
		}
		JkTags jkTags = tagService.getEntityByName("创意策划大赛");
		model.addAttribute("jkTags", jkTags);

		return "mobile/creativity";
	}

}
