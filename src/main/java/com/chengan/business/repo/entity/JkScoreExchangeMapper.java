package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkScoreExchange;

public interface JkScoreExchangeMapper extends IBaseMapper<JkScoreExchange> {

	public Integer selectcountofexshop(Map<String, Object> map);

	public Integer selectcountofanyway(Map<String, Object> map);

	public Integer countByUidAndTimeAndName(Map<String, Object> map);

	public List<Map<String, Object>> selectexchangmalllist(Map<String, Object> map);

	public List<Map<String, Object>> selectlisthavausermall(Map<String, Object> map);

}
