package com.chengan.business.operate.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.operate.dao.CollectDao;
import com.chengan.business.project.dao.ProjectDao;
import com.chengan.business.repo.model.JkUserCollection;

@Service
public class CollectService {

	@Autowired
	CollectDao collectDao;
	@Autowired
	ProjectDao projectDao;

	public int saveCollect(Integer fid, Integer uid, Integer type, String collectionDesc) {
		int result = 0;
		// 1.先对象id、用户id、对象类型查询一次数据库看有没有记录 ,插入数据//selectByKey(id)根据主键查询
		JkUserCollection userCollect = collectDao.selectCollect(fid, uid, type);
		// 没有记录，则添加记录
		if (userCollect == null) {
			JkUserCollection JkUserCollection = new JkUserCollection();
			JkUserCollection.setFid(fid);
			JkUserCollection.setUid(uid);
			JkUserCollection.setType(type);
			JkUserCollection.setCollectionDesc(collectionDesc);
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			JkUserCollection.setExtraStr(df.format(new Date()));
			// JkUserCollection.setCollectionPicPath(collectionPicPath);
			// //收藏对象的头像图片
			result = collectDao.save(JkUserCollection);
		}
		// 有记录，则删除记录
		else {
			result = collectDao.delete(userCollect.getId());
		}
		return result;
	}

	public JkUserCollection selectCollect(Integer fid, Integer uid, Integer type) {
		JkUserCollection jkUserCollection = collectDao.selectCollect(fid, uid, type);
		return jkUserCollection;
	}
}
