package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_foot")
public class JkFoot {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "foot_name")
	private String footName;

	@Column(name = "foot_en_name")
	private String footEnName;
	
	@Column(name = "foot_link")
	private String footLink;
	
	@Column(name = "foot_desc")
	private String footDesc;
	
	@Column(name = "foot_uri")
	private String footUri;

	public String getFootUri() {
		return footUri;
	}

	public void setFootUri(String footUri) {
		this.footUri = footUri;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFootName() {
		return footName;
	}

	public void setFootName(String footName) {
		this.footName = footName;
	}

	public String getFootEnName() {
		return footEnName;
	}

	public void setFootEnName(String footEnName) {
		this.footEnName = footEnName;
	}

	public String getFootLink() {
		return footLink;
	}

	public void setFootLink(String footLink) {
		this.footLink = footLink;
	}

	public String getFootDesc() {
		return footDesc;
	}

	public void setFootDesc(String footDesc) {
		this.footDesc = footDesc;
	}
}