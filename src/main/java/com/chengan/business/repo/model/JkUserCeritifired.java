package com.chengan.business.repo.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "jk_user_ceritifired")
public class JkUserCeritifired {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	// 用户id
	@Column(name = "uid")
	private Integer uid;

	// 用户类型
	@Column(name = "type")
	private Integer type;

	// 真实名字
	@Column(name = "realname")
	private String realname;

	@Column(name = "idcard_positive")
	private String idcardPositive;

	@Column(name = "idcard_opposite")
	private String idcardOpposite;

	@Column(name = "idcard_hold")
	private String idcardHold;

	@Column(name = "school")
	private String school;

	@Column(name = "edu_starttime")
	private String eduStarttime;

	@Column(name = "branch")
	private String branch;

	@Column(name = "club")
	private String club;

	@Column(name = "major")
	private String major;

	@Column(name = "profile")
	private String profile;

	@Column(name = "userno")
	private String userno;

	@Column(name = "location")
	private String location;

	@Column(name = "address")
	private String address;

	@Column(name = "state")
	private Integer state;

	@Column(name = "idno")
	private String idno;

	@Column(name = "document")
	private String document;

	@Column(name = "company")
	private String company;
	@Column(name = "position")
	private String position;

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDocument() {
		return document;
	}

	public void setDocument(String document) {
		this.document = document;
	}

	public String getIdno() {
		return idno;
	}

	public void setIdno(String idno) {
		this.idno = idno;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getIdcardPositive() {
		return idcardPositive;
	}

	public void setIdcardPositive(String idcardPositive) {
		this.idcardPositive = idcardPositive;
	}

	public String getIdcardOpposite() {
		return idcardOpposite;
	}

	public void setIdcardOpposite(String idcardOpposite) {
		this.idcardOpposite = idcardOpposite;
	}

	public String getIdcardHold() {
		return idcardHold;
	}

	public void setIdcardHold(String idcardHold) {
		this.idcardHold = idcardHold;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getEduStarttime() {
		return eduStarttime;
	}

	public void setEduStarttime(String eduStarttime) {
		this.eduStarttime = eduStarttime;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getClub() {
		return club;
	}

	public void setClub(String club) {
		this.club = club;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getUserno() {
		return userno;
	}

	public void setUserno(String userno) {
		this.userno = userno;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}
