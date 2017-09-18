package com.chengan.business.base;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class HibernateEntity {

	protected Integer id;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
