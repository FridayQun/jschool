package com.chengan.business.fans.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.model.JkUserFans;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class FansDao extends BaseDao<JkUserFans> {
	/**
	 * 通过用户id获取粉丝信息
	 * 
	 * @param id
	 * 
	 */
	public List<JkUserFans> getFansListByid(Integer uid, Integer fanid, Integer page, Integer pagesize) {
		Example example = new Example(JkUserFans.class);
		if (page != null && pagesize != null) {
			PageHelper.startPage(page, pagesize, true, false);
		}
		Criteria criteria = example.createCriteria();
		if (uid != null) {
			criteria.andEqualTo("uid", uid);
		}
		if (fanid != null) {
			criteria.andEqualTo("fanId", fanid);
		}
		List<JkUserFans> list = this.selectByExample(example);
		return list;
	}

}
