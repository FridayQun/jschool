package com.chengan.business.fansfollows.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkUserFansFollowsMapper;
import com.chengan.business.repo.entity.JkUserMapper;
import com.chengan.business.repo.model.JkUserFansFollows;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class FansFollowsDao extends BaseDao<JkUserFansFollows> {
	@Autowired
	JkUserFansFollowsMapper jkUserFansFollowsMapper;

	public Integer addfanfollow(Integer fanid, Integer followid) {
		JkUserFansFollows jkUserFansFollows = new JkUserFansFollows();
		if (fanid != null && followid != null) {
			jkUserFansFollows.setFanId(fanid);
			jkUserFansFollows.setFollowId(followid);
			return this.save(jkUserFansFollows);
		}
		return null;
	}

	public JkUserFansFollows getOneFansByFollowId(Integer fanid, Integer followid) {

		if (fanid != null && followid != null) {
			Example example = new Example(JkUserFansFollows.class);
			Criteria criteria = example.createCriteria();
			criteria.andEqualTo("fanId", fanid);
			criteria.andEqualTo("followId", followid);
			List<JkUserFansFollows> daolist = selectByExample(example);
			if (daolist.size() != 0) {
				return daolist.get(0);
			}
		}
		return null;
	}

	public Integer delfanfollow(Integer fanid, Integer followid) {
		if (fanid != null && followid != null) {
			Map<String, Integer> params = new HashMap<String, Integer>();
			params.put("fanid", fanid);
			params.put("followid", followid);
			return jkUserFansFollowsMapper.deletefanfollw(params);
		}
		return null;
	}

	public List<Map<String, Object>> selectfollowslist(Integer id) {
		if (id != null) {
			Map<String, Integer> params = new HashMap<String, Integer>();
			params.put("id", id);
			return jkUserFansFollowsMapper.selectfollowslist(params);
		}
		return null;
	}

	public List<Map<String, Object>> selectfanslist(Integer id) {
		if (id != null) {
			Map<String, Integer> params = new HashMap<String, Integer>();
			params.put("id", id);
			return jkUserFansFollowsMapper.selectfanslist(params);
		}
		return null;
	}

	public List<Map<String, Object>> selectfanslistpage(Integer id, Integer pageNumber, Integer pageSize) {
		if (pageNumber != null && pageSize != null) {
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}

		if (id != null) {
			Map<String, Integer> params = new HashMap<String, Integer>();
			params.put("id", id);
			return jkUserFansFollowsMapper.selectfanslist(params);
		}
		return null;
	}

	public List<Map<String, Object>> selectfollowslistpage(Integer id, Integer pageNumber, Integer pageSize) {
		if (pageNumber != null && pageSize != null) {
			PageHelper.startPage(pageNumber, pageSize, true, false);
		}

		if (id != null) {
			Map<String, Integer> params = new HashMap<String, Integer>();
			params.put("id", id);
			return jkUserFansFollowsMapper.selectfollowslist(params);
		}
		return null;
	}

}
