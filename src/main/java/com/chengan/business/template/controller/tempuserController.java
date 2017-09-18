package com.chengan.business.template.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.base.BaseController;
import com.chengan.business.login.service.SmsAlidayuService;
import com.chengan.business.login.service.SmsService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.repo.model.JkSysMesg;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserCeritifired;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.template.service.tempuserService;
import com.chengan.business.user.service.UserCeritifiredService;
import com.chengan.business.user.service.UserInfoService;
import com.github.pagehelper.Page;

@Controller()
@RequestMapping("/template/usermanagement")
public class tempuserController extends BaseController {
	@Autowired
	tempuserService tempuserService;

	@Autowired
	UserService userService;

	@Autowired
	UserCeritifiredService userCeritifiredService;

	@Autowired
	UserInfoService userInfoService;
	@Autowired
	mesgService mesgService;
	@Autowired
	SmsAlidayuService smsAlidayuService;

	@Autowired
	ScoreExchangeService scoreExchangeService;

	// 去用户管理
	@RequestMapping(value = "tousermanagement", method = RequestMethod.GET)
	public String touser(Model model) {
		return "template/user";
	}

	// 获取用户数据

	@RequestMapping(value = "getusertemplist", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getUserTempList(HttpServletRequest req, @RequestBody Map<String, Object> pagemap) {
		Integer pageNumber = (Integer) pagemap.get("pageNumber");
		Integer pageSize = (Integer) pagemap.get("pageSize");
		Integer isauthen = (Integer) pagemap.get("isauthen");
		Integer phone = (Integer) pagemap.get("phone");
		Integer tag = (Integer) pagemap.get("tag");
		Integer idtype = (Integer) pagemap.get("idtype");
		String date = (String) pagemap.get("logintime");
		String date2 = (String) pagemap.get("logintime2");
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = tempuserService.gettempuserList(isauthen, pageNumber, pageSize, phone, tag,
				idtype, date, date2);

		map.put("rows", ((Page<Map<String, Object>>) list));
		map.put("total", ((Page<Map<String, Object>>) list).getTotal());
		return map;
	}

	// 认证接口
	@RequestMapping(value = "authuser", method = RequestMethod.POST)
	@ResponseBody
	public String authuser(HttpServletRequest req, JkUser jkUser, JkUserCeritifired jkUserCeritifired, Integer uid,
			Integer cid) throws ParseException {

		jkUser.setId(uid);
		jkUser.setIdType(jkUserCeritifired.getType());

		jkUserCeritifired.setId(cid);
		userCeritifiredService.modUserCeritifired(jkUserCeritifired);
		if (jkUserCeritifired.getState() == 2) {
			// 表示不通过
			return "1";
		}

		// 认证通过修改用户信息
		jkUserCeritifired = userCeritifiredService.getoneuserceritifired(cid);

		if (jkUserCeritifired.getIdno() != null) {
			jkUser.setIdCard(jkUserCeritifired.getIdno().toString());
		}

		JkUserInfo jkUserInfo = null;
		jkUserInfo = userInfoService.getUserInfo(uid).getT();
		if (jkUserInfo == null) {
			jkUserInfo = new JkUserInfo();
			jkUserInfo.setUid(uid);
		}

		if (jkUserCeritifired.getCompany() != null) {
			jkUserInfo.setCompanyName(jkUserCeritifired.getCompany());
		}
		if (jkUserCeritifired.getPosition() != null) {
			jkUserInfo.setDepartName(jkUserCeritifired.getPosition());
		}

		if (jkUserCeritifired.getRealname() != null) {
			System.out.println(jkUserCeritifired.getRealname());
			jkUserInfo.setRealname(jkUserCeritifired.getRealname());
			jkUser.setNickname(jkUserCeritifired.getRealname());
		}
		if (jkUserCeritifired.getSchool() != null) {
			jkUserInfo.setEduName(jkUserCeritifired.getSchool());
		}
		if (jkUserCeritifired.getBranch() != null) {
			jkUserInfo.setEduCollage(jkUserCeritifired.getBranch());
		}
		if (jkUserCeritifired.getClub() != null) {
			jkUserInfo.setEduClub(jkUserCeritifired.getClub());
		}
		if (jkUserCeritifired.getMajor() != null) {
			jkUserInfo.setEduMajor(jkUserCeritifired.getMajor());
		}
		if (jkUserCeritifired.getLocation() != null) {
			jkUserInfo.setLocation(jkUserCeritifired.getLocation());
		}

		if (jkUserCeritifired.getEduStarttime() != null) {
			Date date = null;
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			date = formatter.parse(jkUserCeritifired.getEduStarttime());
			jkUserInfo.setEduTime(date);
		}
		if (jkUserInfo.getPermissions() == null) {
			jkUserInfo.setPermissions(2211);
		}
		userInfoService.saveuserinfo(jkUserInfo);
		userService.updatenotnull(jkUser);
		// 给用户添加积分
		if (jkUserCeritifired.getState() == 1) {
			if (scoreExchangeService.selectcountofanyway(jkUser.getId(), 0, "实名认证通过", null) == 0) {
				jkUser = userService.getUserById(jkUser.getId());
				scoreExchangeService.save(jkUser, null, null, 50, "实名认证通过", 0);
			}
		}

		return "1";
	}

	// 认证列表
	@RequestMapping(value = "authlist", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authlist(@RequestBody Map<String, Object> pagemap) {
		Integer pageNumber = (Integer) pagemap.get("pageNumber");
		Integer pageSize = (Integer) pagemap.get("pageSize");
		Integer uid = (Integer) pagemap.get("uid");

		List<JkUserCeritifired> list = userCeritifiredService.authlist(uid, pageNumber, pageSize);
		Map<String, Object> map = new HashMap<>();
		map.put("rows", ((Page) list));
		map.put("total", ((Page) list).getTotal());
		return map;
	}

	// 认证接口
	@RequestMapping(value = "getuserinfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getuserinfo(Integer uid) {

		Map<String, Object> map = userService.getUserWithInfoByUId(uid);
		return map;
	}

	@RequestMapping(value = "disableuser", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> disableuser(Integer id, @RequestParam(required = false) Integer extraInt) {
		JkUser jkUser = userService.getUserById(id);
		if(extraInt==null || extraInt==0) {
			jkUser.setExtraInt(11);
		} else {
			jkUser.setExtraInt(0);
		}
		userService.updatenotnull(jkUser);
		return getResult("extra_int", jkUser.getExtraInt());
	}

	@RequestMapping(value = "tomesg", method = RequestMethod.GET)
	public String tomeag() {
		return "template/mesg";
	}

	@RequestMapping(value = "addmesg", method = RequestMethod.POST)
	@ResponseBody
	public String addmesg(HttpServletRequest req, JkSysMesg jkSysMesg) {
		jkSysMesg.setSendTime(new Date());
		mesgService.addmesg(jkSysMesg);
		return "1";
	}

	@RequestMapping(value = "delmesg", method = RequestMethod.POST)
	@ResponseBody
	public int delmesg(HttpServletRequest req, JkSysMesg jkSysMesg) {
		return mesgService.delmesg(jkSysMesg);
	}

	@RequestMapping(value = "send", method = RequestMethod.POST)
	@ResponseBody
	public int send(HttpServletRequest req, String phone) {
		// 给用户发送短信
		// System.out.println(1);
		smsAlidayuService.sendYzcode(phone, 3);
		return 1;
	}

}
