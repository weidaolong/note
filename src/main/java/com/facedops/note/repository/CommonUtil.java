package com.facedops.note.repository;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonUtil {
	private EntityManager em;

	public Session getSession() {
		return em.unwrap(Session.class);
	}

	@Autowired
	public CommonUtil(EntityManager em) {
		this.em = em;
	}
}
