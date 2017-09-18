package com.chengan.business.repo.model;

import java.util.Date;

import javax.persistence.*;

@Table(name = "jk_project_comment")
public class JkProjectComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 评论用户ID
	 */
	private Integer uid;

	/**
	 * 被评论ID
	 */
	private Integer fid;

	/**
	 * 评论类型，1、用户评项目，2、发起者评论服务者，3、评论头条
	 */
	private String type;

	/**
	 * 评论内容
	 */
	private String comment;

	/**
	 * 评论属性值
	 */
	private Integer scroe;

	/**
	 * 用户名
	 */
	private String username;

	/**
	 * 用户头像地址
	 */
	private String headPicPath;

	/**
	 * 创建时间
	 */
	private Date createTime;

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
	 * 获取评论用户ID
	 *
	 * @return uid - 评论用户ID
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * 设置评论用户ID
	 *
	 * @param uid
	 *            评论用户ID
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * 获取被评论ID
	 *
	 * @return fid - 被评论ID
	 */
	public Integer getFid() {
		return fid;
	}

	/**
	 * 设置被评论ID
	 *
	 * @param fid
	 *            被评论ID
	 */
	public void setFid(Integer fid) {
		this.fid = fid;
	}

	/**
	 * 获取评论类型，1、用户评项目，2、发起者评论服务者，3、评论头条
	 *
	 * @return type - 评论类型，1、用户评项目，2、发起者评论服务者，3、评论头条
	 */
	public String getType() {
		return type;
	}

	/**
	 * 设置评论类型，1、用户评项目，2、发起者评论服务者，3、评论头条
	 *
	 * @param type
	 *            评论类型，1、用户评项目，2、发起者评论服务者，3、评论头条
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * 获取评论内容
	 *
	 * @return comment - 评论内容
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * 设置评论内容
	 *
	 * @param comment
	 *            评论内容
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * 获取评论属性值
	 *
	 * @return scroe - 评论属性值
	 */
	public Integer getScroe() {
		return scroe;
	}

	/**
	 * 设置评论属性值
	 *
	 * @param scroe
	 *            评论属性值
	 */
	public void setScroe(Integer scroe) {
		this.scroe = scroe;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getHeadPicPath() {
		return headPicPath;
	}

	public void setHeadPicPath(String headPicPath) {
		this.headPicPath = headPicPath;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}