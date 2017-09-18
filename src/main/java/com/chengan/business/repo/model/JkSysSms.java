package com.chengan.business.repo.model;

import java.util.Date;

import javax.persistence.*;

@Table(name = "jk_sys_sms")
public class JkSysSms {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private Integer type;

	/**
	 * 短信内容
	 */
	private String content;

	/**
	 * 值
	 */
	private String value;

	/**
	 * 状态
	 */
	private Integer status;

	/**
	 * 发送时间
	 */
	@Column(name = "send_time")
	private Date sendTime;

	/**
	 * 第三方短信ID
	 */
	private String sid;
	/**
	 * 手机号码
	 */
	private String phone;

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
	 * 获取短信内容
	 *
	 * @return content - 短信内容
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置短信内容
	 *
	 * @param content
	 *            短信内容
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 获取值
	 *
	 * @return value - 值
	 */
	public String getValue() {
		return value;
	}

	/**
	 * 设置值
	 *
	 * @param value
	 *            值
	 */
	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * 获取状态
	 *
	 * @return status - 状态
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * 设置状态
	 *
	 * @param status
	 *            状态
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 获取发送时间
	 *
	 * @return send_time - 发送时间
	 */
	public Date getSendTime() {
		return sendTime;
	}

	/**
	 * 设置发送时间
	 *
	 * @param sendTime
	 *            发送时间
	 */
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	/**
	 * 获取第三方短信ID
	 *
	 * @return sid - 第三方短信ID
	 */
	public String getSid() {
		return sid;
	}

	/**
	 * 设置第三方短信ID
	 *
	 * @param sid
	 *            第三方短信ID
	 */
	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}