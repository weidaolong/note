package com.facedops.note.repository;

import org.hibernate.Session;
import org.hibernate.jpa.HibernateEntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDao {
	private final HibernateEntityManager em;

	public Session getSession() {
		return em.getSession();
	}

	@Autowired
	public CommonDao(HibernateEntityManager em) {
		this.em = em;
	}
}
