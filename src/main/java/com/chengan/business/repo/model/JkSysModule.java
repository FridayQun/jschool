package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_sys_module")
public class JkSysModule {
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 模块名称
	 */
	private String moduleName;

	/**
	 * 模块描述
	 */
	private String moduleDesc;

	/**
	 * 模块ICON
	 */
	private String modulePic;

	/**
	 * 模块路径，相对地址
	 */
	@Column(name = "module_url")
	private String moduleUrl;

	/**
	 * 模块编号
	 */
	@Column(name = "module_order")
	private Integer moduleOrder;

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

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleDesc() {
		return moduleDesc;
	}

	public void setModuleDesc(String moduleDesc) {
		this.moduleDesc = moduleDesc;
	}

	public String getModulePic() {
		return modulePic;
	}

	public void setModulePic(String modulePic) {
		this.modulePic = modulePic;
	}

	public String getModuleUrl() {
		return moduleUrl;
	}

	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}

	public Integer getModuleOrder() {
		return moduleOrder;
	}

	public void setModuleOrder(Integer moduleOrder) {
		this.moduleOrder = moduleOrder;
	}

	public Integer getIsShow() {
		return isShow;
	}

	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}

}