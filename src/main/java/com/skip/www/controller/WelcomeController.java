package com.skip.www.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(WelcomeController.class);

//	@RequestMapping("/")
//	public String welcome() {
//		
//		return "user/main";
//	}
	
	@GetMapping("/")
	public String index(HttpServletRequest request) {
	    logger.debug("###INDEX PAGE###");
	    String rtnPage = "layout/index";
	    String ipAddress = request.getHeader("X-FORWARDED-FOR");
	    if (ipAddress == null) {
	        ipAddress = request.getRemoteAddr();
	    }
	    logger.info(ipAddress + " : " + rtnPage);
	    return rtnPage;
	}
	
}
