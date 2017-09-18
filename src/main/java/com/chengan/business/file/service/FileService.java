package com.chengan.business.file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.file.dao.FileDao;
import com.chengan.business.repo.model.JkFile;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class FileService extends BaseService {

	@Autowired
	FileDao fileDao;

	public int saveOrUpdate(JkFile jkFile) {
		int result = -1;
		if (jkFile.getId() != null) {
			fileDao.updateAll(jkFile);
		} else {
			fileDao.save(jkFile);
		}
		return result;
	}

	public int save(Integer uid, Integer fid, Integer type, String fileName, String filePath, String fileDesc) {
		int result = -1;
		JkFile file = new JkFile();
		file.setUid(uid);
		file.setFid(fid);
		file.setType(type);
		file.setFileName(fileName);
		file.setFilePath(filePath);
		file.setFileDesc(fileDesc);
		fileDao.save(file);
		return result;
	}

	public List<JkFile> getFileList(Integer fid, Integer type) {
		Example example = new Example(JkFile.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("fid", fid);
		criteria.andEqualTo("type", type);
		return fileDao.selectByExample(example);
	}

}
