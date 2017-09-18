package com.chengan.business.sponsor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.repo.model.JkSponsor;
import com.chengan.business.sponsor.dao.SponsorDao;
import com.github.pagehelper.PageHelper;
import com.mysql.jdbc.StringUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class SponsorService extends BaseService {

	@Autowired
	SponsorDao sponsorDao;

	public List<JkSponsor> getListPage(String moduleName, Integer isShow, Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		Example example = new Example(JkSponsor.class);
		Criteria criteria = example.createCriteria();
		if (!StringUtils.isNullOrEmpty(moduleName))
			criteria.andLike("name", "%" + moduleName + "%");
		if (isShow != null) {
			criteria.andEqualTo("isShow", isShow);
		}
		return sponsorDao.selectByExample(example);
	}

	public int saveOrUpdate(JkSponsor jkSysModule) {
		int result = -1;
		if (jkSysModule.getId() != null) {
			sponsorDao.updateAll(jkSysModule);
		} else {
			sponsorDao.save(jkSysModule);
		}
		return result;
	}

	public void delete(Integer id) {
		sponsorDao.delete(id);
	}

}
