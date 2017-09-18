package com.chengan.business.score.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.repo.model.JkScoreMall;
import com.chengan.business.score.dao.ScoreMallDao;

import tk.mybatis.mapper.entity.Example;

@Service
public class ScoreMallService extends BaseService {

	@Autowired
	ScoreMallDao scoreMallDao;

	public List<JkScoreMall> getScoreProductList() {
		Example example = new Example(JkScoreMall.class);
		List<JkScoreMall> list = new ArrayList<JkScoreMall>();
		list = scoreMallDao.selectByExample(example);
		return list;
	}

	public JkScoreMall getScoreProductById(Integer id) {
		JkScoreMall jkScoreMall = scoreMallDao.selectByKey(id);
		return jkScoreMall;
	}

	public List<JkScoreMall> getMallListPage(String productName, Integer page, Integer pageSize) {
		return scoreMallDao.getMallListPage(productName, page, pageSize);
	}

	public int saveOrUpdate(JkScoreMall jkScoreMall) {
		int result = -1;
		if (jkScoreMall.getId() != null) {
			scoreMallDao.updateAll(jkScoreMall);
		} else {
			scoreMallDao.save(jkScoreMall);
		}
		return result;
	}

	public void delete(Integer id) {
		scoreMallDao.delete(id);
	}
}
