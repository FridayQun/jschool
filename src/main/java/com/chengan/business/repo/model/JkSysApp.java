package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_sys_app")
public class JkSysApp {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 全局地址
	 */
	@Column(name = "domain_url")
	private String domainUrl;

	/**
	 * 版本号
	 */
	private String version;

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
	 * 获取全局地址
	 *
	 * @return domain_url - 全局地址
	 */
	public String getDomainUrl() {
		return domainUrl;
	}

	/**
	 * 设置全局地址
	 *
	 * @param domainUrl
	 *            全局地址
	 */
	public void setDomainUrl(String domainUrl) {
		this.domainUrl = domainUrl;
	}

	/**
	 * 获取版本号
	 *
	 * @return version - 版本号
	 */
	public String getVersion() {
		return version;
	}

	/**
	 * 设置版本号
	 *
	 * @param version
	 *            版本号
	 */
	public void setVersion(String version) {
		this.version = version;
	}
}