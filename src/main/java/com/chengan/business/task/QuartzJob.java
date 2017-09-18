package com.chengan.business.task;

import java.text.SimpleDateFormat;
import java.util.*;

import com.chengan.business.project.dao.ProjectDao;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.SMSApplyEntity;
import com.chengan.business.template.service.tempuserService;
import com.chengan.business.user.service.UserInfoService;
import com.chengan.business.util.AlidayuSmsUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.chengan.business.login.service.UserService;

public class QuartzJob {
	@Autowired
	UserService userService;
	@Autowired
	ProjectService projectService;
	@Autowired
	tempuserService tempuserService;
	@Autowired
	UserInfoService userInfoService;

	public void Pollball() {

		//禁言定时减
		userService.updateUserExtra();
		//项目定时减1
		projectService.updateProjectTop();
		//用户定时减1
//		userInfoService.updateUserTop();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		long dayTime = date.getTime()%(1000*60*60*24);
		if(dayTime >= 1000*60*60*7 && dayTime < 1000*60*60*7+1000*60*5) {
			System.out.println("更新用户禁言时间.");
			userService.updateExtraInt();
			//下午3点，在此执行程序。
			//发送定时短信
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String WeekBeforeTime1 = df.format((new Date()).getTime() - 3600 * 24 * 1000 * 7);
			String WeekBeforeTime2 = df.format((new Date()).getTime() - 3600 * 24 * 1000 * 8);
			String MonthBeforeTime1 = df.format((new Date()).getTime() - 3600 * 24 * 1000 * 30);
			String MonthBeforeTime2 = df.format((new Date()).getTime() - 3600 * 24 * 1000 * 31);
			String YearBeforeTime1 = df.format((new Date()).getTime() - 3600 * 24 * 1000 * 365);
			String YearBeforeTime2 = df.format((new Date()).getTime() - 3600 * 24 * 1000 * 366);
			//超过一个星期没有登录
			List<Map<String, Object>> weekUser = tempuserService.gettempuserList(null, null, null,
					null, null, null, WeekBeforeTime2, WeekBeforeTime1);
			System.out.println("//超过一个星期没有登录");
			System.out.println(WeekBeforeTime1);
			System.out.println(WeekBeforeTime2);
			System.out.println(weekUser);
			//超过一个月没有登录
			List<Map<String, Object>> monthUser = tempuserService.gettempuserList(null, null, null,
					null, null, null, MonthBeforeTime2, MonthBeforeTime1);

			//超过一年没有登录
			List<Map<String, Object>> yearUser = tempuserService.gettempuserList(null, null, null,
					null, null, null, YearBeforeTime2, YearBeforeTime1);

			//这里是获取userList
			Set<SMSApplyEntity> SMSApplyEntityList = projectService.getUserList();

			//申请发送短信处
			if(SMSApplyEntityList.size() == 0){
				System.out.println("需要发送的申请短信为0，不需要发送申请短线");
			}else{
				//这里只要发一次对吧
				for(SMSApplyEntity smsApplyEntity : SMSApplyEntityList){
				if(SMSApplyEntityList!= null && SMSApplyEntityList.size()>0)
				/**
				 * 这里发送申请项目短信处
				 */
					AlidayuSmsUtil.sendApplyMessage(smsApplyEntity,4);
				}
			}

			if(weekUser.size() == 0){
				System.out.println("需要发送周登录提醒的短信为0,周登录提醒短信不需要发送");
			}else{
				for(Map<String, Object> User : weekUser){
					SMSApplyEntity entity = new SMSApplyEntity();
					entity.setUsername((String)User.get("username"));
					entity.setTelnumber((String)User.get("phone"));
					AlidayuSmsUtil.sendApplyMessage(entity,5);
				}
			}


			if(monthUser.size() == 0){
				System.out.println("需要发送月登录提醒的短信为0,月登录提醒短信不需要发送");
			}else{
				for(Map<String, Object> User : monthUser){
					SMSApplyEntity entity = new SMSApplyEntity();
					entity.setUsername((String)User.get("username"));
					entity.setTelnumber((String)User.get("phone"));
					AlidayuSmsUtil.sendApplyMessage(entity,5);
				}
			}

			if(yearUser.size() == 0){
				System.out.println("需要发送年登录提醒的短信为0,年登录提醒短信不需要发送");
			}else{
				for(Map<String, Object> User : yearUser){
					SMSApplyEntity entity = new SMSApplyEntity();
					entity.setUsername((String)User.get("username"));
					entity.setTelnumber((String)User.get("phone"));
					AlidayuSmsUtil.sendApplyMessage(entity,5);
				}
			}
		}

		System.out.println(sdf.format(date) + " 当前服务器时间");
	}
}
