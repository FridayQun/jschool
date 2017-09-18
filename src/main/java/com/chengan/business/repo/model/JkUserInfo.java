package com.chengan.business.repo.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "jk_user_info")
public class JkUserInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private Integer uid;
	@Column(name = "permissions")
	private Integer permissions;

	public Integer getPermissions() {
		return permissions;
	}

	public void setPermissions(Integer permissions) {
		this.permissions = permissions;
	}

	/**
	 * 真实姓名
	 */
	private String realname;

	/**
	 * QQ联系方式
	 */
	@Column(name = "contract_qq")
	private String contractQq;

	/**
	 * 微博联系方式
	 */
	@Column(name = "contract_weibo")
	private String contractWeibo;

	public String getContractWeibo() {
		return contractWeibo;
	}

	public void setContractWeibo(String contractWeibo) {
		this.contractWeibo = contractWeibo;
	}

	/**
	 * 微信联系
	 */
	@Column(name = "contract_weixin")
	private String contractWeixin;

	/**
	 * 邮箱联系
	 */
	@Column(name = "contract_mail")
	private String contractMail;

	/**
	 * 公司名称
	 */
	@Column(name = "company_name")
	private String companyName;

	/**
	 * 部门名称
	 */
	@Column(name = "depart_name")
	private String departName;

	/**
	 * 工作职称
	 */
	private String title;

	/**
	 * 地点
	 */
	private String location;

	/**
	 * 教育类型
	 */
	@Column(name = "edu_type")
	private Integer eduType;

	/**
	 * 学校名称
	 */
	@Column(name = "edu_name")
	private String eduName;

	/**
	 * 院系名称
	 */
	@Column(name = "edu_collage")
	private String eduCollage;

	/**
	 * 入学时间
	 */
	@Column(name = "edu_time")
	private Date eduTime;

	@Column(name = "edu_club")
	private String eduClub;

	@Column(name = "edu_major")
	private String eduMajor;

	public String getEduClub() {
		return eduClub;
	}

	public void setEduClub(String eduClub) {
		this.eduClub = eduClub;
	}

	public String getEduMajor() {
		return eduMajor;
	}

	public void setEduMajor(String eduMajor) {
		this.eduMajor = eduMajor;
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
	 * 获取真实姓名
	 *
	 * @return realname - 真实姓名
	 */
	public String getRealname() {
		return realname;
	}

	/**
	 * 设置真实姓名
	 *
	 * @param realname
	 *            真实姓名
	 */
	public void setRealname(String realname) {
		this.realname = realname;
	}

	/**
	 * 获取QQ联系方式
	 *
	 * @return contract_qq - QQ联系方式
	 */
	public String getContractQq() {
		return contractQq;
	}

	/**
	 * 设置QQ联系方式
	 *
	 * @param contractQq
	 *            QQ联系方式
	 */
	public void setContractQq(String contractQq) {
		this.contractQq = contractQq;
	}

	/**
	 * 获取微信联系
	 *
	 * @return contract_weixin - 微信联系
	 */
	public String getContractWeixin() {
		return contractWeixin;
	}

	/**
	 * 设置微信联系
	 *
	 * @param contractWeixin
	 *            微信联系
	 */
	public void setContractWeixin(String contractWeixin) {
		this.contractWeixin = contractWeixin;
	}

	/**
	 * 获取邮箱联系
	 *
	 * @return contract_mail - 邮箱联系
	 */
	public String getContractMail() {
		return contractMail;
	}

	/**
	 * 设置邮箱联系
	 *
	 * @param contractMail
	 *            邮箱联系
	 */
	public void setContractMail(String contractMail) {
		this.contractMail = contractMail;
	}

	/**
	 * 获取公司名称
	 *
	 * @return company_name - 公司名称
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * 设置公司名称
	 *
	 * @param companyName
	 *            公司名称
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	/**
	 * 获取部门名称
	 *
	 * @return depart_name - 部门名称
	 */
	public String getDepartName() {
		return departName;
	}

	/**
	 * 设置部门名称
	 *
	 * @param departName
	 *            部门名称
	 */
	public void setDepartName(String departName) {
		this.departName = departName;
	}

	/**
	 * 获取工作职称
	 *
	 * @return title - 工作职称
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 设置工作职称
	 *
	 * @param title
	 *            工作职称
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 获取地点
	 *
	 * @return location - 地点
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * 设置地点
	 *
	 * @param location
	 *            地点
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * 获取教育类型
	 *
	 * @return edu_type - 教育类型
	 */
	public Integer getEduType() {
		return eduType;
	}

	/**
	 * 设置教育类型
	 *
	 * @param eduType
	 *            教育类型
	 */
	public void setEduType(Integer eduType) {
		this.eduType = eduType;
	}

	/**
	 * 获取学校名称
	 *
	 * @return edu_name - 学校名称
	 */
	public String getEduName() {
		return eduName;
	}

	/**
	 * 设置学校名称
	 *
	 * @param eduName
	 *            学校名称
	 */
	public void setEduName(String eduName) {
		this.eduName = eduName;
	}

	/**
	 * 获取院系名称
	 *
	 * @return edu_collage - 院系名称
	 */
	public String getEduCollage() {
		return eduCollage;
	}

	/**
	 * 设置院系名称
	 *
	 * @param eduCollage
	 *            院系名称
	 */
	public void setEduCollage(String eduCollage) {
		this.eduCollage = eduCollage;
	}

	/**
	 * 获取入学时间
	 *
	 * @return edu_time - 入学时间
	 */
	public Date getEduTime() {
		return eduTime;
	}

	/**
	 * 设置入学时间
	 *
	 * @param eduTime
	 *            入学时间
	 */
	public void setEduTime(Date eduTime) {
		this.eduTime = eduTime;
	}
}