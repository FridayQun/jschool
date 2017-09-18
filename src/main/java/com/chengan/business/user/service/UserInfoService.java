package com.chengan.business.user.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.login.dao.UserDao;
import com.chengan.business.repo.model.JkTags;
import com.chengan.business.repo.model.JkTagsMatch;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.repo.model.JkUserInfo;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.tag.dao.TagDao;
import com.chengan.business.tag.dao.TagMatchDao;
import com.chengan.business.user.dao.UserInfoDao;
import com.mysql.jdbc.StringUtils;

@Service
public class UserInfoService extends BaseService {
	@Autowired
	UserInfoDao userInfoDao;

	@Autowired
	UserDao userDao;

	@Autowired
	TagMatchDao tagMatchDao;

	@Autowired
	TagDao tagdao;

	@Autowired
	ScoreExchangeService scoreExchangeService;

	public int updateUserTop(){
		return userInfoDao.updateUserTop();
	}
	public ServiceResult<JkUserInfo> getUserInfo(int uid) {
		return generateResult(userInfoDao.getUserInfoBYUid(uid));

	}

	public ServiceResult<String> updateuser(JkUserInfo jkUserInfo, JkUser jkUser, String tags) throws ParseException {

		if (jkUserInfo.getId() != null) {
			userInfoDao.updateNotNull(jkUserInfo);
		} else {

			userInfoDao.save(jkUserInfo);
		}
		// 如果资料完善且没有通过完善资料获取积分的 获取积分
		if (jkUser.getNickname() != null && jkUser.getNickname() != "" && jkUser.getPhone() != null
				&& jkUser.getPhone() != "" &&
				// jkUser.getHeadPicPath()!=null&&jkUser.getHeadPicPath()!=""&&
				jkUser.getSlogan() != null && jkUser.getSlogan() != "" && jkUserInfo.getRealname() != null
				&& jkUserInfo.getRealname() != "" && jkUserInfo.getLocation() != "" && jkUserInfo.getLocation() != ""
				&& scoreExchangeService.selectcountofanyway(jkUser.getId(), 0, "资料完善", null) == 0) {
			JkUser jkuser2 = userDao.selectByKey(jkUser.getId());
			scoreExchangeService.save(jkuser2, null, null, 80, "资料完善", 0);

		}

		if (tags == "" || tags == null) {
			jkUser.setTag("");
			userDao.updateNotNull(jkUser);
			tagMatchDao.deleteByFid(jkUser.getId(), 0);		// 0代表类型是用户
			return generateResult(null);
		}
		String[] taglist = tags.split(",");// 新标签列表
		List<Integer> firstlist = new ArrayList();
		firstlist.add(Integer.valueOf(taglist[0]));
		List<JkTags> jkTagList = tagdao.selectByInIds(firstlist);
		jkUser.setTag(jkTagList.get(0).getTagName());
		userDao.updateNotNull(jkUser);
		List<JkTagsMatch> tagsmatcs = tagMatchDao.geAllTagsByUid(jkUser.getId());// 历史标签列表
		for (JkTagsMatch item : tagsmatcs) {
			int dflag = 0;
			for (String tagid : taglist) {
				if (tagid == String.valueOf(item.getTid())) {
					dflag = 1;
					// 更新该标签
					break;
				}
			}
			if (dflag == 0) {
				// 删除该标签
				tagMatchDao.delTagMatchById(item);
			}
		}
		for (String tagid : taglist) {
			int addflag = 0;
			for (JkTagsMatch item : tagsmatcs) {
				if (tagid == String.valueOf(item.getTid())) {
					addflag = 1;
					break;
				}
			}
			if (addflag == 0) {
				// 给客户添加标签
				List<Integer> list = new ArrayList<>();
				if (tagid != null && tagid != "") {
					list.add(Integer.valueOf(tagid));
					tagMatchDao.saveAll(list, jkUser.getId(), 0);
				}

			}

		}

		return generateResult(null);

	}

	public List<Map<String, Object>> getUserList(List<Integer> userid, String username, String nicknmae,
			String location, Integer idType, Integer gender, Integer userlevel, String orderStr, Integer istop,
			Integer page, Integer pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (userid != null) {
			map.put("userid", userid);
		}
		if (!StringUtils.isNullOrEmpty(username)) {
			map.put("username", username);
		}
		if (!StringUtils.isNullOrEmpty(nicknmae)) {
			map.put("nicknmae", nicknmae);
		}
		if (!StringUtils.isNullOrEmpty(location)) {
			map.put("location", location);
		}
		if (gender != null) {
			map.put("gender", gender);
		}
		if (userlevel != null) {
			map.put("userlevel", userlevel);
		}
		if (idType != null) {
			map.put("idType", idType);
		}
		if (istop != null) {
			map.put("istop", istop);
		}
		if(orderStr == null) {
			orderStr = "istop desc,toptime desc";
		}
		return userInfoDao.getUserList(map, orderStr, page, pageSize);

	}

	public void saveuserinfo(JkUserInfo jkUserinfo) {
		if (jkUserinfo.getId() == null) {
			userInfoDao.save(jkUserinfo);
		} else {
			userInfoDao.updatenotnull(jkUserinfo);
		}

	}

	// 用户消息置为空
	public void updatenull(JkUserInfo userInfo) {
		userInfoDao.updateAll(userInfo);
	}

}
