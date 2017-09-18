package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_project_cate")
public class JkProjectCate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 类目名称
	 */
	@Column(name = "cate_name")
	private String cateName;

	/**
	 * 类目属性值
	 */
	@Column(name = "cate_score")
	private Integer cateScore;

	/**
	 * 类目描述
	 */
	@Column(name = "cate_desc")
	private String cateDesc;

	/**
	 * 类目说明图
	 */
	@Column(name = "cate_pic_path")
	private String catePicPath;

	/**
	 * 父级类目ID
	 */
	@Column(name = "parent_id")
	private Integer parentId;

	/**
	 * 类目级别
	 */
	@Column(name = "cate_level")
	private Integer cateLevel;

	/**
	 * 类型图片
	 */
	@Column(name = "head_pic_path")
	private String headPicPath;

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
	 * 获取类目名称
	 *
	 * @return cate_name - 类目名称
	 */
	public String getCateName() {
		return cateName;
	}

	/**
	 * 设置类目名称
	 *
	 * @param cateName
	 *            类目名称
	 */
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	/**
	 * 获取类目属性值
	 *
	 * @return cate_score - 类目属性值
	 */
	public Integer getCateScore() {
		return cateScore;
	}

	/**
	 * 设置类目属性值
	 *
	 * @param cateScore
	 *            类目属性值
	 */
	public void setCateScore(Integer cateScore) {
		this.cateScore = cateScore;
	}

	/**
	 * 获取类目描述
	 *
	 * @return cate_desc - 类目描述
	 */
	public String getCateDesc() {
		return cateDesc;
	}

	/**
	 * 设置类目描述
	 *
	 * @param cateDesc
	 *            类目描述
	 */
	public void setCateDesc(String cateDesc) {
		this.cateDesc = cateDesc;
	}

	/**
	 * 获取类目说明图
	 *
	 * @return cate_pic_path - 类目说明图
	 */
	public String getCatePicPath() {
		return catePicPath;
	}

	/**
	 * 设置类目说明图
	 *
	 * @param catePicPath
	 *            类目说明图
	 */
	public void setCatePicPath(String catePicPath) {
		this.catePicPath = catePicPath;
	}

	/**
	 * 获取父级类目ID
	 *
	 * @return parent_id - 父级类目ID
	 */
	public Integer getParentId() {
		return parentId;
	}

	/**
	 * 设置父级类目ID
	 *
	 * @param parentId
	 *            父级类目ID
	 */
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	/**
	 * 获取类目级别
	 *
	 * @return cate_level - 类目级别
	 */
	public Integer getCateLevel() {
		return cateLevel;
	}

	/**
	 * 设置类目级别
	 *
	 * @param cateLevel
	 *            类目级别
	 */
	public void setCateLevel(Integer cateLevel) {
		this.cateLevel = cateLevel;
	}

	public String getHeadPicPath() {
		return headPicPath;
	}

	public void setHeadPicPath(String headPicPath) {
		this.headPicPath = headPicPath;
	}

}