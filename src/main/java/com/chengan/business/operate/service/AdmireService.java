package com.chengan.business.operate.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.operate.dao.AdmireDao;
import com.chengan.business.repo.model.JkAdmire;

@Service
public class AdmireService {

	@Autowired
	AdmireDao admireDao;

	public int saveAdmire(Integer fid, Integer uid, Integer type, String description) {
		int result = 0;
		// 1.先对象id、用户id、对象类型查询一次数据库看有没有记录 ,插入数据//selectByKey(id)根据主键查询
		JkAdmire admire = admireDao.selectAdmire(fid, uid, type, null);
		// 没有记录则创建记录
		if (admire == null) {
			admire = new JkAdmire();
			admire.setUid(uid);
			admire.setFid(fid);
			admire.setType(type);
			admire.setIsCancel(0);
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			admire.setDescription(df.format(new Date()));
			// 将JkAdmire保存 赋值给result
			result = admireDao.save(admire);
		}
		// 有记录,且为点赞状态，取消赞
		else if (admire != null && admire.getIsCancel() == 0) {
			admire.setIsCancel(1);// 为取消赞
			result = admireDao.updateNotNull(admire);
		}
		// 有记录，且为取消赞状态，点赞
		else if (admire != null && admire.getIsCancel() == 1) {
			admire.setIsCancel(0);// 点赞
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			admire.setDescription(df.format(new Date()));
			result = admireDao.updateNotNull(admire);
		}
		return result;
	}

	public int selectCountToday(Integer uid) {
		return admireDao.selectCountToday(uid);
	}
	
	/**
	 * 获取点赞
	 * 
	 * @param fid
	 * @param uid
	 * @param type
	 * @return
	 */
	public JkAdmire selectAdmire(Integer fid, Integer uid, Integer type, Integer isCancel) {
		return admireDao.selectAdmire(fid, uid, type, isCancel);
	}

	/**
	 * 获取点赞列表
	 * 
	 * @param fid
	 * @param uid
	 * @param type
	 * @return
	 */
	// 获取点赞列表
	public List<JkAdmire> selectByFidAndType(Integer fid, Integer type) {
		return admireDao.selectByFidAndType(fid, type);
	}

}
