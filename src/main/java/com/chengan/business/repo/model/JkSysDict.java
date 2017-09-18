package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_sys_dict")
public class JkSysDict {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private Integer type;

	/**
	 * 字典名称
	 */
	@Column(name = "dict_name")
	private String dictName;

	/**
	 * 字典描述
	 */
	@Column(name = "dict_desc")
	private String dictDesc;

	/**
	 * 字典属性值
	 */
	private Integer score;

	@Column(name = "dict_dimension")
	private Integer dictDimension;

	@Column(name = "dict_level")
	private Integer dictLevel;

	@Column(name = "dict_pid")
	private Integer dictPid;

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
	 * 获取字典名称
	 *
	 * @return dict_name - 字典名称
	 */
	public String getDictName() {
		return dictName;
	}

	/**
	 * 设置字典名称
	 *
	 * @param dictName
	 *            字典名称
	 */
	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	/**
	 * 获取字典描述
	 *
	 * @return dict_desc - 字典描述
	 */
	public String getDictDesc() {
		return dictDesc;
	}

	/**
	 * 设置字典描述
	 *
	 * @param dictDesc
	 *            字典描述
	 */
	public void setDictDesc(String dictDesc) {
		this.dictDesc = dictDesc;
	}

	/**
	 * 获取字典属性值
	 *
	 * @return score - 字典属性值
	 */
	public Integer getScore() {
		return score;
	}

	/**
	 * 设置字典属性值
	 *
	 * @param score
	 *            字典属性值
	 */
	public void setScore(Integer score) {
		this.score = score;
	}

	/**
	 * @return dict_dimension
	 */
	public Integer getDictDimension() {
		return dictDimension;
	}

	/**
	 * @param dictDimension
	 */
	public void setDictDimension(Integer dictDimension) {
		this.dictDimension = dictDimension;
	}

	/**
	 * @return dict_level
	 */
	public Integer getDictLevel() {
		return dictLevel;
	}

	/**
	 * @param dictLevel
	 */
	public void setDictLevel(Integer dictLevel) {
		this.dictLevel = dictLevel;
	}

	/**
	 * @return dict_pid
	 */
	public Integer getDictPid() {
		return dictPid;
	}

	/**
	 * @param dictPid
	 */
	public void setDictPid(Integer dictPid) {
		this.dictPid = dictPid;
	}
}