package com.skip.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skip.www.dto.User;
import com.skip.www.service.face.UserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired UserService userService;
	
	@GetMapping("/user/login")
	public void login() {
		logger.info("/user/login [GET]");
	}
	
	@PostMapping("/user/login")
	public String loginProcess(User user, HttpSession session) {
		logger.info("/user/login [POST]");
		logger.info("{}", user);
		
		//로그인 인증
		boolean loginResult = userService.login(user);
		
		if( loginResult ) {
			logger.info("로그인 성공");
			
			session.setAttribute("login", loginResult);
			
			return "redirect:/";
			
		} else {
			logger.info("로그인 실패");
			
			session.invalidate();
			
			return "redirect:/user/login";
		}
		
	}
}
