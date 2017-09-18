package com.chengan.business.sysmodule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.repo.model.JkSysModule;
import com.chengan.business.sysmodule.dao.SysModuleDao;
import com.github.pagehelper.PageHelper;
import com.mysql.jdbc.StringUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class SysModuleService extends BaseService {

	@Autowired
	SysModuleDao sysModuleDao;

	public List<JkSysModule> getListPage(String moduleName, Integer isShow, Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		PageHelper.orderBy("module_order desc");
		Example example = new Example(JkSysModule.class);
		Criteria criteria = example.createCriteria();
		if (!StringUtils.isNullOrEmpty(moduleName))
			criteria.andLike("moduleName", "%" + moduleName + "%");
		if (isShow != null) {
			criteria.andEqualTo("isShow", isShow);
		}
		return sysModuleDao.selectByExample(example);
	}

	public int saveOrUpdate(JkSysModule jkSysModule) {
		int result = -1;
		if (jkSysModule.getId() != null) {
			sysModuleDao.updateAll(jkSysModule);
		} else {
			sysModuleDao.save(jkSysModule);
		}
		return result;
	}

	public void delete(Integer id) {
		sysModuleDao.delete(id);
	}

}
