package com.chengan.business.repo.model;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "jk_user")
public class JkUser {
	/**
	 * 主键ID
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 用户名
	 */
	private String username;

	/**
	 * 用户手机
	 */
	private String phone;

	/**
	 * 昵称
	 */
	private String nickname;

	/**
	 * 组ID，暂不用
	 */
	@Column(name = "group_id")
	private Integer groupId;

	/**
	 * 证件信息
	 */
	@Column(name = "id_card")
	private String idCard;

	/**
	 * 证件类型
	 */
	@Column(name = "id_type")
	private Integer idType;

	/**
	 * 密码
	 */
	private String password;

	/**
	 * 微信ID
	 */
	private String wxopenid;

	/**
	 * 性别
	 */
	private Integer gender;

	/**
	 * 登录时间
	 */
	@Column(name = "login_time")
	private Date loginTime;

	/**
	 * 创建时间
	 */
	@Column(name = "create_time")
	private Date createTime;

	/**
	 * 更新时间
	 */
	@Column(name = "update_time")
	private Date updateTime;

	/**
	 * 描述
	 */
	private String description;

	/**
	 * 头像缩略图地址
	 */
	@Column(name = "head_mini_pic_path")
	private String headMiniPicPath;

	/**
	 * 头像地址
	 */
	@Column(name = "head_pic_path")
	private String headPicPath;
	/**
	 * 背景图片地址
	 */
	@Column(name = "background_picture")
	private String backgroundPicture;

	public String getBackgroundPicture() {
		return backgroundPicture;
	}

	@Column(name = "istop")
	public Integer istop;

	@Column(name = "toptime")
	public Date toptime;

	public Integer getIstop() {
		return istop;
	}

	public void setIstop(Integer istop) {
		this.istop = istop;
	}

	public void setBackgroundPicture(String backgroundPicture) {
		this.backgroundPicture = backgroundPicture;
	}

	/**
	 * 个人宣言
	 */
	private String slogan;

	/**
	 * 主标签
	 */
	private String tag;

	/**
	 * 用户等级
	 */
	@Column(name = "user_level")
	private Integer userLevel;

	/**
	 * 邀请注册码
	 */
	@Column(name = "invite_code")
	private String inviteCode;

	/**
	 * 注册使用的邀请码
	 */
	@Column(name = "register_code")
	private String registerCode;

	/**
	 * 登录IP地址
	 */
	@Column(name = "login_ip")
	private String loginIp;

	/**
	 * 积分
	 */
	private Integer point;

	/**
	 * 跟随者人数
	 */
	private Integer follows;

	/**
	 * 粉丝人数
	 */
	private Integer fans;

	/**
	 * 余额，暂时用不上
	 */
	private BigDecimal balance;

	@Column(name = "extra_int")
	private Integer extraInt;

	@Column(name = "extra_double")
	private BigDecimal extraDouble;

	@Column(name = "extra_str")
	private String extraStr;

	@Column(name = "login_times")
	private int loginTimes;

	/**
	 * 硬件编码,MD5加密
	 */
	@Column(name = "device_code")
	private String deviceCode;

	public int getLoginTimes() {
		return loginTimes;
	}

	public void setLoginTimes(int loginTimes) {
		this.loginTimes = loginTimes;
	}

	/**
	 * 用户位置
	 */
	private String location;

	/**
	 * 热度
	 */
	private Integer hot;

	/**
	 * 影响力
	 */
	private Integer influence;

	/**
	 * 获取主键ID
	 *
	 * @return id - 主键ID
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 设置主键ID
	 *
	 * @param id
	 *            主键ID
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 获取用户名
	 *
	 * @return username - 用户名
	 */
	public String getUsername() {
		return username;
	}

	public Date getToptime() {
		return toptime;
	}

	public void setToptime(Date toptime) {
		this.toptime = toptime;
	}

	/**
	 * 设置用户名
	 *
	 * @param username
	 *            用户名
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * 获取用户手机
	 *
	 * @return phone - 用户手机
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * 设置用户手机
	 *
	 * @param phone
	 *            用户手机
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * 获取昵称
	 *
	 * @return nickname - 昵称
	 */
	public String getNickname() {
		return nickname;
	}

