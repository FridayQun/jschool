package com.chengan.business;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chengan.business.advertisement.service.AdvertisementService;
import com.chengan.business.artcle.service.ArtcleCateService;
import com.chengan.business.artcle.service.ArtcleService;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkAdvertisement;
import com.chengan.business.repo.model.JkNews;
import com.chengan.business.repo.model.JkNewsCate;
import com.chengan.business.repo.model.JkProjectCate;
import com.chengan.business.repo.model.JkSponsor;
import com.chengan.business.repo.model.JkSysMesg;
import com.chengan.business.repo.model.JkSysModule;
import com.chengan.business.sponsor.service.SponsorService;
import com.chengan.business.sysmodule.service.SysModuleService;
import com.chengan.business.tag.service.TagService;
import com.chengan.business.user.service.UserInfoService;
import com.chengan.business.util.OSSClientUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	OSSClientUtil ossUtil;
	@Autowired
	ArtcleService artcleService;
	@Autowired
	ArtcleCateService artcleCateService;
	@Autowired
	ProjectCateService projectCateService;
	@Autowired
	ProjectService projectService;
	@Autowired
	TagService tagService;
	@Autowired
	UserInfoService userInfoService;
	@Autowired
	AdvertisementService advertisementService;
	@Autowired
	mesgService mesgService;
	@Autowired
	SysModuleService sysModuleService;
	@Autowired
	SponsorService sponsorService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model, Integer isPublish) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);

		// 获取项目类型列表（校园赞助，校园场地，第三方服务）
		List<JkProjectCate> supportCateList = new ArrayList<JkProjectCate>();
		List<JkProjectCate> addressCateList = new ArrayList<JkProjectCate>();
		List<JkProjectCate> onlineMediaCateList = new ArrayList<JkProjectCate>();

		JkProjectCate supportCate = projectCateService.getCateByName("校园赞助");
		JkProjectCate addressCate = projectCateService.getCateByName("校园场地");
		JkProjectCate onlineMediaCate = projectCateService.getCateByName("校园媒体");

		if (supportCate != null)
			supportCateList = projectCateService.getSecondCateList(supportCate.getId());
		if (addressCate != null)
			addressCateList = projectCateService.getSecondCateList(addressCate.getId());
		if (onlineMediaCate != null)
			onlineMediaCateList = projectCateService.getSecondCateList(onlineMediaCate.getId());

		// 获取首次加载时的项目列表
		List<Map<String, Object>> supportProjectList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> addressProjectList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> onlineMediaProjectList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> fwProjectList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> zjProjectList = new ArrayList<Map<String, Object>>();

		if (supportCate != null)
			supportProjectList = projectService.getProjectListByFirstCate(supportCate.getId(), null, 3,
					"istop desc,createTime desc", 1, 10);
		if (addressCate != null)
			addressProjectList = projectService.getProjectListByFirstCate(addressCate.getId(), null, 3,
					"istop desc,createTime desc", 1, 10);
		if (onlineMediaCate != null)
			onlineMediaProjectList = projectService.getProjectListByFirstCate(onlineMediaCate.getId(), null, 3,
					"istop desc,createTime desc", 1, 10);
		fwProjectList = projectService.getProjectListByType(0, 0, 10);
		zjProjectList = projectService.getProjectListByType(1, 0, 10);

		List<JkSponsor> sponsorList = sponsorService.getListPage(null, 0, null, 0);

		// 校园达人列表
		List<Map<String, Object>> students = userInfoService.getUserList(null, null, null, null, 0, null, 2,
				"istop desc,toptime desc", 1, 1, 10);
		// 优秀赞助商列表
		List<Map<String, Object>> companys = userInfoService.getUserList(null, null, null, null, 1, null, 2,
				"istop desc,toptime desc", 1, 1, 10);

		// 一级目录列表，二级目录列表
		List<JkProjectCate> firstCateList = projectCateService.getFirstCateList();
		// 获取公告信息
		List<Integer> measgtype = new ArrayList<Integer>();
		measgtype.add(1);
		List<JkSysMesg> mesgList = mesgService.getmesglistbyex(measgtype, 1, null, null);
		model.addAttribute("mesgList", mesgList);
		/**
		 * NOTE 删除这部分，更换头条信息
		 * 
		// 初始化热门资讯
		List<JkNews> zxList = artcleService.getArtcleList(null, null, 0, null, 1,
				"n.isrecomment desc,n.create_time desc", 1, 5);
		model.addAttribute("zxList", zxList);
		// 初始化热门攻略
		List<JkNews> glList = artcleService.getArtcleList(null, null, 1, null, 1,
				"n.isrecomment desc,n.create_time desc", 1, 5);
		model.addAttribute("glList", glList);
		*/

		// 获取推荐的热门资讯
		List<JkNewsCate> newsCateList = artcleCateService.getTop5ArtcleCateList("1", null, 1, 5);
		model.addAttribute("newsCateList", newsCateList);
		List<List<JkNews>> newsList = new ArrayList<>();
		for(JkNewsCate cate : newsCateList) {
			List<JkNews> newsListT = artcleService.getArtcleList(null, null, cate.getId(), null, 1, "n.isrecomment desc, n.create_time desc", 1, 10);
			newsList.add(newsListT);
		}
		model.addAttribute("newsList", newsList);

		// 获取首页轮播图
		List<JkAdvertisement> bunnerImgList = advertisementService.getListPageOfAd(null, 0, 1, 3);
		// 获取首页广告位
		List<JkAdvertisement> homeAd = advertisementService.getListPageOfAd(null, 1, 1, 3) == null
				|| advertisementService.getListPageOfAd(null, 1, 1, 3).size() <= 0 ? null
						: advertisementService.getListPageOfAd(null, 1, 1, 3);

		// 首页全部分类数据
		String allCateList = "";
		allCateList = projectCateService.getAllFirstAndSecondCateList();
		// 获取导航栏
		List<JkSysModule> sysModuleList = sysModuleService.getListPage(null, 0, null, null);
		HttpSession session = request.getSession();

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("allCateList", allCateList);
		model.addAttribute("supportProjectList", supportProjectList);
		model.addAttribute("addressProjectList", addressProjectList);
		model.addAttribute("onlineMediaProjectList", onlineMediaProjectList);
		model.addAttribute("fwProjectList", fwProjectList);
		model.addAttribute("zjProjectList", zjProjectList);
		model.addAttribute("firstCateList", firstCateList);
		model.addAttribute("supportCateList", supportCateList);
		model.addAttribute("addressCateList", addressCateList);
		model.addAttribute("onlineMediaCateList", onlineMediaCateList);
		model.addAttribute("students", students);
		model.addAttribute("companys", companys);
		model.addAttribute("sponsors", sponsorList);
		if(supportCate != null)
			model.addAttribute("supportCate", supportCate.getId());
		else
			model.addAttribute("supportCate", 0);
		model.addAttribute("bunnerImgList", bunnerImgList);
		model.addAttribute("homeAd", homeAd);
		model.addAttribute("isPublish", isPublish);
		session.setAttribute("sysModuleList", sysModuleList);

		return "home";
	}

}
