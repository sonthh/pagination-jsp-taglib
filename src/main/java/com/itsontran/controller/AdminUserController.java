package com.itsontran.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itsontran.constant.Defines;
import com.itsontran.constant.MessageEnum;
import com.itsontran.model.bean.Role;
import com.itsontran.model.bean.User;
import com.itsontran.model.dao.RoleDAO;
import com.itsontran.model.dao.UserDAO;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {
	
	@Autowired
	private RoleDAO roleDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping("")
	public String index(@RequestParam(name = "page", required = false) Integer page, ModelMap modelMap) {
		int numberOfItems = (int) userDAO.countTotalItem();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/user?page=1";
		} else if (page > numberOfPages) {
			return "redirect:/admin/user?page=" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		
		List<User> users = userDAO.findItemsPagination(offset);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("numberOfPages", numberOfPages);
		modelMap.addAttribute("numberOfItems", numberOfItems);
		modelMap.addAttribute("users", users);
		return "admin.user.index";
	}
	
	@GetMapping("search")
	public String index(@RequestParam("q") String q, @RequestParam(name = "page", required = false) Integer page, ModelMap modelMap) {
		int numberOfItems = (int) userDAO.countTotalItemSearch(q);
		int numberOfPages = (int) Math.ceil((float) numberOfItems / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/user/search?q=" + q + "page=1";
		} else if (page > numberOfPages) {
			return "redirect:/admin/user/search?q=" + q + "page=" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		
		List<User> users = userDAO.findItemsPaginationSearch(offset, q);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("numberOfPages", numberOfPages);
		modelMap.addAttribute("numberOfItems", numberOfItems);
		modelMap.addAttribute("users", users);
		return "admin.user.search";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("roles", roleDAO.findAllItems());
		return "admin.user.add";
	}
	
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("user") User user, BindingResult errors,
			ModelMap modelMap, RedirectAttributes ra,
			@RequestParam("repassword") String repassword, 
			@RequestParam(name = "r", required = false) List<Integer> roleIds) {
		
		/* START VALIDATE */
		if (roleIds == null) {
			errors.rejectValue("roles", "NullList.user.roles");
		}
		if (user.getPassword().trim().equals("")) {
			errors.rejectValue("password", "NotBlank.user.password");
		}
		if (!user.getPassword().equals(repassword)) {
			errors.rejectValue("password", "RePassword.user.password");
		}
		if (errors.hasErrors()) {
			modelMap.addAttribute("roles", roleDAO.findAllItems());
			return "admin.user.add";
		}
		/* END VALIDATE */
		
		List<Role> roles = roleDAO.findItemsByIds(roleIds);
		user.setRoles(roles);
		if (userDAO.add(user) > 0) {
			ra.addFlashAttribute("message", MessageEnum.MSG_ADD_SUCCESS);
		} else {
			ra.addFlashAttribute("message", MessageEnum.MSG_ERROR);
		}
		
		return "redirect:/admin/user";
	}
	
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") Integer id, @RequestParam("page") Integer page,
			ModelMap modelMap) {
		User user = userDAO.findItemById(id);
		modelMap.addAttribute("user", user);
		modelMap.addAttribute("roles", roleDAO.findAllItems());
		return "admin.user.edit";
	}
	
	@PostMapping("edit/{id}")
	public String edit(@Valid @ModelAttribute("user") User user, BindingResult errors,
			@RequestParam("page") Integer page, @PathVariable("id") Integer id,
			ModelMap modelMap, RedirectAttributes ra,
			@RequestParam("repassword") String repassword, 
			@RequestParam(name = "r", required = false) List<Integer> roleIds) {
		//System.out.println(user);
		/* START VALIDATE */
		if (roleIds == null) {
			errors.rejectValue("roles", "NullList.user.roles");
		}
		if (!user.getPassword().trim().equals("") && !user.getPassword().equals(repassword)) {
			errors.rejectValue("password", "RePassword.user.password");
		}
		if (errors.hasErrors()) {
			modelMap.addAttribute("roles", roleDAO.findAllItems());
			return "admin.user.edit";
		}
		/* END VALIDATE */
		
		//NẾU KHÔNG SỬA PASSWORD THÌ LẤY LẠI PASSWORD CŨ
		User oldUser = userDAO.findItemById(id);
		if (user.getPassword().trim().equals("")) {
			user.setPassword(oldUser.getPassword());
		}
		
		List<Role> roles = roleDAO.findItemsByIds(roleIds);
		user.setRoles(roles);
		
		userDAO.edit(user);
		ra.addFlashAttribute("message", MessageEnum.MSG_UPDATE_SUCCESS);
		return "redirect:/admin/user?page=" + page;
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Integer id, 
			@RequestParam("page") Integer page, RedirectAttributes ra) {
		if (userDAO.deleteItemById(id) > 0) {
			ra.addFlashAttribute("message", MessageEnum.MSG_DELETE_SUCCESS);
		} else {
			ra.addFlashAttribute("message", MessageEnum.MSG_ERROR);
		}
		return "redirect:/admin/user?page=" + page;
	}
}
