package com.chengan.business.advertisement.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkAdvertisementMapper;
import com.chengan.business.repo.model.JkAdvertisement;

@Repository
public class AdvertisementDao extends BaseDao<JkAdvertisement> {

	@Autowired
	JkAdvertisementMapper jkAdvertisementMapper;

}
