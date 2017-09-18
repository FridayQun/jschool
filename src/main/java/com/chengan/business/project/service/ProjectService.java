package com.chengan.business.project.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.chengan.business.repo.entity.JkProjectMapper;
import com.chengan.business.repo.entity.JkUserMapper;
import com.chengan.business.repo.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.file.dao.FileDao;
import com.chengan.business.login.service.SmsAlidayuService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.project.dao.ProjectDao;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.tag.dao.TagMatchDao;
import com.mysql.jdbc.StringUtils;

@Service
public class ProjectService extends BaseService {

	@Autowired
	JkProjectMapper jkProjectMapper;
	@Autowired
	JkUserMapper jkUserMapper;
	@Autowired
	ProjectDao projectDao;
	@Autowired
	TagMatchDao tagMatchDao;
	@Autowired
	FileDao fileDao;
	@Autowired
	ScoreExchangeService scoreExchangeService;
	@Autowired
	UserService userService;
	@Autowired
	ProjectService projectService;
	@Autowired
	mesgService mesgService;
	@Autowired
	SmsAlidayuService smsAlidayuService;

	public int updateProjectTop(){
		return projectDao.updateProjectTop();
	}

	//获得需要发送短信的用户列表
	public Set<SMSApplyEntity> getUserList(){
		// 这里是干什么的
		List<Integer> pIdList = projectDao.getTimeList();
		if(pIdList.size() == 0){
			System.out.print("获取不到相应的申请信息。");
			return null;
		}
		Set<SMSApplyEntity> smsProjectList = new HashSet<>();
		for(Integer id : pIdList) {
			//这边获得那个Project
	        JkProject jkProject = jkProjectMapper.selectByPrimaryKey(id);
	        if(jkProject == null){
	        	System.out.println("并不存在这个，不进行任何操作。");
			}else{
				SMSApplyEntity entity = new SMSApplyEntity();
				int uid = jkProject.getUid();
				entity.setPid(jkProject.getId());
				entity.setProjectname(jkProject.getProjName());
				entity.setTelnumber(jkProject.getPhone());
				entity.setUsername(jkProject.getUsername());
				smsProjectList.add(entity);
			}
		}
		return smsProjectList;
	}



	public JkProject getProjectById(Integer id) {
		if (id == null)
			return null;
		JkProject jkProject = projectDao.selectByKey(id);

		return jkProject;
	}

	/**
	 * 查询用户发布的项目条数
	 * 
	 * @param id
	 * @return
	 */
	public ServiceResult<Integer> getTotalofProjectById(int id, List<Integer> status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("status", status);
		return generateResult(projectDao.getTotalOfprojectbyUid(map));
	}
	
	/**
	 * 查询用户当天发布的项目条数
	 * 
	 * @param id
	 * @return
	 */
	public ServiceResult<Integer> getTotalofProjectByIdToday(int id, List<Integer> status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("status", status);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		df.setTimeZone(TimeZone.getTimeZone("UTC"));
		map.put("createTime1", df.format(((new Date().getTime()+1000*3600*8)/1000/3600/24)*24*3600*1000));
		map.put("createTime2", df.format(((new Date().getTime()+1000*3600*8)/1000/3600/24+1)*24*3600*1000));
		return generateResult(projectDao.getTotalOfprojectbyUid(map));
	}

	public List<Map<String, String>> getRecomment(int type, int limit) {
		return projectDao.getRecomment(type, limit);
	}

	public List<Map<String, Object>> getProjectList(Integer uid, Integer loginUid, Integer cid, Integer parentCid,
			Integer projType, String projName, String cateName, Integer squareNeeds, Integer peopleNeeds,
			Integer timesNumber, String phone, Integer status, String projLocation, List<Integer> projectIds,
			String orderStr, Integer page, Integer pageSize, Integer isshutdown) {
		Map<String, Object> params = new HashMap<>();
		if (projType != null)
			params.put("projType", projType);
		if (projName != null)
			params.put("projName", projName);
		if (squareNeeds != null)
			params.put("squareNeeds", squareNeeds);
		if (peopleNeeds != null)
			params.put("peopleNeeds", peopleNeeds);
		if (timesNumber != null)
			params.put("timesNumber", timesNumber);
		if (phone != null)
			params.put("phone", phone);
		if (projectIds != null)
			params.put("projectIds", projectIds);
		if (uid != null)
			params.put("uid", uid);
		if (loginUid != null)
			params.put("loginUid", loginUid);
		if (cid != null)
			params.put("cid", cid);
		if (parentCid != null)
			params.put("parentCid", parentCid);
		if (status != null)
			params.put("status", status);
		if (isshutdown != null)
			params.put("isshutdown", isshutdown);
		if (!StringUtils.isNullOrEmpty(cateName))
			params.put("cateName", cateName);
		if (!StringUtils.isNullOrEmpty(projLocation) && !projLocation.equals("全部") && !projLocation.equals("不限"))
			params.put("projLocation", projLocation);
		return projectDao.queryProjectListByCond(params, orderStr, page, pageSize);
	}

