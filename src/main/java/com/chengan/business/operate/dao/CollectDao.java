package com.chengan.business.operate.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkUserCollectionMapper;
import com.chengan.business.repo.model.JkAdmire;
import com.chengan.business.repo.model.JkUserCollection;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class CollectDao extends BaseDao<JkUserCollection> {

	@Autowired
	JkUserCollectionMapper jkUserCollectionMapper;

	public JkUserCollection selectCollect(Integer fid, Integer uid, Integer type) {
		Example example = new Example(JkAdmire.class);
		Criteria criteria = example.createCriteria();
		if (fid != null)
			criteria.andEqualTo("fid", fid);
		if (uid != null)
			criteria.andEqualTo("uid", uid);
		if (type != null)
			criteria.andEqualTo("type", type);
		List<JkUserCollection> list = selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

}
