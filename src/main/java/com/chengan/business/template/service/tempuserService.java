package com.chengan.business.template.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.template.dao.TempuserDao;

@Service
public class tempuserService extends BaseService {

	@Autowired
	TempuserDao tempuserDao;

	public List<Map<String, Object>> gettempuserList(Integer isauthen, Integer pageNumber, Integer pageSize,
			Integer phone, Integer tag, Integer idtype, String logintime, String logintime2) {
		return tempuserDao.gettempuserList(isauthen, pageNumber, pageSize, phone, tag, idtype, logintime, logintime2);
	}

}
