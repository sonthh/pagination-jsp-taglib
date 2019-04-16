package com.itsontran.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itsontran.constant.Defines;
import com.itsontran.entity.Category;
import com.itsontran.repository.CategoryRepository;

@Controller
@RequestMapping("admin/category")
public class CategoryController {
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@ModelAttribute
	public void commonOjbect(ModelMap modelMap) {
		modelMap.addAttribute("categoryLinkActive", true);
	}
	
	@GetMapping("")
	public String index(@RequestParam(name = "page", required = false) Integer page, ModelMap modelMap) {
		int numberOfItems = (int) categoryRepository.countTotalItem();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/category?page=1";
		} else if (page > numberOfPages) {
			return "redirect:/category?page=" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		
		List<Category> categories = categoryRepository.findPagination(offset);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("numberOfPages", numberOfPages);
		modelMap.addAttribute("numberOfItems", numberOfItems);
		modelMap.addAttribute("categories", categories);
		return "admin/category/index";
	}
	
	
}
