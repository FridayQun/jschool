package com.chengan.business.template.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkUserMapper;
import com.chengan.business.repo.model.JkUser;
import com.github.pagehelper.PageHelper;

@Repository
public class TempuserDao extends BaseDao<JkUser> {
	@Autowired
	JkUserMapper jkUserMapper;

	public List<Map<String, Object>> gettempuserList(Integer isauthen, Integer pageNumber, Integer pageSize,
			Integer phone, Integer tag, Integer idtype, String logintime, String logintime2) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (isauthen != null) {
			map.put("isauthen", isauthen);
		}
		if (tag != null) {
			map.put("tag", tag);
		}
		if (phone != null) {
			map.put("phone", phone);
		}
		if (idtype != null) {
			map.put("idtype", idtype);
		}
		if (logintime != null) {
			map.put("logintime", logintime);
		}
		if (logintime2 != null) {
			map.put("logintime2", logintime2);
		}
		if (pageNumber != null && pageSize != null) {
			int start = (pageNumber - 1) * pageSize;
			map.put("start", start);
			map.put("pageSize", pageSize);
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}
		List<Map<String, Object>> list = jkUserMapper.tempgetuserlist(map);
		return list;
	}
}
