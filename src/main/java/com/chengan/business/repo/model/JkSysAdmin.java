package com.chengan.business.repo.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "jk_sys_admin")
public class JkSysAdmin {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String admin;

	private String password;

	@Column(name = "create_time")
	private Date createTime;

	@Column(name = "admin_level")
	private Integer adminLevel;

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
	 * @return admin
	 */
	public String getAdmin() {
		return admin;
	}

	/**
	 * @param admin
	 */
	public void setAdmin(String admin) {
		this.admin = admin;
	}

	/**
	 * @return password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return create_time
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * @return admin_level
	 */
	public Integer getAdminLevel() {
		return adminLevel;
	}

	/**
	 * @param adminLevel
	 */
	public void setAdminLevel(Integer adminLevel) {
		this.adminLevel = adminLevel;
	}
}