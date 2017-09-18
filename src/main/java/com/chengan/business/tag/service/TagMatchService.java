package com.chengan.business.tag.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.repo.model.JkTagsMatch;
import com.chengan.business.tag.dao.TagMatchDao;

@Service
public class TagMatchService {

	@Autowired
	TagMatchDao tagMatchDao;

	/**
	 * 根据标签id集合和type获取关联对象id集合
	 * 
	 * @param tagIds
	 * @param type
	 * @return
	 */
	public List<Integer> getProjectListByTagids(List<Integer> tagIds, Integer type) {
		List<JkTagsMatch> JkTagsMatchList = tagMatchDao.getProjectidsByTagids(tagIds, type);
		List<Integer> list = new ArrayList<Integer>();
		for (JkTagsMatch jkTagsMatch : JkTagsMatchList) {
			list.add(jkTagsMatch.getFid());
		}
		return list;
	}

	public List<Integer> getUserIdByTagPid(List<Integer> tagPids, Integer type) {
		if(tagPids==null || type==null) {
			return null;
		}
		List<Integer> res = tagMatchDao.getUserIdByTagPid(tagPids, type);
		if(res != null) {
			res.add(-1);
		}
		return res;
	}
}
