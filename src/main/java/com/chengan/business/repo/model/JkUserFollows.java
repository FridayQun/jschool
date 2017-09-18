package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_user_follows")
public class JkUserFollows {
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
	@Column(name = "follow_id")
	private Integer followId;

	/**
	 * 关注者用户名
	 */
	@Column(name = "follow_name")
	private String followName;

	/**
	 * 关注者头像
	 */
	@Column(name = "follow_pic_path")
	private String followPicPath;

	/**
	 * 关注者描述
	 */
	@Column(name = "follow_desc")
	private String followDesc;

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
	 * @return follow_id - 关注者的ID
	 */
	public Integer getFollowId() {
		return followId;
	}

	/**
	 * 设置关注者的ID
	 *
	 * @param followId
	 *            关注者的ID
	 */
	public void setFollowId(Integer followId) {
		this.followId = followId;
	}

	/**
	 * 获取关注者用户名
	 *
	 * @return follow_name - 关注者用户名
	 */
	public String getFollowName() {
		return followName;
	}

	/**
	 * 设置关注者用户名
	 *
	 * @param followName
	 *            关注者用户名
	 */
	public void setFollowName(String followName) {
		this.followName = followName;
	}

	/**
	 * 获取关注者头像
	 *
	 * @return follow_pic_path - 关注者头像
	 */
	public String getFollowPicPath() {
		return followPicPath;
	}

	/**
	 * 设置关注者头像
	 *
	 * @param followPicPath
	 *            关注者头像
	 */
	public void setFollowPicPath(String followPicPath) {
		this.followPicPath = followPicPath;
	}

	/**
	 * 获取关注者描述
	 *
	 * @return follow_desc - 关注者描述
	 */
	public String getFollowDesc() {
		return followDesc;
	}

	/**
	 * 设置关注者描述
	 *
	 * @param followDesc
	 *            关注者描述
	 */
	public void setFollowDesc(String followDesc) {
		this.followDesc = followDesc;
	}
}