package com.chengan.business.user.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkUserHistoryMapper;
import com.chengan.business.repo.model.JkUserHistory;

@Repository
public class UserHistoryDao extends BaseDao<JkUserHistory> {
	@Autowired
	JkUserHistoryMapper jkUserHistoryMapper;

}
