package com.chengan.business.mobile.project.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.login.service.SmsAlidayuService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.project.service.ProjectApplyService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkProject;
import com.chengan.business.repo.model.JkProjectApply;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.service.ScoreExchangeService;

@Controller
@RequestMapping("/mobile/projectapply")
public class MobileProjectApplyController extends BaseController {

	@Autowired
	ProjectApplyService projectApplyService;
	@Autowired
	UserService userService;
	@Autowired
	ProjectService projectService;
	@Autowired
	ScoreExchangeService scoreExchangeService;
	@Autowired
	SmsAlidayuService smsAlidayuService;

	/**
	 * 申请项目
	 * 
	 * @param request
	 * @param pid
	 * @param words
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "applier", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> applier(HttpServletRequest request, @RequestParam(required = false) Integer pid,
			@RequestParam(required = false) String words) throws Exception {
		// 获取当前登录用户(既操作者)
		HttpSession session = request.getSession();
		Object login_userId = session.getAttribute("login_userId");
		// 如果不为null，则说明用户已登录
		JkUser user = null;
		if (login_userId != null)
			user = userService.getUserById(Integer.valueOf(login_userId.toString()));
		// 若用户未登录，则返回主页
		if (user == null) {
			return getResult(false, "请您登录后合作！");
		} else if (user.getUserLevel() < 2) {
			return getResult(false, "未认证！");
		}
		// 若用户已登录，则创建申请内容,保存
		else {
			// 判断该项目是不是用户自己的项目
			JkProject jkProject = projectService.getProjectById(pid);
			if (jkProject != null && jkProject.getUid() == user.getId()) {
				return getResult(false, "您不能申请自己发布的项目！");
			}
			// 判断该项目的申请是否已截止
			if (jkProject.getStatus() == -1 || jkProject.getApplyTime().getTime() < new Date().getTime()) {
				return getResult(false, "该项目申请已截止！");
			}
			// 判断该用户是否已申请过
			List<JkProjectApply> list = projectApplyService.getApplierList(pid, user.getId());
			if (list != null && list.size() > 0) {
				return getResult(false, "您已申请过该项目！");
			}
			projectApplyService.saveProjectApply(pid, user.getId(), words, user.getNickname(), user.getPhone(),
					user.getHeadPicPath());
			// 申请数加1
			projectService.addApplyCount(pid);
			// 申请项目获得积分
			scoreExchangeService.save(user, null, null, 10, "申请项目", 0);
			// 发送短信提醒发布者有人申请
			JkUser publish_user = userService.getUserById(jkProject.getUid());
			if (publish_user != null)
				smsAlidayuService.sendYzcode(publish_user.getPhone(), 2);

			return getResult(true, "申请成功！");
		}

	}
}
