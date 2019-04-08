package com.itsontran.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itsontran.model.bean.Category;

@Repository
public class CategoryDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final String FIND_ITEMS_BY_PARENT_ID = "SELECT * FROM categories WHERE parentId = ? ORDER BY sort ASC";

	public List<Category> findItemsByParentId(int parentId) {
		return jdbcTemplate.query(FIND_ITEMS_BY_PARENT_ID,
				new Object[] { parentId },
				new BeanPropertyRowMapper<Category>(Category.class));
	}
	
}
