package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkUserFansFollows;

public interface JkUserFansFollowsMapper extends IBaseMapper<JkUserFansFollows> {

	int deletefanfollw(Map map);

	List<Map<String, Object>> selectfanslist(Map map);

	List<Map<String, Object>> selectfollowslist(Map map);

}
