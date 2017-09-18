package com.chengan.business.follows.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseDao;
import com.chengan.business.base.BaseService;
import com.chengan.business.follows.dao.FollowsDao;
import com.chengan.business.repo.model.JkUserFollows;

@Service
public class FollowsSevice extends BaseService {
	@Autowired
	FollowsDao followsDao;

	public List<JkUserFollows> getFllowsListByUid(Integer id) {
		if (id != null) {
			return followsDao.getFollowListByUid(id);
		}
		return null;
	}
}
