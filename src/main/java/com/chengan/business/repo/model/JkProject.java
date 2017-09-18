package com.chengan.business.repo.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "jk_project")
public class JkProject {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private Integer uid;

	/**
	 * 项目名称
	 */
	@Column(name = "proj_name")
	private String projName;

	/**
	 * 项目类型
	 */
	@Column(name = "proj_type")
	private Integer projType;

	/**
	 * 项目需求
	 */
	@Column(name = "proj_needs")
	private String projNeeds;

	/**
	 * 项目图片
	 */
	@Column(name = "proj_pic_path")
	private String projPicPath;

	/**
	 * 发布用户名
	 */
	private String username;

	/**
	 * 发布人手机
	 */
	private String phone;

	/**
	 * 金钱要求，只能整数
	 */
	@Column(name = "money_needs")
	private Integer moneyNeeds;

	/**
	 * 人数要求
	 */
	@Column(name = "people_needs")
	private Integer peopleNeeds;

	/**
	 * 面积要求
	 */
	@Column(name = "square_needs")
	private Integer squareNeeds;

	/**
	 * 其他需求
	 */
	@Column(name = "other_needs")
	private String otherNeeds;

	/**
	 * 创建时间
	 */
	@Column(name = "create_time")
	private Date createTime;

	/**
	 * 开始时间
	 */
	@Column(name = "start_time")
	private Date startTime;

	/**
	 * 结束时间
	 */
	@Column(name = "end_time")
	private Date endTime;

	/**
	 * 报名截止时间
	 */
	@Column(name = "apply_time")
	private Date applyTime;

	/**
	 * 项目概述
	 */
	@Column(name = "proj_desc")
	private String projDesc;

	/**
	 * 项目类型
	 */
	@Column(name = "proj_cate")
	private String projCate;

	/**
	 * 项目标题
	 */
	@Column(name = "proj_title")
	private String projTitle;

	/**
	 * 项目地点
	 */
	@Column(name = "proj_location")
	private String projLocation;

	/**
	 * 次数
	 */
	@Column(name = "times_number")
	private Integer timesNumber;

	/**
	 * 项目状态
	 */
	private Integer status;

	/**
	 * 项目类型ID
	 */
	private Integer cid;

	/**
	 * 类型名称
	 */
	@Column(name = "cate_name")
	private String cateName;

	/**
	 * 额外需求
	 */
	@Column(name = "extra_str")
	private String extraStr;

	/**
	 * 额外附件数
	 */
	@Column(name = "extra_int")
	private Integer extraInt;

	/**
	 * 额外金钱要求
	 */
	@Column(name = "extra_double")
	private Double extraDouble;

	/**
	 * 类型名称
	 */
	@Column(name = "score")
	private Integer score;

	/**
	 * 生成H5内容
	 */
	@Column(name = "html_code")
	private byte[] htmlCode;

	@Column(name = "browsevolume")
	private Integer browsevolume;

	@Column(name = "applycount")
	private Integer applycount;

	@Column(name = "istop")
	private int istop;

	@Column(name = "isrecomment")
	private int isrecomment;

	public int getIstop() {
		return istop;
	}

	public void setIstop(int istop) {
		this.istop = istop;
	}

	/**
	 * @return id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return uid
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * @param uid
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * 获取项目名称
	 *
	 * @return proj_name - 项目名称
	 */
	public String getProjName() {
		return projName;
	}

	/**
	 * 设置项目名称
	 *
	 * @param projName
	 *            项目名称
	 */
	public void setProjName(String projName) {
		this.projName = projName;
	}

	/**
	 * 获取项目类型
	 *
	 * @return proj_type - 项目类型
	 */
	public Integer getProjType() {
		return projType;
	}

	/**
	 * 设置项目类型
	 *
	 * @param projType
	 *            项目类型
	 */
	public void setProjType(Integer projType) {
		this.projType = projType;
	}