	public List<Map<String, Object>> getProjectList(Integer uid, Integer loginUid, Integer cid, Integer parentCid,
			Integer projType, String projName, String cateName, Integer squareNeeds, Integer peopleNeeds,
			Integer timesNumber, String phone, Integer status, String projLocation, List<Integer> projectIds,
			String orderStr, Integer page, Integer pageSize, Integer isshutdown, Integer isRecomment) {
		Map<String, Object> params = new HashMap<>();
		if (projType != null)
			params.put("projType", projType);
		if (projName != null)
			params.put("projName", projName);
		if (squareNeeds != null)
			params.put("squareNeeds", squareNeeds);
		if (peopleNeeds != null)
			params.put("peopleNeeds", peopleNeeds);
		if (timesNumber != null)
			params.put("timesNumber", timesNumber);
		if (phone != null)
			params.put("phone", phone);
		if (projectIds != null)
			params.put("projectIds", projectIds);
		if (uid != null)
			params.put("uid", uid);
		if (loginUid != null)
			params.put("loginUid", loginUid);
		if (cid != null)
			params.put("cid", cid);
		if (parentCid != null)
			params.put("parentCid", parentCid);
		if (status != null)
			params.put("status", status);
		if (isshutdown != null)
			params.put("isshutdown", isshutdown);
		if (!StringUtils.isNullOrEmpty(cateName))
			params.put("cateName", cateName);
		if (!StringUtils.isNullOrEmpty(projLocation) && !projLocation.equals("全部") && !projLocation.equals("不限"))
			params.put("projLocation", projLocation);
		if(isRecomment != null) {
			params.put("isrecomment", isRecomment);
		}
		return projectDao.queryProjectListByCond(params, orderStr, page, pageSize);
	}

	public List<Map<String, String>> getProjectListMap(Integer uid, Integer projType, Integer squareNeeds,
			Integer peopleNeeds, Integer timesNumber, String orderFieldStr, Integer page, Integer pageSize,
			ArrayList<Integer> status) {
		Map<String, Object> params = new HashMap<>();
		if (projType != null)
			params.put("projType", projType);
		if (squareNeeds != null)
			params.put("squareNeeds", squareNeeds);
		if (peopleNeeds != null)
			params.put("peopleNeeds", peopleNeeds);
		if (timesNumber != null)
			params.put("timesNumber", timesNumber);
		if (orderFieldStr != null)
			params.put("orderFieldStr", orderFieldStr);
		if (status != null)
			params.put("status", status);
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
		return projectDao.queryProjectListMapByCond(params, page, pageSize);
	}

	public List<Map<String, Object>> getProjectListByFirstCate(Integer firstCateId, Integer projType,
			Integer isrecomment, String orderStr, Integer page, Integer pageSize) {
		Map<String, Object> params = new HashMap<>();
		if (firstCateId != null)
			params.put("firstCateId", firstCateId);
		if (projType != null)
			params.put("projType", projType);
		if (isrecomment != null)
			params.put("isrecomment", isrecomment);
		return projectDao.getProjectListByFirstCateAndCond(params, orderStr, page, pageSize);
	}

