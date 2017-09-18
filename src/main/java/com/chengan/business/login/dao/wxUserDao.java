package com.chengan.business.login.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.model.JkWXUser;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class wxUserDao extends BaseDao<JkWXUser> {

	/**
	 * 根据openid查询所有微信用户
	 * 
	 * @param openid
	 * @return
	 */
	public JkWXUser queryUserByOpenid(String wxopenid) {
		Example example = new Example(JkWXUser.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("wxopenid", wxopenid);
		List<JkWXUser> list = selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

	/**
	 * 根据手机号查询该用户
	 * 
	 * @param phone
	 * @return
	 */
	public JkWXUser findUserByPhone(String phone) {
		Example example = new Example(JkWXUser.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("phone", phone);
		List<JkWXUser> list = selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

}
