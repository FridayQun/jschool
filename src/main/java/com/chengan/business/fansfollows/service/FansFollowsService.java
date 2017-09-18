package com.chengan.business.fansfollows.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.fansfollows.dao.FansFollowsDao;
import com.chengan.business.repo.model.JkUserFansFollows;

@Service
public class FansFollowsService extends BaseService {
	@Autowired
	FansFollowsDao fansFollowsDao;

	public int addfanfollow(Integer fanid, Integer followid) {
		return fansFollowsDao.addfanfollow(fanid, followid);
	}

	public JkUserFansFollows getOneFansByFollowId(Integer fanid, Integer followid) {
		return fansFollowsDao.getOneFansByFollowId(fanid, followid);
	}

	public Integer delfanfollow(Integer fanid, Integer followid) {
		return fansFollowsDao.delfanfollow(fanid, followid);
	}

	public List<Map<String, Object>> selectfanslist(Integer id, String username) {
		List<Map<String, Object>> res = fansFollowsDao.selectfanslist(id);
		List<Map<String, Object>> followsList = fansFollowsDao.selectfollowslist(id);
		for(Map<String, Object> item : res) {
			if(item == null) {
				continue;
			}
			if(username != null && String.valueOf(item.get("nickname")).indexOf(username) == -1) {
				item.put("FansFollowsServiceDelete", true);
				continue;
			}
			if(item.get("id") == null) {
				item.put("followed", false);
			}
			Integer uid = (Integer) item.get("id");
			for(Map<String, Object> follow : followsList) {
				if(follow == null) {
					continue;
				}
				if(((Integer)follow.get("id")) == uid) {
					item.put("followed", true);
				}
			}
			if(item.get("followed") == null) {
				item.put("followed", false);
			}
		}
		deleteFansFollowsServiceDelete(res);
		return res;
	}

	public List<Map<String, Object>> selectfanslistpage(Integer pageNumber, Integer pageSize, Integer id, String username) {
		List<Map<String, Object>> res = fansFollowsDao.selectfanslistpage(id, pageNumber, pageSize);
		List<Map<String, Object>> followsList = fansFollowsDao.selectfollowslist(id);
		for(Map<String, Object> item : res) {
			if(item == null) {
				continue;
			}
			if(username != null && String.valueOf(item.get("nickname")).indexOf(username) == -1) {
				item.put("FansFollowsServiceDelete", true);
				continue;
			}
			if(item.get("id") == null) {
				item.put("followed", false);
			}
			Integer uid = (Integer) item.get("id");
			for(Map<String, Object> follow : followsList) {
				if(follow == null) {
					continue;
				}
				if(((Integer)follow.get("id")) == uid) {
					item.put("followed", true);
				}
			}
			if(item.get("followed") == null) {
				item.put("followed", false);
			}
		}
		deleteFansFollowsServiceDelete(res);
		return res;
	}

	public List<Map<String, Object>> selectfollowslist(Integer id, String username) {
		List<Map<String, Object>> res = fansFollowsDao.selectfollowslist(id);
		for(Map<String, Object> item : res) {
			if(item == null) {
				continue;
			}
			if(username != null && String.valueOf(item.get("nickname")).indexOf(username) == -1) {
				item.put("FansFollowsServiceDelete", true);
				continue;
			}
			item.put("followed", true);
		}
		deleteFansFollowsServiceDelete(res);
		return res;
	}

	public List<Map<String, Object>> selectfollowslistpage(Integer pageNumber, Integer pageSize, Integer id, String username) {
		List<Map<String, Object>> res = fansFollowsDao.selectfollowslistpage(id, pageNumber, pageSize);
		for(Map<String, Object> item : res) {
			if(username != null && String.valueOf(item.get("nickname")).indexOf(username) == -1) {
				item.put("FansFollowsServiceDelete", true);
				continue;
			}
			item.put("followed", true);
		}
		deleteFansFollowsServiceDelete(res);
		return res;
	}

	void deleteFansFollowsServiceDelete(List<Map<String, Object>> res) {
		for(int i=res.size()-1; i>=0; i--) {
			if(res.get(i).containsKey("FansFollowsServiceDelete")) {
				res.remove(i);
			}
		}
	}
}