	/**
	 * 获取项目需求
	 *
	 * @return proj_needs - 项目需求
	 */
	public String getProjNeeds() {
		return projNeeds;
	}

	/**
	 * 设置项目需求
	 *
	 * @param projNeeds
	 *            项目需求
	 */
	public void setProjNeeds(String projNeeds) {
		this.projNeeds = projNeeds;
	}

	/**
	 * 获取项目图片
	 *
	 * @return proj_pic_path - 项目图片
	 */
	public String getProjPicPath() {
		return projPicPath;
	}

	/**
	 * 设置项目图片
	 *
	 * @param projPicPath
	 *            项目图片
	 */
	public void setProjPicPath(String projPicPath) {
		this.projPicPath = projPicPath;
	}

	/**
	 * 获取发布用户名
	 *
	 * @return username - 发布用户名
	 */
	public String getUsername() {
		return username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * 设置发布用户名
	 *
	 * @param username
	 *            发布用户名
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * 获取金钱要求，只能整数
	 *
	 * @return money_needs - 金钱要求，只能整数
	 */
	public Integer getMoneyNeeds() {
		return moneyNeeds;
	}

	/**
	 * 设置金钱要求，只能整数
	 *
	 * @param moneyNeeds
	 *            金钱要求，只能整数
	 */
	public void setMoneyNeeds(Integer moneyNeeds) {
		this.moneyNeeds = moneyNeeds;
	}

	/**
	 * 获取人数要求
	 *
	 * @return people_needs - 人数要求
	 */
	public Integer getPeopleNeeds() {
		return peopleNeeds;
	}

	/**
	 * 设置人数要求
	 *
	 * @param peopleNeeds
	 *            人数要求
	 */
	public void setPeopleNeeds(Integer peopleNeeds) {
		this.peopleNeeds = peopleNeeds;
	}

	/**
	 * 获取面积要求
	 *
	 * @return square_needs - 面积要求
	 */
	public Integer getSquareNeeds() {
		return squareNeeds;
	}

	/**
	 * 设置面积要求
	 *
	 * @param squareNeeds
	 *            面积要求
	 */
	public void setSquareNeeds(Integer squareNeeds) {
		this.squareNeeds = squareNeeds;
	}

	/**
	 * 获取其他需求
	 *
	 * @return other_needs - 其他需求
	 */
	public String getOtherNeeds() {
		return otherNeeds;
	}

	/**
	 * 设置其他需求
	 *
	 * @param otherNeeds
	 *            其他需求
	 */
	public void setOtherNeeds(String otherNeeds) {
		this.otherNeeds = otherNeeds;
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
	 * 获取开始时间
	 *
	 * @return start_time - 开始时间
	 */
	public Date getStartTime() {
		return startTime;
	}

	/**
	 * 设置开始时间
	 *
	 * @param startTime
	 *            开始时间
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	/**
	 * 获取结束时间
	 *
	 * @return end_time - 结束时间
	 */
	public Date getEndTime() {
		return endTime;
	}

	/**
	 * 设置结束时间
	 *
	 * @param endTime
	 *            结束时间
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	/**
	 * 获取报名截止时间
	 *
	 * @return apply_time - 报名截止时间
	 */
	public Date getApplyTime() {
		return applyTime;
	}

	/**
	 * 设置报名截止时间
	 *
	 * @param applyTime
	 *            报名截止时间
	 */
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	/**
	 * 获取项目概述
	 *
	 * @return proj_desc - 项目概述
	 */
	public String getProjDesc() {
		return projDesc;
	}

	/**
	 * 设置项目概述
	 *
	 * @param projDesc
	 *            项目概述
	 */
	public void setProjDesc(String projDesc) {
		this.projDesc = projDesc;
	}

	/**
	 * 获取项目类型
	 *
	 * @return proj_cate - 项目类型
	 */
	public String getProjCate() {
		return projCate;
	}

	/**
	 * 设置项目类型
	 *
	 * @param projCate
	 *            项目类型
	 */
	public void setProjCate(String projCate) {
		this.projCate = projCate;
	}

	/**
	 * 获取项目标题
	 *
	 * @return proj _title - 项目标题
	 */
	public String getProjTitle() {
		return projTitle;
	}

	/**
	 * 设置项目标题
	 *
	 * @param proj
	 *            Title 项目标题
	 */
	public void setProjTitle(String projTitle) {
		this.projTitle = projTitle;
	}

	/**
	 * 获取项目地点
	 *
	 * @return proj_location - 项目地点
	 */
	public String getProjLocation() {
		return projLocation;
	}

	/**
	 * 设置项目地点
	 *
	 * @param projLocation
	 *            项目地点
	 */
	public void setProjLocation(String projLocation) {
		this.projLocation = projLocation;
	}

	/**
	 * 获取次数
	 *
	 * @return times_number - 次数
	 */
	public Integer getTimesNumber() {
		return timesNumber;
	}

	/**
	 * 设置次数
	 *
	 * @param timesNumber
	 *            次数
	 */
	public void setTimesNumber(Integer timesNumber) {
		this.timesNumber = timesNumber;
	}

	/**
	 * 获取项目状态
	 *
	 * @return status - 项目状态
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * 设置项目状态
	 *
	 * @param status
	 *            项目状态
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 获取项目类型ID
	 *
	 * @return cid - 项目类型ID
	 */
	public Integer getCid() {
		return cid;
	}

	/**
	 * 设置项目类型ID
	 *
	 * @param cid
	 *            项目类型ID
	 */
	public void setCid(Integer cid) {
		this.cid = cid;
	}

	/**
	 * 获取类型名称
	 *
	 * @return cate_name - 类型名称
	 */
	public String getCateName() {
		return cateName;
	}

	/**
	 * 设置类型名称
	 *
	 * @param cateName
	 *            类型名称
	 */
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	/**
	 * 获取额外需求
	 *
	 * @return extra_str - 额外需求
	 */
	public String getExtraStr() {
		return extraStr;
	}

	/**
	 * 设置额外需求
	 *
	 * @param extraStr
	 *            额外需求
	 */
	public void setExtraStr(String extraStr) {
		this.extraStr = extraStr;
	}

	/**
	 * 获取额外附件数
	 *
	 * @return extra_int - 额外附件数
	 */
	public Integer getExtraInt() {
		return extraInt;
	}

	/**
	 * 设置额外附件数
	 *
	 * @param extraInt
	 *            额外附件数
	 */
	public void setExtraInt(Integer extraInt) {
		this.extraInt = extraInt;
	}

	/**
	 * 获取额外金钱要求
	 *
	 * @return extra_double - 额外金钱要求
	 */
	public Double getExtraDouble() {
		return extraDouble;
	}

	/**
	 * 设置额外金钱要求
	 *
	 * @param extraDouble
	 *            额外金钱要求
	 */
	public void setExtraDouble(Double extraDouble) {
		this.extraDouble = extraDouble;
	}

	/**
	 * 获取生成H5内容
	 *
	 * @return html_code - 生成H5内容
	 */
	public byte[] getHtmlCode() {
		return htmlCode;
	}

	/**
	 * 设置生成H5内容
	 *
	 * @param htmlCode
	 *            生成H5内容
	 */
	public void setHtmlCode(byte[] htmlCode) {
		this.htmlCode = htmlCode;
	}

	public Integer getBrowsevolume() {
		return browsevolume;
	}

	public void setBrowsevolume(Integer browsevolume) {
		this.browsevolume = browsevolume;
	}

	public Integer getApplycount() {
		return applycount;
	}

	public void setApplycount(Integer applycount) {
		this.applycount = applycount;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public int getIsrecomment() {
		return isrecomment;
	}

	public void setIsrecomment(int isrecomment) {
		this.isrecomment = isrecomment;
	}

}