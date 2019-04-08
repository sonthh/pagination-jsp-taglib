package com.itsontran.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.itsontran.service.CategoryService;
import com.itsontran.service.JavaMailService;

@Controller
public class PublicIndexController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private JavaMailService mailService;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("categoryService", categoryService);
		for (int i = 0; i < 100; i++) {
			mailService.sendMail("lehoanghuy1009@gmail.com", "mi ăn hết " + (i + 1) + " cục cức");
			System.out.println((i + 1) + "mail send!");
		}
		return "public/index";
	}

}
