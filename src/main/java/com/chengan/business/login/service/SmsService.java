package com.chengan.business.login.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.login.dao.SmsDao;
import com.chengan.business.repo.model.JkSysSms;
import com.chengan.business.util.Conf;
import com.chengan.business.util.HttpUtil;
import com.chengan.business.util.NetEaseSmsUtil;
import com.chengan.business.util.TipUtil;

import net.sf.json.JSONObject;

@Service
public class SmsService extends BaseService {

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
	 * @return
	 */
	public ServiceResult<JkSysSms> sendYzcode(String phone, Integer type) {
		// 1.请求服务器发送,暂时使用网易云信
		// 1.1设置参数
		Map<String, Object> map = new HashMap<>();
		map.put("mobile", phone);
		map.put("templateid", Conf.SMSTEMPID);
		// 1.2设置请求头
		Map<String, String> headers = new HashMap<>();
		headers.put("AppKey", NetEaseSmsUtil.AppKey);
		headers.put("Nonce", NetEaseSmsUtil.Nonce);
		String current = System.currentTimeMillis() + "";
		headers.put("CurTime", current);
		headers.put("CheckSum", NetEaseSmsUtil.getCheckSum(NetEaseSmsUtil.AppSecret, NetEaseSmsUtil.Nonce, current));
		String response = null;
		try {
			response = HttpUtil.doPost(Conf.SMS_SERVICE_URL, map, headers);
		} catch (Exception e) {
			logger.warn(e + "");
			// 返回发送失败
			return generateResult(COMMONFAIL, TipUtil.smsSendFail, null);
		}
		// 2.分析发送结果
		JSONObject obj = JSONObject.fromObject(response);

		if (obj.optInt("code") == Conf.SMSSUCCESS) {
			// 2.1验证码入库
			JkSysSms sms = new JkSysSms();
			sms.setPhone(phone);
			sms.setContent(String.format("您的验证码为%s，10分钟内有效。", obj.optString("obj")));
			sms.setValue(obj.optString("obj"));
			sms.setStatus(0);// 0表示创建短信
			sms.setSendTime(new Date());
			sms.setType(type);// 0表示注册短信
			sms.setSid(obj.optString("msg"));
			try {
				smsDao.save(sms);
			} catch (Exception e) {
				logger.warn(e + "");
				// 入库失败则需要重新发送
				return generateResult(DBFAIL, TipUtil.smsSqlFail, null);
			}
			// 3.2一切正常返回success加上sid
			return generateResult(sms);
		}
		// 3.短信发送故障返回
		if (obj.optInt("code") == Conf.SMSASKFREQ)
			return generateResult(DBFAIL, TipUtil.smsAskTooSoon, null);
		else if (obj.optInt("code") == Conf.SMSOVERTOTAL)
			return generateResult(DBFAIL, TipUtil.smsAskTooMuch, null);
		else
			return generateResult(DBFAIL, TipUtil.smsAskError, null);
	}

	/**
	 * 验证码
	 * 
	 * @param phone
	 * @param yzcode
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
