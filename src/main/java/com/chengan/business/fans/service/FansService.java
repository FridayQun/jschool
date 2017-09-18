package com.chengan.business.fans.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.fans.dao.FansDao;
import com.chengan.business.repo.model.JkUserFans;

@Service
public class FansService extends BaseService {

	@Autowired
	FansDao fansDao;

	/**
	 * 通过用户id获取粉丝信息
	 * 
	 * @param id
	 * 
	 */
	public List<JkUserFans> getfanslist(Integer id, Integer fanid, Integer page, Integer pagesize) {
		return fansDao.getFansListByid(id, fanid, page, pagesize);
	}
}
