package com.chengan.business.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.repo.model.JkUserHistory;
import com.chengan.business.user.dao.UserHistoryDao;

@Service
public class UserHistoryService extends BaseService {
	@Autowired
	UserHistoryDao userHistoryDao;

	public int save(Integer type, Integer fid, Integer uid, String historyPicPath, String historyDesc) {
		int result = -1;
		JkUserHistory history = new JkUserHistory();
		history.setType(2);
		history.setFid(fid);
		history.setUid(uid);
		history.setHistoryPicPath(historyPicPath);
		history.setHistoryDesc(historyDesc);
		result = userHistoryDao.save(history);
		return result;
	}

}
