package com.chengan.business.project.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.login.service.SmsAlidayuService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.project.service.ProjectApplyService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkProject;
import com.chengan.business.repo.model.JkProjectApply;
import com.chengan.business.repo.model.JkSysMesg;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.service.ScoreExchangeService;

@Controller
@RequestMapping("/project")
public class ProjectApplyController extends BaseController {

	@Autowired
	ProjectApplyService projectApplyService;
	@Autowired
	UserService userService;
	@Autowired
	ProjectService projectService;
	@Autowired
	ScoreExchangeService scoreExchangeService;
	@Autowired
	mesgService mesgService;
	@Autowired
	SmsAlidayuService smsAlidayuService;

	/**
	 * 获取申请的项目列表
	 * 
	 * @param request
	 * @param response
	 * @param pid
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "getApplierList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getApplierList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false) Integer pid, @RequestParam(required = false) Integer uid) {
		// 1.根据参数获取项目列表
		List<JkProjectApply> list = projectApplyService.getApplierList(pid, uid);
		return getResult("list", list);
	}

	/**
	 * 获取申请的项目列表
	 * 
	 * @param request
	 * @param response
	 * @param pid
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "getProjectByApUid", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getProjectByApUid(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer pageSize,
			@RequestParam(required = false) int uid) {
		// 1.根据参数获取项目列表
		List<Map<String, String>> list = projectApplyService.getProjectByApUid(uid, page, pageSize);
		return getResult("newsList", list);
	}

	@RequestMapping(value = "canApplier", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> canApplier(HttpServletRequest request, @RequestParam(required = false) Integer pid)
			throws Exception {

		// 获取当前登录用户(既操作者)
		HttpSession session = request.getSession();
		Object login_userId = session.getAttribute("login_userId");
		// 如果不为null，则说明用户已登录
		JkUser user = null;
		if (login_userId != null) {
			user = userService.getUserById(Integer.valueOf(login_userId.toString()));
		}
		// 若用户未登录，则返回主页
		if (user == null) {
			return getResult(false, "您未登陆！");
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
			return getResult(true, "");
		}

	}

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
	public String applier(HttpServletRequest request, Model model, @RequestParam(required = false) Integer pid,
			@RequestParam(required = false) String words) throws Exception {
		// 获取当前登录用户(既操作者)
		HttpSession session = request.getSession();
		Object login_userId = session.getAttribute("login_userId");
		// 如果不为null，则说明用户已登录
		JkUser user = null;
		if (login_userId != null) {
			user = userService.getUserById(Integer.valueOf(login_userId.toString()));
		}
		// 若用户未登录，则返回主页
		if (user == null) {
			model.addAttribute("applyStatus", "您未登陆！");
			return "project-apply";
		}
		// 若用户已登录，则创建申请内容,保存
		else {
			// 判断该项目是不是用户自己的项目
			JkProject jkProject = projectService.getProjectById(pid);
			model.addAttribute("projId", jkProject.getId());
			model.addAttribute("projName", jkProject.getProjName());
			if (jkProject != null && jkProject.getUid() == user.getId()) {
				model.addAttribute("applyStatus", "您不能申请自己发布的项目！");
				return "project-apply";
			}
			// 判断该项目的申请是否已截止
			if (jkProject.getStatus() == -1 || jkProject.getApplyTime().getTime() < new Date().getTime()) {
				model.addAttribute("applyStatus", "该项目申请已截止！");
				return "project-apply";
			}
			// 判断该用户是否已申请过
			List<JkProjectApply> list = projectApplyService.getApplierList(pid, user.getId());
			if (list != null && list.size() > 0) {
				model.addAttribute("applyStatus", "您已申请过该项目！");
				return "project-apply";
			}
			projectApplyService.saveProjectApply(pid, user.getId(), words, user.getNickname(), user.getPhone(),
					user.getHeadPicPath());
			// 申请数加1
			projectService.addApplyCount(pid);
			// 申请项目获得积分
			scoreExchangeService.save(user, null, null, 10, "申请项目", 0);
			model.addAttribute("applyStatus", "申请成功！");
			// 发送短信提醒发布者有人申请
			JkUser publish_user = userService.getUserById(jkProject.getUid());
			if (publish_user != null)
				smsAlidayuService.sendYzcode(publish_user.getPhone(), 2);

			return "project-apply";
		}

	}

	@RequestMapping(value = "agreeApply", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> agreeApply(HttpServletRequest request, Model model,
			@RequestParam(required = false) Integer id) throws Exception {
		// 获取当前登录用户(既操作者)
		HttpSession session = request.getSession();
		Object login_userId = session.getAttribute("login_userId");
		// 如果不为null，则说明用户已登录
		JkUser user = null;
		if (login_userId != null) {
			user = userService.getUserById(Integer.valueOf(login_userId.toString()));
		}
		// 若用户未登录，则返回主页
		if (user == null) {
			model.addAttribute("applyStatus", "您未登陆！");
			return getResult(false, "您未登陆！");
		}
		// 若用户已登录，则创建申请内容,保存
		else {
			JkProjectApply jkProjectApply = projectApplyService.getApplierById(id);
			JkProject jkProject = null;
			if (jkProjectApply != null)
				jkProject = projectService.getProjectById(jkProjectApply.getPid());
			if (jkProjectApply == null) {
				return getResult(false, "找不到该申请！");
			} else if (jkProject == null) {
				return getResult(false, "找不到该项目！");
			} else if (jkProject.getUid() != user.getId()) {
				return getResult(false, "这不是您发布的项目，不能同意！");
			} else {
				if (jkProjectApply.getStatus() != 1) {
					// 设置申请状态
					jkProjectApply.setStatus(1);
					projectApplyService.update(jkProjectApply);
					// 发送站内信通知
					JkSysMesg jkSysMesg = new JkSysMesg();
					jkSysMesg.setContent("您有申请的项目：" + jkProject.getProjName() + " 已达成合作");
					jkSysMesg.setFromId(1);
					jkSysMesg.setToId(jkProjectApply.getUid());
					jkSysMesg.setType("0");
					jkSysMesg.setSendTime(new Date());
					mesgService.addmesg(jkSysMesg);
					// 增加积分
					Integer num1 = scoreExchangeService.countByUidAndTimeAndName(null, jkProject.getId(), null, "达成合作");
					Integer num2 = scoreExchangeService.countByUidAndTimeAndName(null, jkProject.getId(), null, "撤销合作");
					JkUser apply_user = userService.getUserById(jkProjectApply.getUid());
					if (apply_user != null && (num1 == num2)) {
						scoreExchangeService.save(user, null, jkProject.getId(), 150, "达成合作", 0);
					}
					if (apply_user != null) {
						scoreExchangeService.save(apply_user, null, jkProject.getId(), 150, "达成合作", 0);
					}

					return getResult(true, "达成合作！");
				} else {
					// 设置申请状态
					jkProjectApply.setStatus(0);
					projectApplyService.update(jkProjectApply);
					// 发送站内信通知
					JkSysMesg jkSysMesg = new JkSysMesg();
					jkSysMesg.setContent("您有申请的项目：" + jkProject.getProjName() + " 已被拒绝合作");
					jkSysMesg.setFromId(1);
					jkSysMesg.setToId(jkProjectApply.getUid());
					jkSysMesg.setType("0");
					jkSysMesg.setSendTime(new Date());
					mesgService.addmesg(jkSysMesg);
					// 删除积分
					Integer num1 = scoreExchangeService.countByUidAndTimeAndName(null, jkProject.getId(), null, "达成合作");
					Integer num2 = scoreExchangeService.countByUidAndTimeAndName(null, jkProject.getId(), null, "撤销合作");
					JkUser apply_user = userService.getUserById(jkProjectApply.getUid());
					if (apply_user != null) {
						scoreExchangeService.save(apply_user, null, jkProject.getId(), -150, "撤销合作", 0);
					}
					if (apply_user != null && num1 == num2 + 2) {
						scoreExchangeService.save(user, null, jkProject.getId(), -150, "撤销合作", 0);
					}

					return getResult(true, "已拒绝合作！");
				}
			}
		}

	}
}
