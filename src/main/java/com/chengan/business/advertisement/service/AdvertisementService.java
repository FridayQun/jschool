package com.chengan.business.advertisement.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.advertisement.dao.AdvertisementDao;
import com.chengan.business.base.BaseService;
import com.chengan.business.repo.model.JkAdvertisement;
import com.github.pagehelper.PageHelper;
import com.mysql.jdbc.StringUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class AdvertisementService extends BaseService {

	@Autowired
	AdvertisementDao advertisementDao;

	public List<JkAdvertisement> getListPageOfAd(String title, Integer type, Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		PageHelper.orderBy("level desc,create_time desc");
		Example example = new Example(JkAdvertisement.class);
		Criteria criteria = example.createCriteria();
		if (type != null)
			criteria.andEqualTo("type", type);
		if (!StringUtils.isNullOrEmpty(title))
			criteria.andLike("title", "%" + title + "%");
		criteria.andGreaterThanOrEqualTo("endTime", new Date());
		criteria.andLessThanOrEqualTo("startTime", new Date());
		return advertisementDao.selectByExample(example);
	}

	public List<JkAdvertisement> getListPageOfAdWithoutTime(String title, Integer type, Integer page,
			Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		PageHelper.orderBy("level desc,create_time desc");
		Example example = new Example(JkAdvertisement.class);
		Criteria criteria = example.createCriteria();
		if (type != null)
			criteria.andEqualTo("type", type);
		if (!StringUtils.isNullOrEmpty(title))
			criteria.andLike("title", "%" + title + "%");
		return advertisementDao.selectByExample(example);
	}

	public int saveOrUpdate(JkAdvertisement jkAdvertisement) {
		int result = -1;
		if (jkAdvertisement.getId() != null) {
			advertisementDao.updateAll(jkAdvertisement);
		} else {
			advertisementDao.save(jkAdvertisement);
		}
		return result;
	}

	public void delete(Integer id) {
		advertisementDao.delete(id);
	}

}
