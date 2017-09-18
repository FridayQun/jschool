package com.chengan.business.operate.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.chengan.business.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.login.service.UserService;
import com.chengan.business.operate.dao.CommentDao;
import com.chengan.business.repo.model.JkProjectComment;
import com.chengan.business.repo.model.JkUser;

@Service
public class CommentService {

	@Autowired
	CommentDao commentDao;
	@Autowired
	UserService userService;

	// 保存评论
	public int saveComment(Integer fid, Integer uid, String type, String comment, Integer scroe) {
		int result = 0;
		JkProjectComment jkProjectComment = new JkProjectComment();
		jkProjectComment.setFid(fid);
		jkProjectComment.setUid(uid);
		jkProjectComment.setType(type);
		jkProjectComment.setComment(comment);
		jkProjectComment.setScroe(scroe);
		jkProjectComment.setCreateTime(new Date());
		// 评论者
		JkUser user = userService.getUserById(uid);
		if (user != null) {
			//Constant.NORMAL_HEAD_ICON_URL
			// 以这个开头的应当被判断性别为什要判断性别啊，难道本来没有头像吗
			if(user.getHeadPicPath() == null  || user.getHeadPicPath().startsWith(Constant.NORMAL_HEAD_ICON_URL)){
				if(!(user.getGender()!=null && user.getGender() == 2))
					jkProjectComment.setHeadPicPath(Constant.GIRL_HEAD_ICON_URL);
				else
					jkProjectComment.setHeadPicPath(Constant.BOY_HEAD_ICON_URL);
			}else
				jkProjectComment.setHeadPicPath(user.getHeadPicPath());

			jkProjectComment.setUsername(user.getNickname());
		}

		result = commentDao.save(jkProjectComment);
		return result;
	}

	// 获取项目评论列表表
	public List<Map<Object, Object>> selectCimmentList(Integer uid, Integer fid, Integer type) {
		return selectCimmentList(uid, fid, type, null, null);
	}
	public List<Map<Object, Object>> selectCimmentList(Integer uid, Integer fid, Integer type, Integer page, Integer pageSize) {
		return commentDao.selectCommentList(uid, fid, type, page, pageSize);
	}
	
	public void delete(Integer id) {
		commentDao.delete(id);
	}

	public int count(Integer uid, Integer fid, Integer type) {
		return commentDao.count(uid, fid, type);
	}
	
	public int countToday(Integer uid, Integer fid, Integer type) {
		return commentDao.countToday(uid, fid, type);
	}
}
