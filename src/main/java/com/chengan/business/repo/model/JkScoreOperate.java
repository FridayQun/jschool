package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_score_operate")
public class JkScoreOperate {
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String operateName;
	private Integer operateScroe;
	private Integer num;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOperateName() {
		return operateName;
	}

	public void setOperateName(String operateName) {
		this.operateName = operateName;
	}

	public Integer getOperateScroe() {
		return operateScroe;
	}

	public void setOperateScroe(Integer operateScroe) {
		this.operateScroe = operateScroe;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}