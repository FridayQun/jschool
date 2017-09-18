package com.chengan.business.repo.model;

import java.util.Date;

import javax.persistence.*;

@Table(name = "jk_project_apply")
public class JkProjectApply {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 项目ID
	 */
	private Integer pid;

	/**
	 * 申请报名的用户
	 */
	private Integer uid;

	/**
	 * 报名留言
	 */
	private String words;

	/**
	 * 用户名
	 */
	@Column(name = "user_name")
	private String userName;

	@Column(name = "phone")
	private String phone;

	/**
	 * 用户头像
	 */
	@Column(name = "user_pic_path")
	private String userPicPath;

	/**
	 * 状态
	 */
	@Column(name = "status")
	private Integer status;

	@Column(name = "create_time")
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
	 * 获取项目ID
	 *
	 * @return pid - 项目ID
	 */
	public Integer getPid() {
		return pid;
	}

	/**
	 * 设置项目ID
	 *
	 * @param pid
	 *            项目ID
	 */
	public void setPid(Integer pid) {
		this.pid = pid;
	}

	/**
	 * 获取申请报名的用户
	 *
	 * @return uid - 申请报名的用户
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * 设置申请报名的用户
	 *
	 * @param uid
	 *            申请报名的用户
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * 获取报名留言
	 *
	 * @return words - 报名留言
	 */
	public String getWords() {
		return words;
	}

	/**
	 * 设置报名留言
	 *
	 * @param words
	 *            报名留言
	 */
	public void setWords(String words) {
		this.words = words;
	}

	/**
	 * 获取用户名
	 *
	 * @return user_name - 用户名
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 设置用户名
	 *
	 * @param userName
	 *            用户名
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 获取用户头像
	 *
	 * @return user_pic_path - 用户头像
	 */
	public String getUserPicPath() {
		return userPicPath;
	}

	/**
	 * 设置用户头像
	 *
	 * @param userPicPath
	 *            用户头像
	 */
	public void setUserPicPath(String userPicPath) {
		this.userPicPath = userPicPath;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}