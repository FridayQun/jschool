package com.chengan.business.repo.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "jk_user_fans_follows")
public class JkUserFansFollows {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "fan_id")
	private Integer fanId;

	@Column(name = "follow_id")
	private Integer followId;

	public Integer getFanId() {
		return fanId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setFanId(Integer fanId) {
		this.fanId = fanId;
	}

	public Integer getFollowId() {
		return followId;
	}

	public void setFollowId(Integer followId) {
		this.followId = followId;
	}

}
