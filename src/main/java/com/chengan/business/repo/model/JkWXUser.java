package com.chengan.business.repo.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "jk_wx_user")
public class JkWXUser {

	/**
	 * 微信登录id
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 微信昵称
	 */
	@Column(name = "wx_nikcname")
	private String WXnickName;

	/**
	 * 微信用户性别
	 */
	private Integer sex;

	/**
	 * 微信openid
	 */
	@Column(name = "wx_openid")
	private String wxopenid;

	/**
	 * 微信用户地理位置
	 */
	private String location;

	/**
	 * 微信用户电话
	 */
	private String phone;

	/**
	 * 微信用户头像路径
	 */
	@Column(name = "head_pic_path")
	private String headPicPath;

	/**
	 * 获取微信用户id
	 * 
	 * @return id - 返回用户id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 设置微信用户id
	 * 
	 * @param id-
	 *            用户id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 获取微信用户昵称
	 * 
	 * @return WXnickName - 返回微信用户昵称
	 */
	public String getWXnickName() {
		return WXnickName;
	}

	/**
	 * 设置微信用户昵称
	 * 
	 * @param wXnickName
	 *            -微信用户昵称
	 */
	public void setWXnickName(String wXnickName) {
		WXnickName = wXnickName;
	}

	/**
	 * 获取微信用户性别
	 * 
	 * @return sex - 返回性别 0未知 1为男 2为女
	 */
	public Integer getSex() {
		return sex;
	}

	/**
	 * 设置微信用户性别
	 * 
	 * @param sex
	 *            -微信用户性别
	 */
	public void setSex(Integer sex) {
		this.sex = sex;
	}

	/**
	 * 获取微信openid
	 * 
	 * @return wxopenid -返回微信wxopenid
	 */
	public String getOpenid() {
		return wxopenid;
	}

	/**
	 * 设置微信openid
	 * 
	 * @param wxopenid
	 *            -微信wxopenid
	 */
	public void setOpenid(String wxopenid) {
		this.wxopenid = wxopenid;
	}

	/**
	 * 获取微信用户地理位置
	 * 
	 * @return location-返回微信用户地理位置
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * 设置微信用户地理位置
	 * 
	 * @param location
	 *            -微信用户地理位置
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * 获取微信用户手机号码
	 * 
	 * @return phone -返回微信用户手机号码
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * 设置微信用户手机号码
	 * 
	 * @param phone
	 *            -微信用户手机号码
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * 获取微信用户的头像路径
	 * 
	 * @return headPicPath -返回微信用户头像路径
	 */
	public String getHeadPicPath() {
		return headPicPath;
	}

	/**
	 * 设置微信用户头像路径
	 * 
	 * @param headPicPath
	 *            - 微信用户头像路径
	 */
	public void setHeadPicPath(String headPicPath) {
		this.headPicPath = headPicPath;
	}
}
