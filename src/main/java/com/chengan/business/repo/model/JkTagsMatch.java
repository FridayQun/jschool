package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_tags_match")
public class JkTagsMatch {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 标签ID
	 */
	private Integer tid;

	/**
	 * 关联类型的对象ID
	 */
	private Integer fid;

	/**
	 * 1、用户 2、项目
	 */
	private Integer type;

	@Column(name = "jk_tag_matchcol")
	private String jkTagMatchcol;

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
	 * 获取标签ID
	 *
	 * @return tid - 标签ID
	 */
	public Integer getTid() {
		return tid;
	}

	/**
	 * 设置标签ID
	 *
	 * @param tid
	 *            标签ID
	 */
	public void setTid(Integer tid) {
		this.tid = tid;
	}

	/**
	 * 获取关联类型的对象ID
	 *
	 * @return fid - 关联类型的对象ID
	 */
	public Integer getFid() {
		return fid;
	}

	/**
	 * 设置关联类型的对象ID
	 *
	 * @param fid
	 *            关联类型的对象ID
	 */
	public void setFid(Integer fid) {
		this.fid = fid;
	}

	/**
	 * 获取1、用户 2、项目
	 *
	 * @return type - 1、用户 2、项目
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * 设置1、用户 2、项目
	 *
	 * @param type
	 *            1、用户 2、项目
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * @return jk_tag_matchcol
	 */
	public String getJkTagMatchcol() {
		return jkTagMatchcol;
	}

	/**
	 * @param jkTagMatchcol
	 */
	public void setJkTagMatchcol(String jkTagMatchcol) {
		this.jkTagMatchcol = jkTagMatchcol;
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
}