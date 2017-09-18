package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_user_address")
public class JkUserAddress {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 用户ID
	 */
	private Integer uid;

	/**
	 * 经度
	 */
	private Double longitude;

	/**
	 * 纬度
	 */
	private Double latitude;

	/**
	 * 收货地址
	 */
	private String location;

	/**
	 * 收货人姓名
	 */
	private String name;

	/**
	 * 收货人联系方式
	 */
	private String contract;

	/**
	 * 邮编
	 */
	@Column(name = "post_code")
	private String postCode;

	/**
	 * 状态，表示是否默认地址或者使用地址
	 */
	private Integer status;

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
	 * 获取用户ID
	 *
	 * @return uid - 用户ID
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * 设置用户ID
	 *
	 * @param uid
	 *            用户ID
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * 获取经度
	 *
	 * @return longitude - 经度
	 */
	public Double getLongitude() {
		return longitude;
	}

	/**
	 * 设置经度
	 *
	 * @param longitude
	 *            经度
	 */
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	/**
	 * 获取纬度
	 *
	 * @return latitude - 纬度
	 */
	public Double getLatitude() {
		return latitude;
	}

	/**
	 * 设置纬度
	 *
	 * @param latitude
	 *            纬度
	 */
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	/**
	 * 获取收货地址
	 *
	 * @return location - 收货地址
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * 设置收货地址
	 *
	 * @param location
	 *            收货地址
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * 获取收货人姓名
	 *
	 * @return name - 收货人姓名
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置收货人姓名
	 *
	 * @param name
	 *            收货人姓名
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取收货人联系方式
	 *
	 * @return contract - 收货人联系方式
	 */
	public String getContract() {
		return contract;
	}

	/**
	 * 设置收货人联系方式
	 *
	 * @param contract
	 *            收货人联系方式
	 */
	public void setContract(String contract) {
		this.contract = contract;
	}

	/**
	 * 获取邮编
	 *
	 * @return post_code - 邮编
	 */
	public String getPostCode() {
		return postCode;
	}

	/**
	 * 设置邮编
	 *
	 * @param postCode
	 *            邮编
	 */
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	/**
	 * 获取状态，表示是否默认地址或者使用地址
	 *
	 * @return status - 状态，表示是否默认地址或者使用地址
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * 设置状态，表示是否默认地址或者使用地址
	 *
	 * @param status
	 *            状态，表示是否默认地址或者使用地址
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
}