	/**
	 * 设置昵称
	 *
	 * @param nickname
	 *            昵称
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	/**
	 * 获取组ID，暂不用
	 *
	 * @return group_id - 组ID，暂不用
	 */
	public Integer getGroupId() {
		return groupId;
	}

	/**
	 * 设置组ID，暂不用
	 *
	 * @param groupId
	 *            组ID，暂不用
	 */
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	/**
	 * 获取证件信息
	 *
	 * @return id_card - 证件信息
	 */
	public String getIdCard() {
		return idCard;
	}

	/**
	 * 设置证件信息
	 *
	 * @param idCard
	 *            证件信息
	 */
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	/**
	 * 获取证件类型
	 *
	 * @return id_type - 证件类型
	 */
	public Integer getIdType() {
		return idType;
	}

	/**
	 * 设置证件类型
	 *
	 * @param idType
	 *            证件类型
	 */
	public void setIdType(Integer idType) {
		this.idType = idType;
	}

	/**
	 * 获取密码
	 *
	 * @return password - 密码
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 设置密码
	 *
	 * @param password
	 *            密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 获取微信ID
	 *
	 * @return wxopenid - 微信ID
	 */
	public String getWxopenid() {
		return wxopenid;
	}

	/**
	 * 设置微信ID
	 *
	 * @param wxopenid
	 *            微信ID
	 */
	public void setWxopenid(String wxopenid) {
		this.wxopenid = wxopenid;
	}

	/**
	 * 获取性别
	 *
	 * @return gender - 性别
	 */
	public Integer getGender() {
		return gender;
	}

	/**
	 * 设置性别
	 *
	 * @param gender
	 *            性别
	 */
	public void setGender(Integer gender) {
		this.gender = gender;
	}

	/**
	 * 获取登录时间
	 *
	 * @return login_time - 登录时间
	 */
	public Date getLoginTime() {
		return loginTime;
	}

	/**
	 * 设置登录时间
	 *
	 * @param loginTime
	 *            登录时间
	 */
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	/**
	 * 获取创建时间
	 *
	 * @return create_time - 创建时间
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * 设置创建时间
	 *
	 * @param createTime
	 *            创建时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取更新时间
	 *
	 * @return update_time - 更新时间
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	/**
	 * 设置更新时间
	 *
	 * @param updateTime
	 *            更新时间
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 获取描述
	 *
	 * @return description - 描述
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * 设置描述
	 *
	 * @param description
	 *            描述
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * 获取头像缩略图地址
	 *
	 * @return head_mini_pic_path - 头像缩略图地址
	 */
	public String getHeadMiniPicPath() {
		return headMiniPicPath;
	}

	/**
	 * 设置头像缩略图地址
	 *
	 * @param headMiniPicPath
	 *            头像缩略图地址
	 */
	public void setHeadMiniPicPath(String headMiniPicPath) {
		this.headMiniPicPath = headMiniPicPath;
	}

	/**
	 * 获取头像地址
	 *
	 * @return head_pic_path - 头像地址
	 */
	public String getHeadPicPath() {
		return headPicPath;
	}

	/**
	 * 设置头像地址
	 *
	 * @param headPicPath
	 *            头像地址
	 */
	public void setHeadPicPath(String headPicPath) {
		this.headPicPath = headPicPath;
	}

	/**
	 * 获取个人宣言
	 *
	 * @return slogan - 个人宣言
	 */
	public String getSlogan() {
		return slogan;
	}

