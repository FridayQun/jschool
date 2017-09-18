package com.chengan.business.mobile.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.base.BaseController;
import com.chengan.business.login.service.UserService;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkProjectCate;
import com.chengan.business.repo.model.JkSysMesg;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.tag.service.TagMatchService;
import com.mysql.jdbc.StringUtils;

@Controller
@RequestMapping("/mobile/project")
public class MobileProjectController extends BaseController {

	@Autowired
	ProjectService projectService;
	@Autowired
	ProjectCateService projectCateService;
	@Autowired
	UserService userService;
	@Autowired
	TagMatchService tagMatchService;
	@Autowired
	ScoreExchangeService scoreExchangeService;
	@Autowired
	mesgService mesgService;

	/**
	 * 发布项目
	 * 
	 * @param request
	 * @param uid
	 * @param projType
	 * @param projNeeds
	 * @param projTitle
	 * @param cid
	 * @param cateName
	 * @param projLocation
	 * @param moneyNeeds
	 * @param timesNumber
	 * @param applyTime
	 * @param startTime
	 * @param endTime
	 * @param projDesc
	 * @param projPicPath
	 * @param squareNeeds
	 * @param tags
	 * @param response
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "publishProject", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView publishNews(HttpServletRequest request, @RequestParam(required = false) Integer uid,
			@RequestParam(required = false) Integer projType, @RequestParam(required = false) String projNeeds,
			@RequestParam(required = false) String projName, @RequestParam(required = false) Integer cid,
			@RequestParam(required = false) String projLocation, @RequestParam(required = false) String province,
			@RequestParam(required = false) Integer moneyNeeds, @RequestParam(required = false) Integer timesNumber,
			@RequestParam(required = false) String applyTime, @RequestParam(required = false) String startTime,
			@RequestParam(required = false) String endTime, @RequestParam(required = false) String projDesc,
			@RequestParam(required = false) String projPicPath, @RequestParam(required = false) Integer squareNeeds,
			@RequestParam(required = false) List<Integer> tags, HttpServletResponse response) throws ParseException {

		// 格式化时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");
		applyTime = sdf1.format(sdf.parse(applyTime));
		startTime = sdf1.format(sdf.parse(startTime));
		endTime = sdf1.format(sdf.parse(endTime));

		// 1.获取发布者
		JkUser jkUser = userService.getUserBySession(request);
		if (jkUser == null)
			return new ModelAndView("redirect:/mobile/login/toHome");
		// 2.获取项目类型
		JkProjectCate JkProjectCate = projectCateService.getCateById(cid);
		if (JkProjectCate == null)
			new ModelAndView("redirect:/mobile/login/toHome");
		// 设置归属地
		if (!StringUtils.isNullOrEmpty(projLocation))
			projLocation = province + ":" + projLocation;
		// 2.保存
		projectService.saveProject(null, projType, projNeeds, projName, cid, JkProjectCate.getCateName(), projLocation,
				moneyNeeds, timesNumber, applyTime, startTime, endTime, projDesc, projPicPath, (String) null, (String) null, squareNeeds,
				tags, 0, jkUser);
		// 3.发布项目获得积分
		scoreExchangeService.save(jkUser, null, null, 50, "发布项目", 0);

		// 4.项目推荐链接设置
		// 查询匹配结果
		List<Map<String, Object>> list = projectService.getProjectList(null, null, cid, null, projType == 0 ? 1 : 0,
				null, null, null, null, null, null, null, projLocation, null, null, null, null, 1);
		if (list.size() > 0) {
			StringBuffer url = new StringBuffer("<a href='\"/login/torecomlist?");
			url.append("cid=" + cid);
			url.append("&projLocation=" + projLocation);
			if (projType == 0) {
				url.append("&projType=" + 1 + "\"");
			} else {
				url.append("&projType=" + 0 + "\"");
			}
			url.append(">项目推荐链接");
			url.append("</a>");
			JkSysMesg jkSysMesg = new JkSysMesg();
			jkSysMesg.setContent(url.toString());
			jkSysMesg.setFromId(1);
			jkSysMesg.setToId(jkUser.getId());
			jkSysMesg.setType("0");
			jkSysMesg.setSendTime(new Date());
			mesgService.addmesg(jkSysMesg);
		}

		return new ModelAndView("redirect:/mobile/login/toHome?isPublish=1");
	}

}
