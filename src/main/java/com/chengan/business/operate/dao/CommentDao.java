package com.chengan.business.operate.dao;

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
import com.chengan.business.repo.entity.JkProjectCommentMapper;
import com.chengan.business.repo.model.JkProjectComment;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class CommentDao extends BaseDao<JkProjectComment> {
	@Autowired
	JkProjectCommentMapper jkProjectCommentMapper;
	
	public List<Map<Object, Object>> selectCommentList(Integer uid, Integer fid, Integer type) {
		return selectCommentList(uid, fid, type, null, null);
	}

	public List<Map<Object, Object>> selectCommentList(Integer uid, Integer fid, Integer type, Integer page, Integer pageSize) {
		if (page != null && pageSize != null)
			PageHelper.startPage(page, pageSize, true, false);
		PageHelper.orderBy("uid desc, fid desc");

		Map<String, Object> params = new HashMap<>();
		if (uid != null)
			params.put("uid", uid);
		if (fid != null)
			params.put("fid", fid);
		if (type != null)
			params.put("type", type);
		List<Map<Object, Object>> list = jkProjectCommentMapper.getComments(params);
		return list.size() > 0 ? list : null;
	}

	public int count(Integer uid, Integer fid, Integer type) {
		Example example = new Example(JkProjectComment.class);
		Criteria criteria = example.createCriteria();
		if(uid != null)
			criteria.andEqualTo("uid", uid);
		if(fid != null)
			criteria.andEqualTo("fid", fid);
		if(type != null)
			criteria.andEqualTo("type", type);
		return jkProjectCommentMapper.selectCountByExample(example);
	}
	
	public int countToday(Integer uid, Integer fid, Integer type) {
		Example example = new Example(JkProjectComment.class);
		Criteria criteria = example.createCriteria();
		if(uid != null)
			criteria.andEqualTo("uid", uid);
		if(fid != null)
			criteria.andEqualTo("fid", fid);
		if(type != null)
			criteria.andEqualTo("type", type);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		df.setTimeZone(TimeZone.getTimeZone("UTC"));
		criteria.andGreaterThanOrEqualTo("createTime", df.format(((new Date().getTime()+1000*3600*8)/1000/3600/24)*24*3600*1000));
		criteria.andLessThan("createTime", df.format(((new Date().getTime()+1000*3600*8)/1000/3600/24+1)*24*3600*1000));
		return jkProjectCommentMapper.selectCountByExample(example);
	}
}
