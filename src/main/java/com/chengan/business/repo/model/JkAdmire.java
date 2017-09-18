package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_admire")
public class JkAdmire {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 用户ID
	 */
	private Integer uid;

	private Integer type;

	/**
	 * 被点赞对象ID
	 */
	private Integer fid;

	/**
	 * 是否取消
	 */
	@Column(name = "is_cancel")
	private Integer isCancel;

	/**
	 * 被点赞对象描述
	 */
	private String description;

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
	 * @return type
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * @param type
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * 获取被点赞对象ID
	 *
	 * @return fid - 被点赞对象ID
	 */
	public Integer getFid() {
		return fid;
	}

	/**
	 * 设置被点赞对象ID
	 *
	 * @param fid
	 *            被点赞对象ID
	 */
	public void setFid(Integer fid) {
		this.fid = fid;
	}

	/**
	 * 获取是否取消
	 *
	 * @return is_cancel - 是否取消
	 */
	public Integer getIsCancel() {
		return isCancel;
	}

	/**
	 * 设置是否取消
	 *
	 * @param isCancel
	 *            是否取消
	 */
	public void setIsCancel(Integer isCancel) {
		this.isCancel = isCancel;
	}

	/**
	 * 获取被点赞对象描述
	 *
	 * @return description - 被点赞对象描述
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * 设置被点赞对象描述
	 *
	 * @param description
	 *            保存了点赞日期
	 */
	public void setDescription(String description) {
		this.description = description;
	}
}