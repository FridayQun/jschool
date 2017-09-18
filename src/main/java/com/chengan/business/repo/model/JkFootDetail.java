package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_foot_detail")
public class JkFootDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "pid")
	private Integer pId;

	@Column(name = "foot_pic_path")
	private String footPicPath;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public String getFootPicPath() {
		return footPicPath;
	}

	public void setFootPicPath(String footPicPath) {
		this.footPicPath = footPicPath;
	}
}