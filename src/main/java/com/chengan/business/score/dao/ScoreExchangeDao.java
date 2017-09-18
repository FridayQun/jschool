package com.chengan.business.score.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkScoreExchangeMapper;
import com.chengan.business.repo.model.JkScoreExchange;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class ScoreExchangeDao extends BaseDao<JkScoreExchange> {

	@Autowired
	JkScoreExchangeMapper jkScoreExchangeMapper;

	// 查询兑换记录总数
	public Integer selectcountofexshop(Map<String, Object> map) {
		return jkScoreExchangeMapper.selectcountofexshop(map);
	}

	// 获取从各种方式获取的积分总数量
	public Integer selectcountofanyway(Map<String, Object> map) {
		return jkScoreExchangeMapper.selectcountofanyway(map);
	}

	// 查询用户某一天内某一操作的次数
	public Integer countByUidAndTimeAndName(Map<String, Object> map) {
		return jkScoreExchangeMapper.countByUidAndTimeAndName(map);
	}

	public List<JkScoreExchange> geListOfExchange(Integer uid, Integer type, Integer Page, Integer pageSize,
			Boolean ispid) {
		Example ex = new Example(JkScoreExchange.class);
		Criteria criteria = ex.createCriteria();
		if (uid != null) {
			criteria.andEqualTo("uid", uid);
		}
		if (type != null) {
			criteria.andEqualTo("type", type);
		}
		if (ispid) {
			criteria.andIsNotNull("pid");
		}
		if (Page != null && pageSize != null) {
			PageHelper.startPage(Page, pageSize, true, false);
			PageHelper.orderBy("create_time desc");
		}
		return selectByExample(ex);

	}

	public List<Map<String, Object>> selectexchangmalllist(Integer uid, Integer type, Integer creattime,
			String keywords, Integer page, Integer pagesize) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (keywords != null) {
			map.put("keywords", keywords);
		}
		if (uid != null) {
			map.put("uid", uid);
		}
		if (creattime != null) {
			map.put("creattime", creattime);
		}
		if (type != null) {
			map.put("type", type);
		}

		if (page != null && pagesize != null) {
			int start = (page - 1) * pagesize;
			map.put("start", start);
			map.put("pagesize", pagesize);

		}
		return jkScoreExchangeMapper.selectexchangmalllist(map);

	}

	public List<Map<String, Object>> selectlisthavausermall(String username, String productname, Integer type,
			Integer page, Integer pagesize) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (username != null) {
			map.put("username", username);
		}
		if (productname != null) {
			map.put("productname", productname);
		}
		if (type != null) {
			map.put("type", type);
		}

		if (page != null && pagesize != null) {
			PageHelper.startPage(page, pagesize, true, false);
			PageHelper.orderBy("e.create_time desc");

		}
		return jkScoreExchangeMapper.selectlisthavausermall(map);

	}

	// 查询某天是否登录过
	public JkScoreExchange isloginbytime(Integer uid, String startTime, String endTime, String operateName) {
		Example ex = new Example(JkScoreExchange.class);
		Criteria criteria = ex.createCriteria();
		if (uid != null) {
			criteria.andEqualTo("uid", uid);
		}
		if (operateName != null) {
			criteria.andEqualTo("operate_name", operateName);
		}
		if (startTime != null && endTime != null) {
			criteria.andBetween("create_time", startTime, endTime);
		}
		List<JkScoreExchange> list = this.selectByExample(ex);
		return list.size() > 0 ? list.get(0) : null;
	}

}
