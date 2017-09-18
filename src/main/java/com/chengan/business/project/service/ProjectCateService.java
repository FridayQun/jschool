package com.chengan.business.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.project.dao.ProjectCateDao;
import com.chengan.business.project.dao.ProjectDao;
import com.chengan.business.repo.model.JkProject;
import com.chengan.business.repo.model.JkProjectCate;

import net.sf.json.JSONArray;
import tk.mybatis.mapper.entity.Example;

@Service
public class ProjectCateService {

	@Autowired
	ProjectCateDao projectCateDao;
	
	@Autowired
	ProjectDao projectDao;

	public List<JkProjectCate> getFirstCateList() {
		Map<String, Object> params = new HashMap<String, Object>();
		return projectCateDao.queryFirstCateListByCond(params);
	}

	public List<JkProjectCate> getSecondCateList(Integer parentId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("parentId", parentId);
		return projectCateDao.querySecondCateListByCond(params);
	}

	public List<JkProjectCate> getAllCateList() {
		Example example = new Example(JkProjectCate.class);
		return projectCateDao.selectByExample(example);
	}

	public JkProjectCate getCateById(Integer id) {
		return projectCateDao.selectByKey(id);
	}

	// 保存或修改方法
	public int saveOrUpdate(JkProjectCate jkProjectCate) {
		int result = -1;
		if (jkProjectCate.getId() != null) {
			projectCateDao.updateAll(jkProjectCate);
		} else {
			projectCateDao.save(jkProjectCate);
		}
		return result;
	}

	// 删除
	public void delete(Integer id) {
		projectCateDao.delete(id);
	}

	// 根据名称获取类型，默认类型名称不重复个
	public JkProjectCate getCateByName(String Name) {
		List<JkProjectCate> list = projectCateDao.getCateByName(Name);
		if (list.size() == 0)
			return null;
		else
			return list.get(0);
	}

	// 获取所有一级分类列表和二级分类列表（供首页全部分类调用）
	public String getAllFirstAndSecondCateList() {
		// 所有一级目录
		List<JkProjectCate> firstCateList = getFirstCateList();
		// 所有二级目录
		List<JkProjectCate> secondCateList = getSecondCateList(null);
		Map<String, Object> params = new HashMap<>();
		params.put("isrecomment", 2);
		List<Map<String, Object>> recommendListAll = projectDao.getProjectListByFirstCateAndCond(params, null, null, null);
		// 按前端需求格式组成json数组
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (JkProjectCate jkProjectCate1 : firstCateList) {
			// 第一层
			Map<String, Object> map = new HashMap<String, Object>();
			// 存item
			List<Map<String, Object>> itemList = new ArrayList<Map<String, Object>>();
			// 存recommend
			List<Map<String, Object>> recommendList = new ArrayList<Map<String, Object>>();
			for (JkProjectCate JkProjectCate2 : secondCateList) {
				// 判断是不是子级
				if (JkProjectCate2.getParentId() == jkProjectCate1.getId()) {
					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.put("title", JkProjectCate2.getCateName());
					map2.put("id", JkProjectCate2.getId());
					map2.put("url", "");
					itemList.add(map2);

					for (Map<String, Object> jkProject : recommendListAll) {
						if(recommendList.size() >= 3) {
							break;
						}
						// 判断是不是子级
						if(((Integer)jkProject.get("cid")) == JkProjectCate2.getId()) {
							Map<String, Object> map3 = new HashMap<String, Object>();
							map3.put("title", jkProject.get("projName"));
							map3.put("id", jkProject.get("id"));
							map3.put("url", "");
							recommendList.add(map3);
						}
					}
				}
			}

			map.put("item", itemList);
			map.put("title", jkProjectCate1.getCateName());
			map.put("recommend", recommendList);

			list.add(map);
		}

		return JSONArray.fromObject(list).toString();
	}

}
