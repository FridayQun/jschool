package com.chengan.business.operate.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkAdmireMapper;
import com.chengan.business.repo.model.JkAdmire;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class AdmireDao extends BaseDao<JkAdmire> {

	@Autowired
	JkAdmireMapper jkadmireMapper;

	public JkAdmire selectAdmire(Integer fid, Integer uid, Integer type, Integer isCancel) {
		Example example = new Example(JkAdmire.class);
		Criteria criteria = example.createCriteria();
		if (fid != null)
			criteria.andEqualTo("fid", fid);
		if (uid != null)
			criteria.andEqualTo("uid", uid);
		if (type != null)
			criteria.andEqualTo("type", type);
		if (isCancel != null)
			criteria.andEqualTo("isCancel", 0);
		List<JkAdmire> list = selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

	public int selectCountToday(Integer uid) {
		Example example = new Example(JkAdmire.class);
		Criteria criteria = example.createCriteria();
		if (uid != null)
			criteria.andEqualTo("uid", uid);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		criteria.andEqualTo("description", df.format(new Date()));
		return jkadmireMapper.selectCountByExample(example);
	}
	
	public List<JkAdmire> selectByFidAndType(Integer fid, Integer type) {
		Example example = new Example(JkAdmire.class);
		Criteria criteria = example.createCriteria();
		if (fid != null)
			criteria.andEqualTo("fid", fid);
		if (type != null)
			criteria.andEqualTo("type", type);
		criteria.andEqualTo("isCancel", 0);
		List<JkAdmire> list = selectByExample(example);
		return list.size() > 0 ? list : null;
	}

}
