package com.itsontran.model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsontran.model.bean.Role;

@Repository
@Transactional
public class RoleDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Role> findAllItems() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM role", Role.class).getResultList();
	}
	
	public List<Role> findItemsByIds(List<Integer> roleIds) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM role WHERE id IN (:roleIds)", Role.class)
				.setParameterList("roleIds", roleIds)
				.getResultList();
	}
	
}
