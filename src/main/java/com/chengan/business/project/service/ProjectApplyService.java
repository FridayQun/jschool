package com.chengan.business.project.service;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.project.dao.ProjectApplyDao;
import com.chengan.business.project.dao.ProjectDao;
import com.chengan.business.repo.model.JkProject;
import com.chengan.business.repo.model.JkProjectApply;

@Service
public class ProjectApplyService extends BaseService {

	@Autowired
	ProjectApplyDao projectApplyDao;
	@Autowired
	ProjectDao projectDao;

	public List<JkProjectApply> getApplierList(Integer pid, Integer uid) {
		Map<String, Object> params = new HashMap<>();
		if (pid != null)
			params.put("pid", pid);
		if (uid != null)
			params.put("uid", uid);
		return projectApplyDao.queryProjectApplyList(pid, uid);
	}

	public List<Map<String, Object>> getApplierListDetail(Integer pid, Integer uid) {
		return projectApplyDao.queryProjectApplyListDetail(pid, uid);
	}

	public JkProjectApply getApplierById(Integer id) {
		return projectApplyDao.selectByKey(id);
	}

	public List<Map<String, String>> getProjectByApUid(Integer uid, Integer page, Integer pageSize) {
		Map<String, Object> params = new HashMap<>();
		if (page != null && pageSize != null) {
			int start = (page - 1) * pageSize;
			int end = pageSize;
			System.out.println("start" + start);
			System.out.println("end" + end);
			params.put("start", start);
			params.put("end", end);

		}
		if (uid != null)
			params.put("uid", uid);
		return projectApplyDao.getProjectByApUid(params, page, pageSize);
	}

	public Integer selectcountbyuid(int uid) {
		return projectApplyDao.selectcountbyuid(uid);
	}
	
	public Integer selectcountbyuidToday(int uid) {
		return projectApplyDao.selectcountbyuidToday(uid);
	}

	public Integer update(JkProjectApply jkProjectApply) {
		return projectApplyDao.updateNotNull(jkProjectApply);
	}

	// 保存
	public int saveProjectApply(Integer pid, Integer uid, String words, String nickname, String phone,
			String headPicPath) throws ParseException {
		// 设置项目状态为申请中
		JkProject JkProject = projectDao.selectByKey(pid);
		if (JkProject != null) {
			JkProject.setStatus(3);
			projectDao.updateAll(JkProject);
		}
		// 保存申请记录
		JkProjectApply jkProjectApply = new JkProjectApply();
		// 项目id
		jkProjectApply.setPid(pid);
		// 留言
		jkProjectApply.setWords(words);
		// 申请人信息设置
		jkProjectApply.setUid(uid);
		jkProjectApply.setUserName(nickname);
		jkProjectApply.setUserPicPath(headPicPath);
		jkProjectApply.setPhone(phone);
		// 初始化申请状态
		jkProjectApply.setStatus(0);
		// 初始化申请时间
		jkProjectApply.setCreateTime(new Date());

		return projectApplyDao.save(jkProjectApply);
	}

}
