package com.itsontran.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("auth")
public class AuthController {
	
	@GetMapping("login")
	private String login() {
		return "auth/login";
	}
	
	@GetMapping("register")
	private String register() {
		return "auth/register";
	}
	
	@GetMapping("forgot-password")
	private String forgotPassword() {
		return "auth/forgot-password";
	}
}
