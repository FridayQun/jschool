package com.chengan.business.score.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkScoreOperateMapper;
import com.chengan.business.repo.model.JkScoreOperate;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class ScoreOperateDao extends BaseDao<JkScoreOperate> {

	@Autowired
	JkScoreOperateMapper jkScoreOperateMapper;

	public List<JkScoreOperate> geList(String operateName, Integer Page, Integer pageSize) {
		Example ex = new Example(JkScoreOperate.class);
		Criteria criteria = ex.createCriteria();
		if (operateName != null) {
			criteria.andEqualTo("operateName", operateName);
		}
		if (Page != null && pageSize != null) {
			PageHelper.startPage(Page, pageSize, true, false);
		}
		return selectByExample(ex);

	}

	public JkScoreOperate getEntityByName(String operateName) {
		Example ex = new Example(JkScoreOperate.class);
		ex.createCriteria().andEqualTo("operateName", operateName);
		List<JkScoreOperate> list = this.selectByExample(ex);
		return list == null || list.size() <= 0 ? null : list.get(0);
	}

}
