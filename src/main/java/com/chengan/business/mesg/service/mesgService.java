package com.chengan.business.mesg.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.mesg.dao.msegDao;
import com.chengan.business.repo.model.JkSysMesg;
import com.mysql.fabric.xmlrpc.base.Data;

@Service
public class mesgService extends BaseService {
	@Autowired
	msegDao mesgDao;

	// 查询消息信息
	public List<JkSysMesg> getJkSysMesgList(Integer pageNumber, Integer pageSize, Integer type, Integer fromid,
			Integer toid, Integer id) {
		return mesgDao.getJkSysMesgList(pageNumber, pageSize, type, fromid, toid, id);
	}

	public int addmesg(JkSysMesg jkSysMesg) {
		if (jkSysMesg.getId() == null) {
			return mesgDao.addmeag(jkSysMesg);
		} else {
			return mesgDao.updateNotNull(jkSysMesg);
		}

	}

	public List<Map<String, Object>> getJkSysMesgUserList(Integer pageNumber, Integer pageSize, Integer type,
			Integer fromid, Integer toid) {
		return mesgDao.getmesglist(pageNumber, pageSize, type, fromid, toid);
	}

	public List<Map<String, Object>> getmesglistuser(Integer pageNumber, Integer pageSize, Integer fromid,
			Integer toid) {
		return mesgDao.getmesglistuser(pageNumber, pageSize, fromid, toid);
	}

	public List<Map<String, Object>> getmesglistuserone(Integer userid, Integer loginid) {
		return mesgDao.getmesglistbyone(userid, loginid);
	}

	public List<JkSysMesg> getmesglistbyex(List<Integer> type, Integer istop, Integer pageNumber, Integer pageSize) {
		return mesgDao.getmesglistbyex(type, istop, pageNumber, pageSize);
	}

	public int delmesg(JkSysMesg jkSysMesg) {
		return mesgDao.delmesg(jkSysMesg);
	}

	public String getcountbyuidnotread(Integer toid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (toid != null) {
			map.put("toid", toid);
		}
		return mesgDao.getcountbyuidnotread(map);
	}

	public void updateisread(Integer fromid, Integer toid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (toid != null) {
			map.put("toid", toid);
		}

		if (fromid != null) {
			map.put("fromid", fromid);
		}

		mesgDao.updateisread(map);
	}

}
