package com.chengan.business.repo.entity;

import java.util.List;
import java.util.Map;

import com.chengan.business.repo.IBaseMapper;
import com.chengan.business.repo.model.JkSysMesg;

public interface JkSysMesgMapper extends IBaseMapper<JkSysMesg> {

	public List<Map<String, Object>> getmesglist(Integer pageNumber, Integer pageSize, Integer type, Integer fromid,
			Integer toid);

	public List<Map<String, Object>> getmesglistuser(Map<String, Object> map);

	public List<Map<String, Object>> getmesglistbyone(Map<String, Object> map);

	public String getcountbyuidnotread(Map<String, Object> map);

	public void updateisread(Map<String, Object> map);

}