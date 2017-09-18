package com.chengan.business.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.user.dao.UserCeritifiredDao;
import com.chengan.business.user.dao.UserCollectionDAO;

@Service
public class UserCollectionService {

	@Autowired
	UserCollectionDAO userCollectionDAO;

	public List<Map<String, Object>> getcollectList(int uid, int type, Integer pageSize, Integer pageNumber) {
		if (type == 1) {
			return userCollectionDAO.getcollectproject(uid, pageSize, pageNumber);
		} else if (type == 2) {
			return userCollectionDAO.getcollectnews(uid, pageSize, pageNumber);
		}
		return null;

	}
	
	public int getCountToday(Integer uid) {
		return userCollectionDAO.getCountToday(uid);
	}

}
