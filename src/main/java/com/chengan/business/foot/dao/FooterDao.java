package com.chengan.business.foot.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkFootMapper;
import com.chengan.business.repo.model.JkFoot;

@Repository
public class FooterDao extends BaseDao<JkFoot> {

	@Autowired
	JkFootMapper jkFootMapper;

}
