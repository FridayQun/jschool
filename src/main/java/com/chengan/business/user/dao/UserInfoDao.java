package com.chengan.business.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkUserMapper;
import com.chengan.business.repo.model.JkUserInfo;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class UserInfoDao extends BaseDao<JkUserInfo> {
	@Autowired
	JkUserMapper jkUserMapper;

	public int updateUserTop(){
		return jkUserMapper.updateUserTop();
	}

	public JkUserInfo getUserInfoBYUid(Integer uid) {
		Example example = new Example(JkUserInfo.class);
		Criteria criteria = example.createCriteria();
		if (uid != null) {
			criteria.andEqualTo("uid", uid);
		} else {
			return null;
		}
		List<JkUserInfo> list = selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

	public void updatenotnull(JkUserInfo jkUserInfo) {
		this.updateNotNull(jkUserInfo);
	}

	public void insertuserinfo(JkUserInfo jkUserInfo) {
		save(jkUserInfo);
	}

	public List<Map<String, Object>> getUserList(Map<String, Object> map, String orderStr, Integer page,
			Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		if (orderStr != null)
			PageHelper.orderBy(orderStr);
		return jkUserMapper.getUserList(map);
	}

}
