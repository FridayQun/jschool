package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_tags")
public class JkTags {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 标签名称
	 */
	@Column(name = "tag_name")
	private String tagName;

	/**
	 * 标签属性值
	 */
	@Column(name = "tag_score")
	private Integer tagScore;

	/**
	 * 标签维度
	 */
	@Column(name = "tag_dimension")
	private Integer tagDimension;

	/**
	 * 标签描述
	 */
	@Column(name = "tag_desc")
	private String tagDesc;

	@Column(name = "tag_type")
	private Integer tagType;

	public Integer getTagType() {
		return tagType;
	}

	public void setTagType(Integer tagType) {
		this.tagType = tagType;
	}

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
	 * 获取标签名称
	 *
	 * @return tag_name - 标签名称
	 */
	public String getTagName() {
		return tagName;
	}

	/**
	 * 设置标签名称
	 *
	 * @param tagName
	 *            标签名称
	 */
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	/**
	 * 获取标签属性值
	 *
	 * @return tag_score - 标签属性值
	 */
	public Integer getTagScore() {
		return tagScore;
	}

	/**
	 * 设置标签属性值
	 *
	 * @param tagScore
	 *            标签属性值
	 */
	public void setTagScore(Integer tagScore) {
		this.tagScore = tagScore;
	}

	/**
	 * 获取标签维度
	 *
	 * @return tag_dimension - 标签维度
	 */
	public Integer getTagDimension() {
		return tagDimension;
	}

	/**
	 * 设置标签维度
	 *
	 * @param tagDimension
	 *            标签维度
	 */
	public void setTagDimension(Integer tagDimension) {
		this.tagDimension = tagDimension;
	}

	/**
	 * 获取标签描述
	 *
	 * @return tag_desc - 标签描述
	 */
	public String getTagDesc() {
		return tagDesc;
	}

	/**
	 * 设置标签描述
	 *
	 * @param tagDesc
	 *            标签描述
	 */
	public void setTagDesc(String tagDesc) {
		this.tagDesc = tagDesc;
	}
	
	/**
	 * 父标签的值，这是二次开发新增的东西
	 */
	@Column(name = "parentId")
	private Integer parentId;

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
}