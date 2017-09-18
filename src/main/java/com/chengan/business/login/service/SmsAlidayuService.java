package com.chengan.business.login.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.chengan.business.base.BaseService;
import com.chengan.business.login.dao.SmsDao;
import com.chengan.business.repo.model.JkSysSms;
import com.chengan.business.util.AlidayuSmsUtil;
import com.chengan.business.util.Conf;
import com.chengan.business.util.TipUtil;
import com.chengan.business.util.Validator;

@Service
public class SmsAlidayuService extends BaseService {

	@Autowired
	SmsDao smsDao;

	/**
	 * 检查请求发送短信是否合法
	 * 
	 * @param phone
	 * @return
	 */
	public ServiceResult<List<JkSysSms>> answerSmsRequest(String phone) {
		List<JkSysSms> list = smsDao.querySmsByNowDate(phone);
		// 返回null表示未发送过短信
		if (list.size() == 0)
			return generateResult(list);

		if (list.size() >= Conf.SMSPERDAY) {
			return generateResult(COMMONFAIL, TipUtil.smsTooMuch, list);
		}

		if (System.currentTimeMillis() - list.get(0).getSendTime().getTime() < Conf.SMSFREQ)
			return generateResult(COMMONFAIL, TipUtil.smsTooSoon, list);
		return generateResult(list);
	}

	/**
	 * 发送验证码
	 * 
	 * @param phone
	 * @param type
	 *            0注册短信 1发布项目通知 2申请项目通知 3用户未登录提醒
	 * @return
	 */
	public ServiceResult<JkSysSms> sendYzcode(String phone, Integer type) {
		// 1.请求服务器发送,使用阿里大于
		// 1.1设置参数
		String code = Validator.getYzcode();
		// 1.2使用阿里大于发送短信
		String response = AlidayuSmsUtil.sendMessage(System.currentTimeMillis() % 10000 + "", phone, code, type);
		// 2.分析发送结果
		JSONObject obj = JSONObject.parseObject(response);
		if(obj == null) {
			return null;
		}
		if (obj.containsKey("alibaba_aliqin_fc_sms_num_send_response")) {
			// 2.1验证码入库
			JkSysSms sms = new JkSysSms();
			sms.setPhone(phone);
			if (type == 0)
				sms.setContent(String.format("验证码%s，鲸客网账号安全验证，5分钟内有效，请勿将验证码提供给他人。", code));
			else if (type == 1)
				sms.setContent(String.format("通知，鲸客网项目发布通知。", code));
			else if (type == 2)
				sms.setContent(String.format("通知，鲸客网项目申请通知。", code));
			else if (type == 3)
				sms.setContent(String.format("通知，鲸客网登录提醒通知。", code));
			sms.setValue(code);
			sms.setStatus(0);// 0表示创建短信
			sms.setSendTime(new Date());
			sms.setType(type);// 0表示注册短信
			sms.setSid(obj.getJSONObject("alibaba_aliqin_fc_sms_num_send_response").getString("request_id"));
			try {
				smsDao.save(sms);
			} catch (Exception e) {
				logger.warn(e + "");
				// 入库失败则需要重新发送
				return generateResult(DBFAIL, TipUtil.smsSqlFail, null);
			}
			// 3.2一切正常返回success加上sid
			return generateResult(sms);
		} else if (obj.containsKey("error_response")) {
			return generateResult(obj.getJSONObject("error_response").getInteger("code"),
					obj.getJSONObject("error_response").getString("sub_msg"), null);
		}
		return null;
	}

	/**
	 * 验证码
	 * 
	 * @param phone
	 * @param yzCode
	 * @param sid
	 * @return
	 */
	public ServiceResult<JkSysSms> checkYzCode(String phone, String yzCode, String sid) {
		JkSysSms sms = smsDao.getSmsByPhoneAndSid(phone, sid, yzCode);
		if (sms == null)
			return generateResult(DBFAIL, TipUtil.smsNotExists, null);
		try {
			sms.setStatus(1);
			smsDao.updateNotNull(sms);
		} catch (Exception e) {
			logger.warn(e + "");
			// 返回发送失败
			return generateResult(DBFAIL, TipUtil.smsSqlFail, null);
		}
		return generateResult(sms);
	}
}
