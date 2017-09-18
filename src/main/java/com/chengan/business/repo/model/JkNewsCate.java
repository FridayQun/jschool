package com.chengan.business.repo.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "jk_news_cate")
public class JkNewsCate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 名字
	 */
	@Column(name = "cate_name")
	private String cateName;

	/**
	 * 类目图片地址
	 */
	@Column(name = "cate_pic_path")
	private String catePicPath;

	/**
	 * 类目图片地址
	 */
	@Column(name = "isrecomment")
	private Integer isRecomment;

	/**
	 * 类目图片地址
	 */
	@Column(name = "cate_desc")
	private String cateDesc;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCatePicPath() {
		return catePicPath;
	}

	public void setCatePicPath(String catePicPath) {
		this.catePicPath = catePicPath;
	}

	public Integer getIsRecomment() {
		return isRecomment;
	}

	public void setIsRecomment(Integer isRecomment) {
		this.isRecomment = isRecomment;
	}

	public String getCateDesc() {
		return cateDesc;
	}

	public void setCateDesc(String cateDesc) {
		this.cateDesc = cateDesc;
	}
}