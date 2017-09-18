package com.chengan.business.login.dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.model.JkSysSms;
import com.chengan.business.util.Validator;
import com.github.pagehelper.StringUtil;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class SmsDao extends BaseDao<JkSysSms> {

	/**
	 * 根据时间查询短信记录数
	 * 
	 * @return
	 */
	public List<JkSysSms> querySmsByNowDate(String phone) {
		// 1.创建今天0点至今的两个时间点
		Date date1 = Validator.getToday();
		Date date2 = Validator.getDayOffsetToday(1);
		// 2.根据两个时间点进行查询
		Example example = new Example(JkSysSms.class);
		Criteria criteria = example.createCriteria();
		if (StringUtil.isNotEmpty(phone)) {
			criteria.andEqualTo("phone", phone);
		}
		criteria.andBetween("sendTime", date1, date2);
		example.orderBy("sendTime").desc();
		return selectByExample(example);
	}

	/**
	 * 查询验证码相关的短信记录
	 * 
	 * @param phone
	 * @param sid
	 * @param yzCode
	 * @return
	 */
	public JkSysSms getSmsByPhoneAndSid(String phone, String sid, String yzCode) {
		Example example = new Example(JkSysSms.class);
		Criteria criteria = example.createCriteria();
		if (StringUtil.isNotEmpty(phone)) {
			criteria.andEqualTo("phone", phone);
		}
		if (StringUtil.isNotEmpty(sid)) {
			criteria.andEqualTo("sid", sid);
		}
		if (StringUtil.isNotEmpty(yzCode)) {
			criteria.andEqualTo("value", yzCode);
		}
		example.orderBy("sendTime").desc();
		List<JkSysSms> list = selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}
}
