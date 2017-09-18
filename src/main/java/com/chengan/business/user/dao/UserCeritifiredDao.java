package com.chengan.business.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.model.JkUserCeritifired;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class UserCeritifiredDao extends BaseDao<JkUserCeritifired> {

	public int addJkUserCeritifired(JkUserCeritifired jkUserCeritifired) {
		if (jkUserCeritifired != null) {
			return this.save(jkUserCeritifired);
		} else {
			return 0;
		}

	}

	public int modJkUserCeritifired(JkUserCeritifired jkUserCeritifired) {
		if (jkUserCeritifired != null) {
			return this.updateNotNull(jkUserCeritifired);
		} else {
			return 0;
		}

	}

	public JkUserCeritifired ischecked(Integer uid, Integer state) {
		Example ex = new Example(JkUserCeritifired.class);
		Criteria criteria = ex.createCriteria();
		if (uid != null) {
			criteria.andEqualTo("uid", uid);
		}
		if (state != null) {
			criteria.andEqualTo("state", state);
		}
		List<JkUserCeritifired> list = selectByExample(ex);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public List<JkUserCeritifired> authlist(Integer uid, Integer pageNum, Integer pageSize) {
		Example ex = new Example(JkUserCeritifired.class);
		Criteria criteria = ex.createCriteria();
		criteria.andEqualTo("uid", uid);
		if (pageNum != null && pageSize != null) {
			PageHelper.startPage(pageNum, pageSize);
		}
		return this.selectByExample(ex);

	}

	public JkUserCeritifired getoneUserCeritifired(Integer id) {
		Example ex = new Example(JkUserCeritifired.class);
		Criteria criteria = ex.createCriteria();
		if (id != null) {
			criteria.andEqualTo("id", id);
		}
		List<JkUserCeritifired> list = this.selectByExample(ex);
		return list.size() > 0 ? list.get(0) : null;

	}
}
