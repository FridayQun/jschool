package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_user_collection")
public class JkUserCollection {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 收藏类型
	 */
	private Integer type;

	/**
	 * 对应类型的收藏品ID，用户关联查询
	 */
	private Integer fid;

	/**
	 * 用户id
	 */
	private Integer uid;

	@Column(name = "collection_pic_path")
	private String collectionPicPath;

	/**
	 * 收藏描述
	 */
	@Column(name = "collection_desc")
	private String collectionDesc;

	@Column(name = "extra_int")
	private Integer extraInt;

	@Column(name = "extra_double")
	private Double extraDouble;

	@Column(name = "extra_str")
	private String extraStr;

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
	 * 获取收藏类型
	 *
	 * @return type - 收藏类型
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * 设置收藏类型
	 *
	 * @param type
	 *            收藏类型
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * 获取对应类型的收藏品ID，用户关联查询
	 *
	 * @return fid - 对应类型的收藏品ID，用户关联查询
	 */
	public Integer getFid() {
		return fid;
	}

	/**
	 * 设置对应类型的收藏品ID，用户关联查询
	 *
	 * @param fid
	 *            对应类型的收藏品ID，用户关联查询
	 */
	public void setFid(Integer fid) {
		this.fid = fid;
	}

	/**
	 * 获取用户id
	 *
	 * @return uid - 用户id
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * 设置用户id
	 *
	 * @param uid
	 *            用户id
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * @return collection_pic_path
	 */
	public String getCollectionPicPath() {
		return collectionPicPath;
	}

	/**
	 * @param collectionPicPath
	 */
	public void setCollectionPicPath(String collectionPicPath) {
		this.collectionPicPath = collectionPicPath;
	}

	/**
	 * 获取收藏描述
	 *
	 * @return collection_desc - 收藏描述
	 */
	public String getCollectionDesc() {
		return collectionDesc;
	}

	/**
	 * 设置收藏描述
	 *
	 * @param collectionDesc
	 *            收藏描述
	 */
	public void setCollectionDesc(String collectionDesc) {
		this.collectionDesc = collectionDesc;
	}

	/**
	 * @return extra_int
	 */
	public Integer getExtraInt() {
		return extraInt;
	}

	/**
	 * @param extraInt
	 */
	public void setExtraInt(Integer extraInt) {
		this.extraInt = extraInt;
	}

	/**
	 * @return extra_double
	 */
	public Double getExtraDouble() {
		return extraDouble;
	}

	/**
	 * @param extraDouble
	 */
	public void setExtraDouble(Double extraDouble) {
		this.extraDouble = extraDouble;
	}

	/**
	 * @return extra_str
	 */
	public String getExtraStr() {
		return extraStr;
	}

	/**
	 * @param extraStr
	 */
	public void setExtraStr(String extraStr) {
		this.extraStr = extraStr;
	}
}