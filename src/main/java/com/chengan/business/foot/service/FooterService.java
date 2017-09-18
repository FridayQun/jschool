package com.chengan.business.foot.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.foot.dao.FooterDao;
import com.chengan.business.foot.dao.FooterDetailDao;
import com.chengan.business.repo.model.JkFoot;
import com.chengan.business.repo.model.JkFootDetail;
import com.github.pagehelper.PageHelper;
import com.mysql.jdbc.StringUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class FooterService extends BaseService {

	@Autowired
	FooterDao footerDao;
	
	@Autowired
	FooterDetailDao footerDetailDao;

	public List<JkFoot> getListPage(String name, String enName, Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		Example example = new Example(JkFoot.class);
		Criteria criteria = example.createCriteria();
		if (!StringUtils.isNullOrEmpty(name))
			criteria.andLike("footName", "%" + name + "%");
		if (!StringUtils.isNullOrEmpty(enName))
			criteria.andLike("footEnName", "%" + enName + "%");
		return footerDao.selectByExample(example);
	}
	
	public List<JkFootDetail> getDetailListPage(Integer pId, Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		Example example = new Example(JkFootDetail.class);
		Criteria criteria = example.createCriteria();
		if (pId != null)
			criteria.andEqualTo("pId", pId);
		return footerDetailDao.selectByExample(example);
	}

	public int saveOrUpdate(JkFoot jkFoot) {
		int result = -1;
		if (jkFoot.getId() != null) {
			footerDao.updateAll(jkFoot);
		} else {
			footerDao.save(jkFoot);
		}
		return result;
	}

	public void delete(Integer id) {
		footerDao.delete(id);
	}
	
	public void deleteList(Integer pId, List<Integer> ids) {
		footerDetailDao.deleteByExample(pId, ids);
	}
	
	public void saveList(JkFoot jkFoot, List<String> urls) {
		if(urls != null)
			footerDetailDao.saveByExample(jkFoot.getId(), urls);
	}

}
