package com.chengan.business.foot.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkFootDetailMapper;
import com.chengan.business.repo.model.JkFootDetail;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class FooterDetailDao extends BaseDao<JkFootDetail> {

	@Autowired
	JkFootDetailMapper jkFootDetailMapper;

	public int deleteByExample(Integer pId, List<Integer> ids) {
		Example example = new Example(JkFootDetail.class);
		Criteria criteria = example.createCriteria();
		if(pId != null) {
			criteria.andEqualTo("pId", pId);
		}
		try {
			ids.size();
			criteria.andIn("id", ids);
		} catch(NullPointerException e) {
			criteria.andEqualTo("id", 0);
		}
		return jkFootDetailMapper.deleteByExample(example);
	}
	
	public int saveByExample(Integer pId, List<String> urls) {
		List<JkFootDetail> details = new ArrayList<>();
		for(String s:urls) {
			JkFootDetail detail = new JkFootDetail();
			detail.setpId(pId);
			detail.setFootPicPath(s);
			details.add(detail);
		}
		return jkFootDetailMapper.insertList(details);
	}
}
