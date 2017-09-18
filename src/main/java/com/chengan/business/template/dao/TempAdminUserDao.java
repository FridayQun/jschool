package com.chengan.business.template.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.model.JKAdminUser;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class TempAdminUserDao extends BaseDao<JKAdminUser> {

	public List<JKAdminUser> getAdminUserList(Integer phone, Integer pageNumber, Integer pageSize, String loginname,
			Integer id) {
		Example ex = new Example(JKAdminUser.class);
		Criteria criteria = ex.createCriteria();
		if (phone != null) {
			criteria.andEqualTo("phone", phone);
		}
		if (loginname != null) {
			criteria.andEqualTo("loginname", loginname);
		}
		if (pageNumber != null && pageSize != null) {
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}
		if (id != null) {
			criteria.andNotEqualTo("id", id);
		}

		return this.selectByExample(ex);
	}

	public JKAdminUser getLoginAdminUserList(String loginname, String password) {
		Example ex = new Example(JKAdminUser.class);
		Criteria criteria = ex.createCriteria();
		if (loginname != null) {
			criteria.andEqualTo("loginname", loginname);
		}
		if (password != null) {
			criteria.andEqualTo("password", password);
		}
		List<JKAdminUser> list = this.selectByExample(ex);
		return this.selectByExample(ex) == null || this.selectByExample(ex).size() == 0 ? null
				: this.selectByExample(ex).get(0);
	}

	public int addAdminUser(JKAdminUser jkAdminUser) {
		if (jkAdminUser != null) {
			return this.save(jkAdminUser);
		} else {
			return 0;
		}
	}

	public int modAdminUser(JKAdminUser jkAdminUser) {
		return this.updateNotNull(jkAdminUser);
	}

	public int delAdminUser(JKAdminUser jkAdminUser) {
		return this.delete(jkAdminUser);
	}

}
