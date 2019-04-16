package com.itsontran.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsontran.constant.Defines;
import com.itsontran.entity.Category;

@Repository
@Transactional
public class CategoryRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	public long countTotalItem() {
		Session session = sessionFactory.getCurrentSession();
		return (Long) session.createQuery("SELECT COUNT(id) FROM Category").uniqueResult();
	}

	public List<Category> findPagination(int offset) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Category", Category.class)
				.setFirstResult(offset).setMaxResults(Defines.ROW_COUNT)
				.getResultList();
	}

	
	
}
