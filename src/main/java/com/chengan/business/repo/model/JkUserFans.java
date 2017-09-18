package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_user_fans")
public class JkUserFans {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 用户ID
	 */
	private Integer uid;

	/**
	 * 关注者的ID
	 */
	@Column(name = "fan_id")
	private Integer fanId;

	/**
	 * 关注者用户名
	 */
	@Column(name = "fan_name")
	private String fanName;

	/**
	 * 关注者头像
	 */
	@Column(name = "fan_pic_path")
	private String fanPicPath;

	/**
	 * 关注者描述
	 */
	@Column(name = "fan_desc")
	private String fanDesc;

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
	 * 获取用户ID
	 *
	 * @return uid - 用户ID
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * 设置用户ID
	 *
	 * @param uid
	 *            用户ID
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * 获取关注者的ID
	 *
	 * @return fan_id - 关注者的ID
	 */
	public Integer getFanId() {
		return fanId;
	}

	/**
	 * 设置关注者的ID
	 *
	 * @param fanId
	 *            关注者的ID
	 */
	public void setFanId(Integer fanId) {
		this.fanId = fanId;
	}

	/**
	 * 获取关注者用户名
	 *
	 * @return fan_name - 关注者用户名
	 */
	public String getFanName() {
		return fanName;
	}

	/**
	 * 设置关注者用户名
	 *
	 * @param fanName
	 *            关注者用户名
	 */
	public void setFanName(String fanName) {
		this.fanName = fanName;
	}

	/**
	 * 获取关注者头像
	 *
	 * @return fan_pic_path - 关注者头像
	 */
	public String getFanPicPath() {
		return fanPicPath;
	}

	/**
	 * 设置关注者头像
	 *
	 * @param fanPicPath
	 *            关注者头像
	 */
	public void setFanPicPath(String fanPicPath) {
		this.fanPicPath = fanPicPath;
	}

	/**
	 * 获取关注者描述
	 *
	 * @return fan_desc - 关注者描述
	 */
	public String getFanDesc() {
		return fanDesc;
	}

	/**
	 * 设置关注者描述
	 *
	 * @param fanDesc
	 *            关注者描述
	 */
	public void setFanDesc(String fanDesc) {
		this.fanDesc = fanDesc;
	}
}