package com.chengan.business.login.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chengan.business.base.BaseDao;
import com.chengan.business.repo.entity.JkUserMapper;
import com.chengan.business.repo.model.JkUser;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.StringUtil;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Repository
public class UserDao extends BaseDao<JkUser> {
	@Autowired
	JkUserMapper jkUserMapper;

	public int updateUserExtra(){
		return jkUserMapper.updateUserExtra();
	}
	/**
	 * 根据手机号码查询用户是否存在
	 * 
	 * @param phone
	 * @return
	 */
	public JkUser findUserByPhone(String phone) {
		Example example = new Example(JkUser.class);
		Criteria criteria = example.createCriteria();
		if (!StringUtil.isEmpty(phone)) {
			criteria.andEqualTo("phone", phone);
		}
		List<JkUser> list = selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

	public List<JkUser> findUserByName(String nickname) {
		Example example = new Example(JkUser.class);
		Criteria criteria = example.createCriteria();
		if (!StringUtil.isEmpty(nickname)) {
			criteria.andLike("nickname", "%"+nickname+"%");
		}
		List<JkUser> list = selectByExample(example);
		return list.size() > 0 ? list : null;
	}

	/**
	 * 根据手机号码和密码查询用户是否存在
	 * 
	 * @param phone
	 * @return
	 */
	public JkUser loginUserByPhone(String phone, String password) {
		Example example = new Example(JkUser.class);
		Criteria criteria = example.createCriteria();
		if (!StringUtil.isEmpty(phone)) {
			criteria.andEqualTo("phone", phone);
		}
		if (StringUtil.isEmpty(password)) {
			return null;
		}
		criteria.andEqualTo("password", password);
		List<JkUser> list = selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

	/**
	 * 管理查询所有用户
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<JkUser> findAllUser(int idType, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize, true, false);
		PageHelper.orderBy("influence");
		Example example = new Example(JkUser.class);
		example.createCriteria().andEqualTo("idType", idType);
		List<JkUser> list = selectByExample(example);
		return list;
	}

	public void updatenotnull(JkUser jkUser) {
		updateNotNull(jkUser);
	}

	public int updatefans(Integer id) {
		Map map = new HashMap<String, Integer>();
		map.put("id", id);
		return jkUserMapper.updatefans(map);
	}

	public int updatefollows(Integer id) {
		Map map = new HashMap<String, Integer>();
		map.put("id", id);
		return jkUserMapper.updatefollows(map);
	}

	public int updatefollowscancle(Integer id) {
		Map map = new HashMap<String, Integer>();
		map.put("id", id);
		return jkUserMapper.updatefollowscancle(map);
	}

	public int updatefanscancle(Integer id) {
		Map map = new HashMap<String, Integer>();
		map.put("id", id);
		return jkUserMapper.updatefanscancle(map);
	}

	public int updateExtraInt() {
		return jkUserMapper.updateExtraInt(new HashMap<>());
	}

	/**
	 * 根据openid查询查询user表
	 * 
	 * @param wxopenid
	 * @return
	 */
	public JkUser queryUserByOpenid(String wxopenid) {
		Example example = new Example(JkUser.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("wxopenid", wxopenid);
		List<JkUser> list = selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

	public List<JkUser> getuserlisttop(Integer type) {
		Example ex = new Example(JkUser.class);
		Criteria criteria = ex.createCriteria();
		if (type != null) {
			criteria.andEqualTo("id_type", type);
		}
		return this.selectByExample(ex);
	}

	public List<Map<String, Object>> getUserByCommand(Integer istop, Integer page, Integer pageSize) {
		if(pageSize == null) {
			page = null;
		}
		Map<String, Object> map = new HashMap<>();
		if(istop != null) {
			map.put("istop", istop);
		}
		if(page != null) {
			page--;
			pageSize--;
			map.put("page", page);
			map.put("page_size", pageSize);
		}
		if(istop != null) {
			map.put("order", "order by influence desc, hot desc, id asc");
		}
		return jkUserMapper.getUserByCommand(map);
	}
}
