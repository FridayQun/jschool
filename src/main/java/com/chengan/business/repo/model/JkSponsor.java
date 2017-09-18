package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_sponsor")
public class JkSponsor {
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 模块名称
	 */
	@Column(name = "name")
	private String name;

	/**
	 * 模块描述
	 */
	@Column(name = "description")
	private String description;

	/**
	 * 模块ICON
	 */
	@Column(name = "icon_url")
	private String iconUrl;

	/**
	 * 模块路径，绝对地址
	 */
	@Column(name = "link")
	private String link;

	/**
	 * 是否显示
	 */
	@Column(name = "is_show")
	private Integer isShow;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIsShow() {
		return isShow;
	}

	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}