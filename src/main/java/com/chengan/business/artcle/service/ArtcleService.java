package com.chengan.business.artcle.service;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.artcle.dao.ArtcleDao;
import com.chengan.business.base.BaseService;
import com.chengan.business.file.dao.FileDao;
import com.chengan.business.login.service.UserService;
import com.chengan.business.repo.model.JkFile;
import com.chengan.business.repo.model.JkNews;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.tag.dao.TagDao;
import com.chengan.business.tag.dao.TagMatchDao;
import com.chengan.business.user.dao.UserInfoDao;
import com.chengan.business.util.TipUtil;

@Service
public class ArtcleService extends BaseService {

	@Autowired
	ArtcleDao artcleDao;
	@Autowired
	TagDao tagDao;
	@Autowired
	TagMatchDao tagMatchDao;
	@Autowired
	FileDao fileDao;
	@Autowired
	UserInfoDao userInfoDao;
	@Autowired
	ScoreExchangeService scoreExchangeService;
	@Autowired
	UserService userService;

	/**
	 * 根据类型/标题获取文章列表
	 * 
	 * @param type
	 * @param cartId
	 * @param date
	 * @return
	 */
	public List<JkNews> getArtcleList(String title, String phone, Integer type, Integer uid, Integer status,
			String orderStr, Integer page, Integer pageSize) {
		return getArtcleList(title, phone, type, uid, status, null, orderStr, page, pageSize);
	}
	public List<JkNews> getArtcleList(String title, String phone, Integer type, Integer uid, Integer status, Long dateFrom,
			String orderStr, Integer page, Integer pageSize) {
		Map<String, Object> params = new HashMap<>();
		if (type != null)
			params.put("type", type);
		if (title != null)
			params.put("cartId", title);
		if (phone != null)
			params.put("phone", phone);
		if (uid != null)
			params.put("uid", uid);
		if (status != null)
			params.put("status", status);
		if (dateFrom != null) {
			params.put("createTime", dateFrom*1.0/1000);
		}
		if (title != null && title != "")
			params.put("title", title);
		if (StringUtils.isEmpty(orderStr))
			orderStr = "n.istop desc,n.create_time desc";
		return artcleDao.queryArtcleListByCond(params, orderStr, page, pageSize);
	}
	
	public int getCountToday(Integer uid) {
		return artcleDao.getCountToday(uid);
	}
	
	public List<Map<String, Object>> getArtcleListWithCate(String title, String phone, Integer type, Integer uid, Integer status,
			String orderStr, Integer page, Integer pageSize) {
		Map<String, Object> params = new HashMap<>();
		if (type != null)
			params.put("type", type);
		if (title != null)
			params.put("cartId", title);
		if (phone != null)
			params.put("phone", phone);
		if (uid != null)
			params.put("uid", uid);
		if (status != null)
			params.put("status", status);
		if (title != null && title != "")
			params.put("title", title);
		if (StringUtils.isEmpty(orderStr))
			orderStr = "n.istop desc,n.create_time desc";
		return artcleDao.queryArtcleListByCondWithCate(params, orderStr, page, pageSize);
	}

	/**
	 * 删除
	 * 
	 * @param id
	 */
	public void delete(Integer id) {
		artcleDao.delete(id);
	}

	/**
	 * 验证提交文章表单参数
	 * 
	 * @param title
	 *            标题
	 * @param description
	 *            描述
	 * @param username
	 *            用户名
	 * @param uid
	 *            用户ID
	 * @param cartId
	 *            类目ID
	 * @param htmlCode
	 *            HTML文本
	 * @return
	 */
	public String validateParams(String title, String description, String username, Integer uid, Integer cartId,
			String htmlCode) {
		if (StringUtils.isEmpty(title))
			return TipUtil.artTitleIsNull;
		else if (StringUtils.isEmpty(username) || uid == null)
			return TipUtil.artUserIsNull;
		else if (cartId == null)
			return TipUtil.artCartIsNull;
		else if (StringUtils.isEmpty(htmlCode))
			return TipUtil.artHtmlIsNull;
		return null;
	}

	/**
	 * 头条审核
	 * 
	 * @param id
	 * @param status
	 * @return
	 * @throws ParseException
	 */
	public Integer check(Integer id, Integer status) throws ParseException {
		Integer result = -1;
		JkNews jkNews = artcleDao.selectByKey(id);
		jkNews.setStatus(status);
		result = artcleDao.updateAll(jkNews);
		// 发布头条获得积分
		if (status == 1) {
			JkUser user = userService.getUserById(jkNews.getUid());
			if (user != null)
				scoreExchangeService.save(user, null, null, 50, "发布头条", 0);
		}
		return result;
	}

