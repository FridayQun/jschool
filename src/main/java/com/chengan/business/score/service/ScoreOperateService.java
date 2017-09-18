package com.chengan.business.score.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.repo.model.JkScoreOperate;
import com.chengan.business.score.dao.ScoreOperateDao;

@Service
public class ScoreOperateService extends BaseService {

	@Autowired
	ScoreOperateDao scoreOperateDao;

	public List<JkScoreOperate> getList(String operateName, Integer Page, Integer pageSize) {

		return scoreOperateDao.geList(operateName, Page, pageSize);

	}

	public int saveOrUpdate(JkScoreOperate jkScoreOperate) {
		int result = -1;
		if (jkScoreOperate.getId() != null) {
			scoreOperateDao.updateAll(jkScoreOperate);
		} else {
			scoreOperateDao.save(jkScoreOperate);
		}
		return result;
	}

	public void delete(Integer id) {
		scoreOperateDao.delete(id);
	}

}
