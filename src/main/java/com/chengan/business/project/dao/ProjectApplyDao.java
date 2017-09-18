package com.chengan.business.project.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkProjectApplyMapper;
import com.chengan.business.repo.model.JkProjectApply;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class ProjectApplyDao extends BaseDao<JkProjectApply> {

	@Autowired
	JkProjectApplyMapper jkProjectApplyMapper;

	public List<JkProjectApply> queryProjectApplyList(Integer pid, Integer uid) {
		Example example = new Example(JkProjectApply.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("pid", pid);
		criteria.andEqualTo("uid", uid);
		return jkProjectApplyMapper.selectByExample(example);
	}

	public List<Map<String, Object>> queryProjectApplyListDetail(Integer pid, Integer uid) {
		Map<String, Object> params = new HashMap<>();
		params.put("pid", pid);
		params.put("uid", uid);
		return jkProjectApplyMapper.queryProjectApplyListDetail(params);
	}

	public List<Map<String, String>> getProjectByApUid(Map<String, Object> params, Integer page, Integer pageSize) {

		return jkProjectApplyMapper.getProjectByApUid(params);
	}

	public Integer selectcountbyuid(int uid) {

		return jkProjectApplyMapper.selectcountbyuid(uid);
	}
	
	public Integer selectcountbyuidToday(Integer uid) {
		Example example = new Example(JkProjectApply.class);
		Criteria criteria = example.createCriteria();
		if(uid != null)
			criteria.andEqualTo("uid", uid);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		df.setTimeZone(TimeZone.getTimeZone("UTC"));
		criteria.andGreaterThanOrEqualTo("createTime", df.format(((new Date().getTime()+1000*3600*8)/1000/3600/24)*24*3600*1000));
		criteria.andLessThan("createTime", df.format(((new Date().getTime()+1000*3600*8)/1000/3600/24+1)*24*3600*1000));
		return jkProjectApplyMapper.selectCountByExample(example);
	}

}
