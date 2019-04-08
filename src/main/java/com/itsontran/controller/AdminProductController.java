package com.itsontran.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itsontran.constant.MessageEnum;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {
	
	@GetMapping("index")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("message", MessageEnum.MSG_ADD_SUCCESS);
		return "admin.product.index";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		return "admin.product.add";
	}
	
	@GetMapping("edit")
	public String edit() {
		return "admin.product.edit";
	}
	
}