	/**
	 * 置顶头条
	 * 
	 * @param id
	 * @return
	 */
	public int topProject(Integer id) {
		Integer result = -1;
		JkNews jkNews = artcleDao.selectByKey(id);
		if (jkNews.getIstop() == 0) {
			jkNews.setIstop(1);
		} else if (jkNews.getIstop() == 1) {
			jkNews.setIstop(0);
		}
		result = artcleDao.updateAll(jkNews);
		return result;
	}

	/**
	 * 推荐头条
	 * 
	 * @param id
	 * @return
	 */
	public int commentProject(Integer id) {
		Integer result = -1;
		JkNews jkNews = artcleDao.selectByKey(id);
		if (jkNews.getIsrecomment() == 0) {
			jkNews.setIsrecomment(1);
		} else if (jkNews.getIsrecomment() == 1) {
			jkNews.setIsrecomment(0);
		}
		result = artcleDao.updateAll(jkNews);
		return result;
	}

	/**
	 * 保存文章
	 * 
	 * @param tilte
	 * @param pic
	 * @param type
	 * @param username
	 * @param userHeadPic
	 * @param description
	 * @param uid
	 * @param userNickname
	 * @param htmlCode
	 * @param userLocation
	 * @param cartId
	 * @return
	 */
	public int saveArtcle(String title, String source, Integer sourceType, String type, String content, String picPath,
			List<Integer> tagIds, JkUser jkUser) {
		JkNews jkNews = new JkNews();
		// 基本信息
		jkNews.setTitle(title);
		jkNews.setType(type);
		jkNews.setContent(content);
		jkNews.setHtmlcode(content.getBytes());
		jkNews.setPicPath(picPath);
		jkNews.setSource(source);
		jkNews.setSourceType(sourceType);
		// 创建者基本信息相关字段
		jkNews.setUid(jkUser.getId());
		jkNews.setUsername(jkUser.getNickname());
		jkNews.setPhone(jkUser.getPhone());
		jkNews.setHeadPicPath(jkUser.getHeadPicPath());
		// 用户认证信息相关字段
		JkUserInfo userInfo = userInfoDao.getUserInfoBYUid(jkUser.getId());
		if (userInfo != null) {
			// 用户是学生
			if (jkUser.getIdType() == 0)
				jkNews.setEduName(userInfo.getEduName());
			// 用户不是学生
			else if (jkUser.getIdType() == 1)
				jkNews.setCompanyName(userInfo.getCompanyName());
		}
		// 头条状态，创建时默认未审核
		jkNews.setStatus(0);
		// 头条置顶状态，创建时默认未置顶
		jkNews.setIstop(0);
		// 头条推荐状态，创建时默认未置顶
		jkNews.setIsrecomment(0);
		;
		// 创建时间
		jkNews.setCreateTime(new Date());
		// 浏览量，默认0
		jkNews.setBrowsevolume(0);

		int saveRes = artcleDao.save(jkNews);
		// 设置标签（type 0为头条）
		tagMatchDao.saveAll(tagIds, jkNews.getId(), 2);

		return saveRes;
	}

	/**
	 * 保存图片等文件
	 * 
	 * @param fid
	 * @param name
	 * @param url
	 * @param type
	 * @param description
	 */
	public void saveFile(Integer fid, Integer uid, String name, String url, int type, String description) {
		JkFile file = new JkFile();
		file.setFid(fid);
		file.setFileDesc(description);
		file.setFilePath(url);
		file.setType(type);
		file.setFileName(name);
		file.setUid(uid);

		fileDao.save(file);
	}

	/**
	 * 获取单条资讯详情
	 * 
	 * @param aid
	 * @return
	 */
	public JkNews getNewsById(Integer id) {
		if (id == null)
			return null;
		JkNews jkNews = artcleDao.selectByKey(id);

		// // 阅读数加1
		// artcle.setArtReads(artcle.getArtReads() + 1);
		// // 保存阅读数
		// artcleDao.updateArtcleReads(artcle.getId());

		return jkNews;
	}

	/**
	 * 设置头条浏览量，自增一个
	 * 
	 * @param id
	 * @return
	 */
	public Integer addBrowsevolume(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		return artcleDao.updateBrowsevolume(params);
	}

	public ServiceResult<Integer> getTotalOfNews(int id, List<Integer> status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("status", status);
		return generateResult(artcleDao.getTotalOfNewsByUid(map));
	}

}
