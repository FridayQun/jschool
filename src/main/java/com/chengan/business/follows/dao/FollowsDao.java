package com.chengan.business.follows.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.model.JkUserFollows;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class FollowsDao extends BaseDao<JkUserFollows> {
	public List<JkUserFollows> getFollowListByUid(Integer id) {
		Example example = new Example(JkUserFollows.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("uid", id);
		return selectByExample(example);
	}
}
