package com.chengan.business.project.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.base.BaseController;
import com.chengan.business.login.service.SmsAlidayuService;
import com.chengan.business.login.service.UserService;
import com.chengan.business.mesg.service.mesgService;
import com.chengan.business.project.service.ProjectCateService;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.JkProject;
import com.chengan.business.repo.model.JkProjectCate;
import com.chengan.business.repo.model.JkSysMesg;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.tag.service.TagMatchService;
import com.chengan.business.util.URLUtil;
import com.github.pagehelper.Page;
import com.mysql.jdbc.StringUtils;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

	@Autowired
	ProjectService projectService;
	@Autowired
	ProjectCateService projectCateService;
	@Autowired
	UserService userService;
	@Autowired
	TagMatchService tagMatchService;
	@Autowired
	ScoreExchangeService scoreExchangeService;
	@Autowired
	mesgService mesgService;
	@Autowired
	SmsAlidayuService smsAlidayuService;

	/**
	 * 获取头条详情
	 * 
	 * @param id
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "getProjectById", method = RequestMethod.GET)
	public ModelAndView getNewsById(Integer id) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		JkProject jkProject = projectService.getProjectById(id);
		mv.addObject("jkProject", jkProject);
		mv.setViewName("project");
		return mv;
	}

	/**
	 * 获取项目列表表
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @param pageSize
	 * @param projType
	 *            项目类型
	 * @param squareNeeds
	 *            面积
	 * @param peopleNeeds
	 *            人数
	 * @param timesNumber
	 *            场次
	 * @param uid
	 *            uid
	 * @param orderStr
	 *            排序字段，同一个查询只会按一个字段排序
	 * @return
	 */
	@RequestMapping(value = "getProjectList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getNewsList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer pageSize,
			@RequestParam(required = false) Integer projType, @RequestParam(required = false) String projName,
			@RequestParam(required = false) String projLocation, @RequestParam(required = false) Integer squareNeeds,
			@RequestParam(required = false) Integer peopleNeeds, @RequestParam(required = false) Integer timesNumber,
			@RequestParam(required = false) Integer uid, @RequestParam(required = false) Integer cid,
			@RequestParam(required = false) String cateName, @RequestParam(required = false) Integer parentCid,
			@RequestParam(required = false) Integer status, @RequestParam(required = false) List<Integer> tags,
			@RequestParam(required = false, defaultValue = "istop desc,createTime desc") String orderStr, @RequestParam(required = false) Integer isrecomment,
			@RequestParam(required = false) Boolean projNameToUserName) {
		// 判断是否有标签集合参数，若有，则获取拥有该标签的项目id集合，已以作为筛选条件
		List<Integer> projectIds = null;
		if (tags != null && tags.size() > 0)
			projectIds = tagMatchService.getProjectListByTagids(tags, 1);

		// parentCid为筛选条件：类型的id，可能为一级目录，也可能为二级目录，这里要判断
		JkProjectCate projCate = projectCateService.getCateById(parentCid);
		if (projCate != null && projCate.getCateLevel() == 1) {
			cid = parentCid;
			parentCid = null;
		}
		// 根据参数获取项目列表(暂时默认按积分排序)
		// 1.获取登录用户id作为查询条件，未登录传null
		Integer loginUid = null;
		JkUser user = userService.getUserBySession(request);
		if (user != null)
			loginUid = user.getId();
		List<Map<String, Object>> list = projectService.getProjectList(uid, loginUid, cid, parentCid, projType,
				projName, cateName, squareNeeds, peopleNeeds, timesNumber, null, status, projLocation, projectIds,
				orderStr, page, pageSize, null, isrecomment);
		System.out.println(String.format("%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s (%s)", uid, loginUid, cid, parentCid, projType,
				projName, cateName, squareNeeds, peopleNeeds, timesNumber, null, status, projLocation, projectIds,
				orderStr, page, pageSize, null, isrecomment, list!=null?list.size():null, projNameToUserName));
		// 综合查询用户和项目
		if(projNameToUserName != null && projNameToUserName == true && StringUtils.isNullOrEmpty(projName)==false) {
			List<JkUser> users = userService.findUserByName(projName);
			if(users != null) {
				for(JkUser u : users) {
					List<Map<String, Object>> list2 = projectService.getProjectList(u.getId(), loginUid, cid, parentCid, projType, null, cateName, squareNeeds
							, peopleNeeds, timesNumber, null, status, projLocation, projectIds, orderStr, page, pageSize, null, isrecomment);
					if(list2 != null) {
						if(list == null) {
							list = list2;
						} else {
							list.addAll(list2);
						}
					}
				}
	
				Set<Integer> idSet = new HashSet<>();
				if(list != null)
				for(Integer i=list.size()-1; i>=0; i--) {
					Map<String, Object> o = list.get(i);
					Integer id = (Integer) o.get("id");
					if(id == null) {
						continue;
					}
					if(idSet.contains(id)) {
						list.remove(o);
						continue;
					}
					idSet.add(id);
				}
			}
		}
		// 设置返回map
		Map<Object, Object> map = getResult("newsList", list);
		// 分页数据树
		map.put("pages", ((list==null||list.size()==0)?0:(((Page<Map<String, Object>>) list).getTotal()-1))/((Page<Map<String, Object>>) list).getPageSize()+1);
		map.put("total", ((Page<Map<String, Object>>) list).getTotal());
		return map;
	}

	/**
	 * 根据一级类目获取项目
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @param pageSize
	 * @param cid
	 * @return
	 */
	@RequestMapping(value = "getProjectListByFirstCate", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getProjectListByFirstCate(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(required = false, defaultValue = "") String orderStr,
			@RequestParam(required = false) Integer isrecomment, Integer cid, Integer projType) {
		// 1.根据参数获取项目列表
		List<Map<String, Object>> list = projectService.getProjectListByFirstCate(cid, projType, isrecomment, orderStr,
				page, pageSize);
		return getResult("newsList", list);
	}

	/**
	 * 获取项目列表表
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @param pageSize
	 * @param projType
	 *            项目类型
	 * @param squareNeeds
	 *            面积
	 * @param peopleNeeds
	 *            人数
	 * @param timesNumber
	 *            场次
	 * @param orderFieldStr
	 *            排序字段，同一个查询只会按一个字段排序
	 * @return map
	 */
	@RequestMapping(value = "getProjectListMap", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getProjectListMap(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(required = false) Integer projType, @RequestParam(required = false) Integer squareNeeds,
			@RequestParam(required = false) Integer peopleNeeds, @RequestParam(required = false) Integer timesNumber,
			@RequestParam(required = false) Integer uid, @RequestParam(required = false) String status,
			@RequestParam(required = false) String orderFieldStr) {
		// 1.根据参数获取项目列表
		String[] statuslist = status.split(",");
		ArrayList<Integer> statuslistarr = new ArrayList<Integer>();
		for (String s : statuslist) {
			statuslistarr.add(Integer.parseInt(s));
		}
		List<Map<String, String>> list = projectService.getProjectListMap(uid, projType, squareNeeds, peopleNeeds,
				timesNumber, orderFieldStr, page, pageSize, statuslistarr);
		return getResult("newsList", list);
	}

	/**
	 * 发布项目
	 * 
	 * @param request
	 * @param uid
	 * @param projType
	 * @param projNeeds
	 * @param
	 * @param cid
	 * @param
	 * @param projLocation
	 * @param moneyNeeds
	 * @param timesNumber
	 * @param applyTime
	 * @param startTime
	 * @param endTime
	 * @param projDesc
	 * @param projPicPath
	 * @param squareNeeds
	 * @param tags
	 * @param response
	 * @return
	 * @throws ParseException
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "publishProject", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView publishNews(HttpServletRequest request, @RequestParam(required = false) Integer draftId,
			@RequestParam(required = false) Integer uid, @RequestParam(required = false) Integer projType,
			@RequestParam(required = false) String projNeeds, @RequestParam(required = false) String projName,
			@RequestParam(required = false) Integer cid, @RequestParam(required = false) String projLocation,
			@RequestParam(required = false) String province, @RequestParam(required = false) Integer moneyNeeds,
			@RequestParam(required = false) Integer timesNumber, @RequestParam(required = false) String applyTime,
			@RequestParam(required = false) String startTime, @RequestParam(required = false) String endTime,
			@RequestParam(required = false) String projDesc, @RequestParam(required = false) String projPicPath,
			@RequestParam(required = false) List<String> filePath, @RequestParam(required = false) List<String> fileName,
			@RequestParam(required = false) Integer squareNeeds, @RequestParam(required = false) List<Integer> tags,
			@RequestParam(required = false) Integer isDraft, @RequestParam(required = false) String from, HttpServletResponse response) throws ParseException, UnsupportedEncodingException {
		URLUtil urlUtil = null;
		if(!StringUtils.isNullOrEmpty(from)) {
			urlUtil = new URLUtil(URLDecoder.decode(from, "utf-8"));
		} else {
			urlUtil = new URLUtil("/");
		}

		// 0.验证数据是否符合要求
		if (isDraft == 0) {
			if (projType == null || cid == null || applyTime == null || startTime == null || endTime == null
					|| moneyNeeds == null || timesNumber == null || projPicPath == null) {
				return new ModelAndView("redirect:"+urlUtil.addParam("msgTip", "不符合要求").encodeParams());
			}
		}

		// 1.获取发布者
		JkUser jkUser = userService.getUserById(uid);
		if (jkUser == null)
			return new ModelAndView("redirect:"+urlUtil.addParam("msgTip", "用户为空").encodeParams());
		// 2.获取项目类型
		JkProjectCate JkProjectCate = projectCateService.getCateById(cid);
		if (JkProjectCate == null)
			new ModelAndView("redirect:"+urlUtil.encodeParams());
		// 设置归属地
		if (!StringUtils.isNullOrEmpty(projLocation))
			projLocation = province + ":" + projLocation;
		// 2.保存
		int id = projectService.saveProject(draftId, projType, projNeeds, projName, cid, JkProjectCate.getCateName(),
				projLocation, moneyNeeds, timesNumber, applyTime, startTime, endTime, projDesc, projPicPath, filePath,
				fileName, squareNeeds, tags, isDraft, jkUser);

		// 如果是草稿箱，则保存完直接返回
		if (isDraft == 1) {
			return new ModelAndView("redirect:"+urlUtil.addParam("msgTip", "草稿保存成").addParam("isPublish", "2").encodeParams());
		}

		// 查询匹配结果
		List<Map<String, Object>> list = projectService.getProjectList(null, null, cid, null, projType == 1 ? 0 : 1,
				null, null, null, null, null, null, null, projLocation, null, null, null, null, 1);

		// 项目推荐链接设置
		if (list.size() > 0) {
			StringBuffer url = new StringBuffer("<a href=\"/login/torecomlist?");
			url.append("cid=" + cid);
			url.append("&projLocation=" + projLocation);
			if (projType == 0) {
				url.append("&projType=" + 1 + "\"");
			} else {
				url.append("&projType=" + 0 + "\"");
			}
			url.append(">项目推荐:"+projName);
			url.append("</a>");
			JkSysMesg jkSysMesg = new JkSysMesg();
			jkSysMesg.setContent(url.toString());
			jkSysMesg.setFromId(1);
			jkSysMesg.setToId(uid);
			jkSysMesg.setType("0");
			jkSysMesg.setSendTime(new Date());
			mesgService.addmesg(jkSysMesg);
		}

		return new ModelAndView("redirect:"+urlUtil.addParam("msgTip", "您发布的项目已提交审核，请您耐心等待。").addParam("isPublish", "1").encodeParams());
	}

	@RequestMapping(value = "topProject", method = RequestMethod.GET)
	@ResponseBody
	public int topProject(HttpServletRequest req, Integer id) throws ParseException {
		Object loginid = req.getSession().getAttribute("login_userId");
		if (loginid == null) {
			return 0;
		}
		JkUser user = userService.getUserById((int) loginid);
		if (user.getPoint() < 500) {
			return 3;
		}
		scoreExchangeService.save(user, null, null, -500, "置顶项目", 0);
		return projectService.topProject(id, (int) loginid);
	}

	@RequestMapping(value = "commentProject", method = RequestMethod.GET)
	@ResponseBody
	public int commentProject(@RequestParam(required=true, name="id") Integer id, @RequestParam(required=false, name="recomment") Integer recomment) {
		if(recomment == null)
			return projectService.commentProject(id);
		return projectService.commentProject(id, recomment);
	}

	@RequestMapping(value = "check", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> check(HttpServletRequest request, Integer id, Integer status) {
		projectService.shutdown(id, status);
		return getResult(true, "");
	}

	@RequestMapping(value = "RefreshCreatTime", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> RefreshCreatTime(HttpServletRequest request, Integer id) {
		JkProject jkProject = projectService.getProjectById(id);
		jkProject.setCreateTime(new Date());
		projectService.modproject(jkProject);
		return getResult(true, "");
	}

}
