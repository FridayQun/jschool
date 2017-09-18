package com.chengan.business.mesg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkSysMesgMapper;
import com.chengan.business.repo.model.JkSysMesg;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class msegDao extends BaseDao<JkSysMesg> {
	@Autowired
	JkSysMesgMapper jkSysMesgMapper;

	// 查询消息信息
	public List<JkSysMesg> getJkSysMesgList(Integer pageNumber, Integer pageSize, Integer type, Integer fromid,
			Integer toid, Integer id) {

		Example ex = new Example(JkSysMesg.class);
		Criteria criteria = ex.createCriteria();
		if (type != null) {
			criteria.andEqualTo("type", type);
		}
		if (toid != null) {
			criteria.andEqualTo("to_id", toid);
		}
		if (fromid != null) {
			criteria.andEqualTo("from_id", fromid);
		}

		if (id != null) {
			criteria.andEqualTo("id", id);
		}

		if (pageNumber != null && pageSize != null) {
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}
		return this.selectByExample(ex);

	}

	// 保存信息
	public int addmeag(JkSysMesg jkSysMesg) {
		if (jkSysMesg != null) {
			return this.save(jkSysMesg);
		}
		return 0;
	}

	public List<Map<String, Object>> getmesglist(Integer pageNumber, Integer pageSize, Integer type, Integer fromid,
			Integer toid) {

		return jkSysMesgMapper.getmesglist(pageNumber, pageSize, type, fromid, toid);

	}

	public List<Map<String, Object>> getmesglistuser(Integer pageNumber, Integer pageSize, Integer fromid,
			Integer toid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (fromid != null) {
			map.put("fromid", fromid);
		}
		if (toid != null) {
			map.put("toid", toid);
		}
		if (pageNumber != null && toid != null) {
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}
		return jkSysMesgMapper.getmesglistuser(map);

	}

	public List<Map<String, Object>> getmesglistbyone(Integer userid, Integer loginid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (userid != null) {
			map.put("userid", userid);
		}
		if (loginid != null) {
			map.put("loginid", loginid);
		}

		return jkSysMesgMapper.getmesglistbyone(map);

	}

	public List<JkSysMesg> getmesglistbyex(List<Integer> type, Integer istop, Integer pageNumber, Integer pageSize) {
		Example ex = new Example(JkSysMesg.class);
		Criteria criteria = ex.createCriteria();
		if (type != null) {
			criteria.andIn("type", type);
		}
		if (istop != null) {
			criteria.andEqualTo("istop", istop);
		}
		PageHelper.orderBy("send_time desc");
		if (pageNumber != null && pageSize != null) {
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}
		return this.selectByExample(ex);

	}

	public int delmesg(JkSysMesg jkSysMesg) {
		return this.delete(jkSysMesg);
	}

	public String getcountbyuidnotread(Map<String, Object> map) {
		return jkSysMesgMapper.getcountbyuidnotread(map);
	}

	public void updateisread(Map<String, Object> map) {

		jkSysMesgMapper.updateisread(map);

	}

}
