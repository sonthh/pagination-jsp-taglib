package com.itsontran.model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsontran.constant.Defines;
import com.itsontran.model.bean.User;

@Repository
@Transactional
public class UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public int add(User user) {
		Session session = sessionFactory.getCurrentSession();
		return (int) session.save(user);
	}
	
	public long countTotalItem() {
		Session session = sessionFactory.getCurrentSession();
		return (Long) session.createQuery("SELECT COUNT(id) FROM user").uniqueResult();
	}
	
	public long countTotalItemSearch(String q) {
		Session session = sessionFactory.getCurrentSession();
		return (Long) session.createQuery("SELECT COUNT(id) FROM user WHERE username LIKE :q")
				.setParameter("q", "%" + q + "%")
				.uniqueResult();
	}

	public List<User> findItemsPagination(int position) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM user", User.class)
				.setFirstResult(position).setMaxResults(Defines.ROW_COUNT)
				.getResultList();
	}
	
	public List<User> findItemsPaginationSearch(int position, String q) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM user WHERE username LIKE :q", User.class)
				.setParameter("q", "%" + q + "%")
				.setFirstResult(position).setMaxResults(Defines.ROW_COUNT)
				.getResultList();
	}
	
	public User findItemById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(User.class, id);
	}

	public void edit(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.update(user);
	}
	
	public int deleteItemById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("DELETE FROM user WHERE id = :id")
			.setParameter("id", id).executeUpdate();
	}

	

	
	
}