	/**
	 * 设置个人宣言
	 *
	 * @param slogan
	 *            个人宣言
	 */
	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}

	/**
	 * 获取主标签
	 *
	 * @return tag - 主标签
	 */
	public String getTag() {
		return tag;
	}

	/**
	 * 设置主标签
	 *
	 * @param tag
	 *            主标签
	 */
	public void setTag(String tag) {
		this.tag = tag;
	}

	/**
	 * 获取用户等级
	 *
	 * @return user_level - 用户等级
	 */
	public Integer getUserLevel() {
		return userLevel;
	}

	/**
	 * 设置用户等级
	 *
	 * @param userLevel
	 *            用户等级
	 */
	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
	}

	/**
	 * 获取邀请注册码
	 *
	 * @return invite_code - 邀请注册码
	 */
	public String getInviteCode() {
		return inviteCode;
	}

	/**
	 * 设置邀请注册码
	 *
	 * @param inviteCode
	 *            邀请注册码
	 */
	public void setInviteCode(String inviteCode) {
		this.inviteCode = inviteCode;
	}

	/**
	 * 获取注册使用的邀请码
	 *
	 * @return register_code - 注册使用的邀请码
	 */
	public String getRegisterCode() {
		return registerCode;
	}

	/**
	 * 设置注册使用的邀请码
	 *
	 * @param registerCode
	 *            注册使用的邀请码
	 */
	public void setRegisterCode(String registerCode) {
		this.registerCode = registerCode;
	}

	/**
	 * 获取登录IP地址
	 *
	 * @return login_ip - 登录IP地址
	 */
	public String getLoginIp() {
		return loginIp;
	}

	/**
	 * 设置登录IP地址
	 *
	 * @param loginIp
	 *            登录IP地址
	 */
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	/**
	 * 获取积分
	 *
	 * @return point - 积分
	 */
	public Integer getPoint() {
		return point;
	}

	/**
	 * 设置积分
	 *
	 * @param point
	 *            积分
	 */
	public void setPoint(Integer point) {
		this.point = point;
	}

	/**
	 * 获取跟随者人数
	 *
	 * @return follows - 跟随者人数
	 */
	public Integer getFollows() {
		return follows;
	}

	/**
	 * 设置跟随者人数
	 *
	 * @param follows
	 *            跟随者人数
	 */
	public void setFollows(Integer follows) {
		this.follows = follows;
	}

	/**
	 * 获取粉丝人数
	 *
	 * @return fans - 粉丝人数
	 */
	public Integer getFans() {
		return fans;
	}

	/**
	 * 设置粉丝人数
	 *
	 * @param fans
	 *            粉丝人数
	 */
	public void setFans(Integer fans) {
		this.fans = fans;
	}

	/**
	 * 获取余额，暂时用不上
	 *
	 * @return balance - 余额，暂时用不上
	 */
	public BigDecimal getBalance() {
		return balance;
	}

	/**
	 * 设置余额，暂时用不上
	 *
	 * @param balance
	 *            余额，暂时用不上
	 */
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	/**
	 * @return extra_int
	 */
	public Integer getExtraInt() {
		if(extraInt == null) {
			return 0;
		}
		return extraInt;
	}

	/**
	 * @param extraInt
	 */
	public void setExtraInt(Integer extraInt) {
		this.extraInt = extraInt;
	}

	/**
	 * @return extra_double
	 */
	public BigDecimal getExtraDouble() {
		return extraDouble;
	}

	/**
	 * @param extraDouble
	 */
	public void setExtraDouble(BigDecimal extraDouble) {
		this.extraDouble = extraDouble;
	}

	/**
	 * @return extra_str
	 */
	public String getExtraStr() {
		return extraStr;
	}

	/**
	 * @param extraStr
	 */
	public void setExtraStr(String extraStr) {
		this.extraStr = extraStr;
	}

	/**
	 * 获取硬件编码,MD5加密
	 *
	 * @return device_code - 硬件编码,MD5加密
	 */
	public String getDeviceCode() {
		return deviceCode;
	}

	/**
	 * 设置硬件编码,MD5加密
	 *
	 * @param deviceCode
	 *            硬件编码,MD5加密
	 */
	public void setDeviceCode(String deviceCode) {
		this.deviceCode = deviceCode;
	}

	/**
	 * 获取用户位置
	 *
	 * @return location - 用户位置
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * 设置用户位置
	 *
	 * @param location
	 *            用户位置
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * 获取热度
	 *
	 * @return hot - 热度
	 */
	public Integer getHot() {
		return hot;
	}

	/**
	 * 设置热度
	 *
	 * @param hot
	 *            热度
	 */
	public void setHot(Integer hot) {
		this.hot = hot;
	}

	/**
	 * 获取影响力
	 *
	 * @return influence - 影响力
	 */
	public Integer getInfluence() {
		return influence;
	}

	/**
	 * 设置影响力
	 *
	 * @param influence
	 *            影响力
	 */
	public void setInfluence(Integer influence) {
		this.influence = influence;
	}
}