package com.chengan.business.repo.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "jk_sys_mesg")
public class JkSysMesg {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 发送内容
	 */
	private String content;

	/**
	 * 发送id
	 */
	@Column(name = "from_id")
	private Integer fromId;

	/**
	 * 目的ID
	 */
	@Column(name = "to_id")
	private Integer toId;

	/**
	 * 消息类型
	 */
	private String type;

	/**
	 * 发送时间
	 */
	@Column(name = "send_time")
	private Date sendTime;

	/**
	 * 公告标题
	 */
	@Column(name = "title")
	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "istop")
	private Integer istop;

	@Column(name = "isread")
	private Integer isread;

	public Integer getIsread() {
		return isread;
	}

	public void setIsread(Integer isread) {
		this.isread = isread;
	}

	public Integer getIstop() {
		return istop;
	}

	public void setIstop(Integer istop) {
		this.istop = istop;
	}

	/**
	 * 三方发送ID说明
	 */
	private String sid;

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
	 * 获取发送内容
	 *
	 * @return content - 发送内容
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置发送内容
	 *
	 * @param content
	 *            发送内容
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 获取发送id
	 *
	 * @return from_id - 发送id
	 */
	public Integer getFromId() {
		return fromId;
	}

	/**
	 * 设置发送id
	 *
	 * @param fromId
	 *            发送id
	 */
	public void setFromId(Integer fromId) {
		this.fromId = fromId;
	}

	/**
	 * 获取目的ID
	 *
	 * @return to_id - 目的ID
	 */
	public Integer getToId() {
		return toId;
	}

	/**
	 * 设置目的ID
	 *
	 * @param toId
	 *            目的ID
	 */
	public void setToId(Integer toId) {
		this.toId = toId;
	}

	/**
	 * 获取消息类型
	 *
	 * @return type - 消息类型
	 */
	public String getType() {
		return type;
	}

	/**
	 * 设置消息类型
	 *
	 * @param type
	 *            消息类型
	 */
	public void setType(String type) {
		this.type = type;
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
	 * 获取三方发送ID说明
	 *
	 * @return sid - 三方发送ID说明
	 */
	public String getSid() {
		return sid;
	}

	/**
	 * 设置三方发送ID说明
	 *
	 * @param sid
	 *            三方发送ID说明
	 */
	public void setSid(String sid) {
		this.sid = sid;
	}
}