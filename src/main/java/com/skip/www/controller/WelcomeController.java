package com.skip.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(WelcomeController.class);

	@RequestMapping("/user/main")
	public String welcome() {
		
		return "user/main";
	}
	
}
