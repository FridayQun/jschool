package com.chengan.business.util;

import com.alibaba.fastjson.JSONObject;
import com.chengan.business.repo.model.SMSApplyEntity;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

import java.util.List;
import java.util.Map;

public class AlidayuSmsUtil {

	public static final String key = "23568963";
	public static final String secret = "ec486d4d59019752fb525930c37dc9de";
	public static final String url = "http://gw.api.taobao.com/router/rest";
	public static final String sign = "鲸客校园";
	public static final String type = "normal";

	// 注册验证码模板id
	public static final String templeteId = "SMS_34400355";
	// 发布项目模板id
	public static final String publish_templeteId = "SMS_65350003";
	// 申请项目模板id
	//public static final String apply_templeteId = "SMS_65340046";
	// 申请项目模板id
	//public static final String login_warm_templeteId = "SMS_65340046";
	// 定时发送申请项目模板id
	public static final String apply_time_send_templeteId = "SMS_75870040";
	// 定时发送登录通知模板id
	public static final String login_time_send_templeteId = "SMS_75930057";

	public static String sendMessage(String id, String phone, String code, Integer type) {
		TaobaoClient client = new DefaultTaobaoClient(url, AlidayuSmsUtil.key, AlidayuSmsUtil.secret, "json");
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend(id);
		req.setSmsType(AlidayuSmsUtil.type);
		req.setSmsFreeSignName(AlidayuSmsUtil.sign);
		JSONObject obj = new JSONObject();
		obj.put("number", code);

		req.setSmsParamString(obj.toJSONString());
		req.setRecNum(phone);
		if (type == 0)
			req.setSmsTemplateCode(AlidayuSmsUtil.templeteId);
		else if (type == 1)
			req.setSmsTemplateCode(AlidayuSmsUtil.publish_templeteId);
		//else if (type == 2)
			//req.setSmsTemplateCode(AlidayuSmsUtil.apply_templeteId);
		else if (type == 3)
			req.setSmsTemplateCode(AlidayuSmsUtil.login_time_send_templeteId);
		AlibabaAliqinFcSmsNumSendResponse rsp = null;
		try {
			rsp = client.execute(req);
			System.out.println(rsp.getBody());
			return rsp.getBody();
		} catch (ApiException e) {
			e.printStackTrace();
			return TipUtil.netWorkError;
		}
	}

	public static String sendApplyMessage(SMSApplyEntity smsApplyEntity, Integer type) {
		AlibabaAliqinFcSmsNumSendResponse rsp = null;
		TaobaoClient client = new DefaultTaobaoClient(url, AlidayuSmsUtil.key, AlidayuSmsUtil.secret, "json");
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend("");
		req.setSmsType(AlidayuSmsUtil.type);
		req.setSmsFreeSignName(AlidayuSmsUtil.sign);
		JSONObject obj = new JSONObject();
		obj.put("username", smsApplyEntity.getUsername());
		if(type != 5){
			obj.put("project", smsApplyEntity.getProjectname());
		}
		req.setSmsParamString(obj.toJSONString());
		req.setRecNum(smsApplyEntity.getTelnumber());
		if (type == 0)
			req.setSmsTemplateCode(AlidayuSmsUtil.templeteId);
		else if (type == 1)
			req.setSmsTemplateCode(AlidayuSmsUtil.publish_templeteId);
		//else if (type == 2)
		//	req.setSmsTemplateCode(AlidayuSmsUtil.apply_templeteId);
		//else if (type == 3)
		//	req.setSmsTemplateCode(AlidayuSmsUtil.login_warm_templeteId);
		else if(type == 4)
			req.setSmsTemplateCode(AlidayuSmsUtil.apply_time_send_templeteId);
		else if(type == 5)
			req.setSmsTemplateCode(AlidayuSmsUtil.login_time_send_templeteId);
			try {
			rsp = client.execute(req);
			System.out.println(rsp.getBody());
			return rsp.getBody();
		} catch (ApiException e) {
			e.printStackTrace();
			return TipUtil.netWorkError;
		}
	}

	public static void main(String[] args) {
	}
}