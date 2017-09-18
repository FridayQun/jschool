package com.chengan.business.score.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengan.business.base.BaseService;
import com.chengan.business.login.dao.UserDao;
import com.chengan.business.repo.model.JkScoreExchange;
import com.chengan.business.repo.model.JkScoreOperate;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.dao.ScoreExchangeDao;
import com.chengan.business.score.dao.ScoreOperateDao;

@Service
public class ScoreExchangeService extends BaseService {

	@Autowired
	ScoreExchangeDao scoreExchangeDao;
	@Autowired
	UserDao userDao;
	@Autowired
	ScoreOperateDao scoreOperateDao;

	// 获取兑换记录总数量
	public Integer selectcountofexshop(Integer uid, Integer type) {
		Map<String, Object> map = new HashMap<>();
		if (uid != null) {
			map.put("uid", uid);
		}
		if (type != null) {
			map.put("type", type);
		}
		return scoreExchangeDao.selectcountofexshop(map);
	}

	// 获取从各种方式获取的积分总数量
	public Integer selectcountofanyway(Integer uid, Integer type, String operatename, String createtime) {
		Map<String, Object> map = new HashMap<>();
		if (uid != null) {
			map.put("uid", uid);
		}
		if (type != null) {
			map.put("type", type);
		}
		if (operatename != null) {
			map.put("operatename", operatename);
		}
		if (createtime != null) {
			map.put("createtime", createtime);
		}
		return scoreExchangeDao.selectcountofanyway(map);
	}

	public List<Map<String, Object>> selectexchangmalllist(Integer uid, Integer type, Integer creattime,
			String keywords, Integer page, Integer pageSize) {

		return scoreExchangeDao.selectexchangmalllist(uid, type, creattime, keywords, page, pageSize);
	}

	public List<JkScoreExchange> getListOfExchange(Integer uid, Integer type, Integer Page, Integer pageSize,
			Boolean ispid) {

		return scoreExchangeDao.geListOfExchange(uid, type, Page, pageSize, ispid);

	}
	
	public int save(JkUser user, Integer pid, Integer projId, Integer score, String operateName, Integer type)
			throws ParseException {
		return save(user, pid, projId, score, operateName, type, null);
	}

	/**
	 * 保存操作记录
	 * 
	 * @param user
	 *            （操作用户）
	 * @param pid
	 *            （商品id，如果是基础操作，则此值为null）
	 * @param score
	 *            （操作所需积分，负数为扣除）
	 * @param operateName
	 *            （操作名：注册/登陆/分享/评论/发布项目/发布头条/申请项目/达成合作/合作评价/资料完善/实名认证通过/绑定其他登陆方式/）
	 * @param type
	 *            （0基础操作1兑换商品）
	 * @return
	 * @throws ParseException
	 */
	public int save(JkUser user, Integer pid, Integer projId, Integer score, String operateName, Integer type, String addOn)
			throws ParseException {

		int result = -1;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		JkScoreOperate scoreOperate = null;

		// 创建兑换记录
		JkScoreExchange exchange = new JkScoreExchange();
		// 设置创建时间
		exchange.setCreateTime(new Date());
		// 设置所需积分（负数为减积分）
		exchange.setNeedScore(score);
		// 设置操作者
		exchange.setUid(user.getId());
		// 设置操作名称
		exchange.setOperateName(operateName);
		// 设置操作类型（0表示基础操作，1表示兑换)
		exchange.setType(type);
		// 兑换商品,设置商品id;操作项目，设置项目id（type为0，表示项目，否则为商品）
		if (pid != null) {
			exchange.setPid(pid);
		}
		if (projId != null) {
			exchange.setProjId(projId);
		}
		if(addOn != null) {
			exchange.setAddOn(addOn);
		}

		// 查处该用户当天该操作的次数
		Integer num = countByUidAndTimeAndName(user.getId(), null, sdf.format(new Date()), operateName);
		// 基础操作积分特殊处理并且限制次数
		scoreOperate = scoreOperateDao.getEntityByName(operateName);
		if (scoreOperate != null && type == 0) {
			exchange.setNeedScore(scoreOperate.getOperateScroe());
			score = scoreOperate.getOperateScroe();
			// 判断某一个操作的每天当天操作的次数，决定是否还能修改用户积分，
			if (scoreOperate.getNum() != null && num >= scoreOperate.getNum()) {
				return result;
			}
		} else if (type != 1) {
			return result;
		}
		// 1.保存操作记录
		result = scoreExchangeDao.save(exchange);
		if (score > 0) {
			user.setInfluence(user.getInfluence() + score / 8);
		}
		user.setPoint(user.getPoint() + score);
		userDao.updateAll(user);

		return result;
	}

	// 查询次数
	public Integer countByUidAndTimeAndName(Integer uid, Integer projId, String createTime, String operateName) {
		Map<String, Object> params = new HashMap<>();
		params.put("uid", uid);
		params.put("projId", projId);
		params.put("createTime", createTime);
		params.put("operateName", operateName);
		return scoreExchangeDao.countByUidAndTimeAndName(params);
	}

	public List<Map<String, Object>> selectlisthavausermall(String username, String productname, Integer type,
			Integer page, Integer pagesize) {
		return scoreExchangeDao.selectlisthavausermall(username, productname, type, page, pagesize);
	}

	public JkScoreExchange isloginbytime(Integer uid, String startTime, String endTime, String operateName) {
		return scoreExchangeDao.isloginbytime(uid, startTime, endTime, operateName);
	}

}
