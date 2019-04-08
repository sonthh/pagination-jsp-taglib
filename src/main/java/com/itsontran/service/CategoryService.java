package com.itsontran.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itsontran.model.bean.Category;
import com.itsontran.model.dao.CategoryDAO;

@Service
public class CategoryService {

	@Autowired
	private CategoryDAO categoryDAO;

	/* TẠO RA MENU CON PARENTID LÀ MENU CHA */
	private void createChildMenu(int parentId, JspWriter out, HttpServletRequest request) {
		List<Category> listCategories = categoryDAO.findItemsByParentId(parentId);
		try {
			if (listCategories.size() > 0) {
				out.println("<ul>");
				for (Category category : listCategories) {
					out.println("<li>");
					out.println("<a>" + category.getName() + "</a>");
					createChildMenu(category.getId(), out, request);
				}
				out.println("</ul>");
			} else {
				out.println("</li>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* create full menu */
	public void createMenu(JspWriter out, HttpServletRequest request) {
		/* TÌM TẤT CẢ MENU CẤP 0 TỨC LÀ PARENT ID = 0 */
		List<Category> listCategories = categoryDAO.findItemsByParentId(0);
		try {
			out.println("<ul>");
			for (Category category : listCategories) {
				out.println("<li>");
				out.println("<a>" + category.getName() + "</a>");
				/*
				 * TẠO RA NHỮNG MENU CON TRONG CÁI MENU CẤP 0 NÀY RỒI QUA CREATECHILDMENU ĐỆ QUI
				 */
				createChildMenu(category.getId(), out, request);
			}
			out.println("</ul>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/* TẠO RA MENU CON PARENTID LÀ MENU CHA */
	private void createChildOption(int parentId, JspWriter out, int level, int idSelected, int idDisable) {
		List<Category> listCategories = categoryDAO.findItemsByParentId(parentId);
		try {
			if (listCategories.size() > 0) {
				
				for (Category category : listCategories) {
					String style = "class='level-" + level +  "'";
					if (idSelected == category.getId())
						out.println("<option " + style + " selected value=" + category.getId() + ">");
					else if (idDisable == category.getId()) {
						out.println("<option " + style + " disabled value=" + category.getId() + ">");
						for (int i = 0; i < level; i++) {
							out.print("&nbsp;&nbsp;&nbsp;");
						}
						out.println(category.getName());
						out.print("</option>");
						continue;
					} else
						out.println("<option " + style + " value=" + category.getId() + ">");
					for (int i = 0; i < level; i++) {
						out.print("&nbsp;&nbsp;&nbsp;");
					}
					out.println(category.getName());
					out.print("</option>");
					createChildOption(category.getId(), out, level + 1, idSelected, idDisable);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* CREATE FULL MENU */
	public void createOption(JspWriter out, int idSelected, int idDisable) {
		/* TÌM TẤT CẢ MENU CẤP 0 TỨC LÀ PARENT ID = 0 */
		List<Category> listCategories = categoryDAO.findItemsByParentId(0);
		try {

			for (Category category : listCategories) {
				if (idSelected == category.getId())
					out.println("<option class='level-1' selected value=" + category.getId() + ">");
				else if (idDisable == category.getId())
					out.println("<option class='level-1' disabled value=" + category.getId() + ">");
				else
					out.println("<option class='level-1' value=" + category.getId() + ">");
				out.println(category.getName());
				out.print("</option>");
				/*
				 * TẠO RA NHỮNG MENU CON TRONG CÁI MENU CẤP 0 NÀY RỒI QUA CREATECHILDMENU ĐỆ QUI
				 */
				createChildOption(category.getId(), out, 2, idSelected, idDisable);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