	public List<Map<String, Object>> getProjectListByType(Integer projType, Integer start, Integer limit) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("projType", projType);
		params.put("start", start);
		params.put("limit", limit);
		return projectDao.getProjectListByType(params);
	}

	/**
	 * 设置项目浏览量，自增一个
	 * 
	 * @param id
	 * @return
	 */
	public Integer addBrowsevolume(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		return projectDao.updateBrowsevolume(params);
	}

	/**
	 * 设置项目申请数，自增一个
	 * 
	 * @param id
	 * @return
	 */
	public Integer addApplyCount(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		return projectDao.updateApplyCount(params);
	}

	public Integer deleteById(Integer id) {
		Integer result = -1;
		result = projectDao.delete(id);
		return result;
	}

	/**
	 * 项目审核
	 * 
	 * @param id
	 * @param status
	 * @return
	 * @throws ParseException
	 */
	public Integer check(Integer id, Integer status) throws ParseException {
		Integer result = -1;
		JkProject jkProject = projectDao.selectByKey(id);
		jkProject.setStatus(status);
		result = projectDao.updateAll(jkProject);
		if (status == 1) {
			// 发布项目获得积分
			JkUser jkUser = userService.getUserById(jkProject.getUid());
			if (jkUser != null)
				scoreExchangeService.save(jkUser, null, null, 50, "发布项目", 0);
		}
		// 发送通知
		List<Map<String, Object>> list = projectService.getProjectList(null, null, jkProject.getCid(), null,
				jkProject.getProjType() == 0 ? 1 : 0, null, null, null, null, null, null, null,
				jkProject.getProjLocation(), null, null, null, null, 1);
		for (Map<String, Object> map : list) {
			if (map.get("uid") != jkProject.getUid()) {
				// if(true){
				String projecturl = "<a href=\"/login/toProjectDetailToMobileOrPc?id=" + id + "\">匹配到项目:"
						+ jkProject.getProjName() + "</a>";
				JkSysMesg jkSysMesgMatching = new JkSysMesg();
				jkSysMesgMatching.setContent(projecturl);
				jkSysMesgMatching.setFromId(1);
				jkSysMesgMatching.setToId((int) map.get("uid"));
				jkSysMesgMatching.setType("0");
				jkSysMesgMatching.setSendTime(new Date());
				// 发送匹配通知站内信
				mesgService.addmesg(jkSysMesgMatching);
				// 发送短信通知
				smsAlidayuService.sendYzcode(map.get("phone").toString(), 1);
			}
		}
		return result;
	}

	/**
	 * @throws ParseException
	 */
	public int saveProject(Integer id, Integer projType, String projNeeds, String projName, Integer cid,
			String cateName, String projLocation, Integer moneyNeeds, Integer timesNumber, String applyTime,
			String startTime, String endTime, String projDesc, String projPicPath, String filePath, String fileName,
			Integer squareNeeds, List<Integer> tags, Integer isDraft, JkUser jkUser) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		JkProject jkProject = new JkProject();
		// 基本信息
		jkProject.setProjType(projType);
		jkProject.setProjNeeds(projNeeds);
		jkProject.setProjName(projName);
		jkProject.setCid(cid);
		jkProject.setUid(jkUser.getId());
		jkProject.setCateName(cateName);
		jkProject.setProjLocation(projLocation);
		jkProject.setMoneyNeeds(moneyNeeds);
		jkProject.setTimesNumber(timesNumber);
		jkProject.setApplyTime(applyTime.equals("") ? null : sdf.parse(applyTime));
		jkProject.setStartTime(startTime.equals("") ? null : sdf.parse(startTime));
		jkProject.setEndTime(endTime.equals("") ? null : sdf.parse(endTime));
		jkProject.setCreateTime(new Date());
		jkProject.setProjDesc(projDesc);
		// jkProject.setHtmlCode(projDesc.getBytes());
		jkProject.setProjPicPath(projPicPath);
		// 创建者相关字段
		jkProject.setUsername(jkUser.getNickname());
		jkProject.setPhone(jkUser.getPhone());
		// 项目状态，判断是否是草稿
		if (isDraft == 1)
			jkProject.setStatus(-3);
		else
			jkProject.setStatus(0);
		// 浏览量和申请量，默认0
		jkProject.setBrowsevolume(0);
		jkProject.setApplycount(0);
		// 是否置顶和推荐，默认没有
		jkProject.setIsrecomment(0);
		jkProject.setIstop(0);
		int saveRes = -1;
		if (id == null) {
			saveRes = projectDao.save(jkProject);
		} else {
			jkProject.setId(id);
			saveRes = projectDao.updateNotNull(jkProject);

		}
		// 设置标签（type 1为项目）
		tagMatchDao.saveAll(tags, jkProject.getId(), 1);
		// 保存附件
		if (filePath != null) {
			JkFile file = new JkFile();
			file.setUid(jkUser.getId());
			file.setFid(jkProject.getId());
			file.setType(1);
			file.setFileName(fileName);
			file.setFilePath(filePath);
			file.setFileDesc("");
			fileDao.save(file);
		}

		return jkProject.getId();
	}
	
	/**
	 * @throws ParseException
	 */
	public int saveProject(Integer id, Integer projType, String projNeeds, String projName, Integer cid,
			String cateName, String projLocation, Integer moneyNeeds, Integer timesNumber, String applyTime,
			String startTime, String endTime, String projDesc, String projPicPath, List<String> filePath, List<String> fileName,
			Integer squareNeeds, List<Integer> tags, Integer isDraft, JkUser jkUser) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		JkProject jkProject = new JkProject();
		// 基本信息
		jkProject.setProjType(projType);
		jkProject.setProjNeeds(projNeeds);
		jkProject.setProjName(projName);
		jkProject.setCid(cid);
		jkProject.setUid(jkUser.getId());
		jkProject.setCateName(cateName);
		jkProject.setProjLocation(projLocation);
		jkProject.setMoneyNeeds(moneyNeeds);
		jkProject.setTimesNumber(timesNumber);
		jkProject.setApplyTime(applyTime.equals("") ? null : sdf.parse(applyTime));
		jkProject.setStartTime(startTime.equals("") ? null : sdf.parse(startTime));
		jkProject.setEndTime(endTime.equals("") ? null : sdf.parse(endTime));
		jkProject.setCreateTime(new Date());
		jkProject.setProjDesc(projDesc);
		// jkProject.setHtmlCode(projDesc.getBytes());
		jkProject.setProjPicPath(projPicPath);
		// 创建者相关字段
		jkProject.setUsername(jkUser.getNickname());
		jkProject.setPhone(jkUser.getPhone());
		// 项目状态，判断是否是草稿
		if (isDraft == 1)
			jkProject.setStatus(-3);
		else
			jkProject.setStatus(0);
		// 浏览量和申请量，默认0
		jkProject.setBrowsevolume(0);
		jkProject.setApplycount(0);
		// 是否置顶和推荐，默认没有
		jkProject.setIsrecomment(0);
		jkProject.setIstop(0);
		int saveRes = -1;
		if (id == null) {
			saveRes = projectDao.save(jkProject);
		} else {
			jkProject.setId(id);
			saveRes = projectDao.updateNotNull(jkProject);

		}
		// 设置标签（type 1为项目）
		tagMatchDao.saveAll(tags, jkProject.getId(), 1);
		// 保存附件
		if (filePath != null) {
			int length = filePath.size();
			for(int i=0; i<length; i++) {
				JkFile file = new JkFile();
				file.setUid(jkUser.getId());
				file.setFid(jkProject.getId());
				file.setType(1);
				file.setFileName(fileName.get(i));
				file.setFilePath(filePath.get(i));
				file.setFileDesc("");
				fileDao.save(file);
			}
		}

		return jkProject.getId();
	}

	public int topProject(Integer id, Integer uid) {
		JkProject jkProject = projectDao.selectByKey(id);
		if (jkProject == null) {
			return 0;
		}
		if (jkProject.getIstop() == 0) {
			jkProject.setScore(10000);
			jkProject.setIstop(1);
		} else if (jkProject.getIstop() != 0) {
			jkProject.setScore(0);
			jkProject.setIstop(0);
		}
		return projectDao.updateNotNull(jkProject);
	}

	public int commentProject(Integer id) {
		JkProject jkProject = projectDao.selectByKey(id);
		if (jkProject == null) {
			return 0;
		}
		if (jkProject.getIsrecomment() == 0) {
			jkProject.setIsrecomment(1);
		} else if (jkProject.getIsrecomment() == 1) {
			jkProject.setIsrecomment(0);
		}
		return projectDao.updateNotNull(jkProject);
	}
	
	public int commentProject(Integer id, Integer recomment) {
		JkProject jkProject = projectDao.selectByKey(id);
		if (jkProject == null) {
			return 0;
		}
		jkProject.setIsrecomment(recomment);
		return projectDao.updateNotNull(jkProject);
	}

	public int shutdown(Integer id, Integer stauts) {
		JkProject jkProject = projectDao.selectByKey(id);
		if (stauts != null) {
			jkProject.setStatus(stauts);
		}
		return projectDao.updateNotNull(jkProject);
	}

	public Integer modproject(JkProject jkProject) {
		if (jkProject == null) {
			return null;
		}

		return projectDao.updateNotNull(jkProject);
	}

}
