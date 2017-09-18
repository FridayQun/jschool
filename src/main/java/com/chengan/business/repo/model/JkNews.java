package com.chengan.business.repo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "jk_news")
public class JkNews {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 新闻标题
	 */
	private String title;

	/**
	 * 头条概要
	 */
	private String description;

	/**
	 * 发布用户ID
	 */
	private Integer uid;

	/**
	 * 用户头像
	 */
	private String username;

	private String phone;

	/**
	 * 用户公司名
	 */
	private String companyName;

	/**
	 * 用户学习名
	 */
	private String eduName;

	/**
	 * 用户头像
	 */
	private Date createTime;

	/**
	 * 头像地址
	 */
	@Column(name = "head_pic_path")
	private String headPicPath;

	/**
	 * 头像地址
	 */
	@Column(name = "status")
	private Integer status;

	/**
	 * 头条内容
	 */
	private String content;

	/**
	 * 头条类型，1、原创，2转载，若为转载，content为url
	 */
	private String type;

	/**
	 * 来源
	 */
	private String source;

	/**
	 * 浏览量
	 */
	@Column(name = "browsevolume")
	private Integer browsevolume;

	/**
	 * 头条图片概要
	 */
	@Column(name = "pic_path")
	private String picPath;

	private byte[] htmlcode;

	@Column(name = "istop")
	private int istop;

	@Column(name = "isrecomment")
	private int isrecomment;

	@Column(name = "source_type")
	private int sourceType;

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
	 * 获取新闻标题
	 *
	 * @return title - 新闻标题
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 设置新闻标题
	 *
	 * @param title
	 *            新闻标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 获取头条概要
	 *
	 * @return description - 头条概要
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * 设置头条概要
	 *
	 * @param description
	 *            头条概要
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * 获取发布用户ID
	 *
	 * @return uid - 发布用户ID
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * 设置发布用户ID
	 *
	 * @param uid
	 *            发布用户ID
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * 获取用户头像
	 *
	 * @return username - 用户头像
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * 设置用户头像
	 *
	 * @param username
	 *            用户头像
	 */
	public void setUsername(String username) {
		this.username = username;
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
	 * 获取头条内容
	 *
	 * @return content - 头条内容
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置头条内容
	 *
	 * @param content
	 *            头条内容
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 获取头条类型，1、原创，2转载，若为转载，content为url
	 *
	 * @return type - 头条类型，1、原创，2转载，若为转载，content为url
	 */
	public String getType() {
		return type;
	}

	/**
	 * 设置头条类型，1、原创，2转载，若为转载，content为url
	 *
	 * @param type
	 *            头条类型，1、原创，2转载，若为转载，content为url
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * 获取头条图片概要
	 *
	 * @return pic_path - 头条图片概要
	 */
	public String getPicPath() {
		return picPath;
	}

	/**
	 * 设置头条图片概要
	 *
	 * @param picPath
	 *            头条图片概要
	 */
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	/**
	 * @return htmlcode
	 */
	public byte[] getHtmlcode() {
		return htmlcode;
	}

	/**
	 * @param htmlcode
	 */
	public void setHtmlcode(byte[] htmlcode) {
		this.htmlcode = htmlcode;
	}

	/**
	 * 头条状态
	 * 
	 * @return
	 */
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getEduName() {
		return eduName;
	}

	public void setEduName(String eduName) {
		this.eduName = eduName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Integer getBrowsevolume() {
		return browsevolume;
	}

	public void setBrowsevolume(Integer browsevolume) {
		this.browsevolume = browsevolume;
	}

	public int getIstop() {
		return istop;
	}

	public void setIstop(int istop) {
		this.istop = istop;
	}

	public int getSourceType() {
		return sourceType;
	}

	public void setSourceType(int sourceType) {
		this.sourceType = sourceType;
	}

	public int getIsrecomment() {
		return isrecomment;
	}

	public void setIsrecomment(int isrecomment) {
		this.isrecomment = isrecomment;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}