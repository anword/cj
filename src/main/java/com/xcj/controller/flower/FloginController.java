package com.xcj.controller.flower;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FloginController {
	
	@RequestMapping("/flower/home")
	public String signin() {
		return "thymeleaf/flower/homev1";
	}
	
	@RequestMapping("/flower/shop")
	public String shop() {
		return "thymeleaf/flower/shop-left-sidebar";
	}
	
	@RequestMapping("/flower/about")
	public String about() {
		return "thymeleaf/flower/about";
	}
	
	@RequestMapping("/flower/blog")
	public String blog() {
		return "thymeleaf/flower/blog-no-sidebar";
	}
	@RequestMapping("/flower/contact")
	public String contact() {
		return "thymeleaf/flower/contact";
	}
}
