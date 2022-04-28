package com.skip.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skip.www.dto.User;
import com.skip.www.service.face.UserService;


@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired UserService userService;
	
	// 로그인
	@GetMapping("/user/login")
	public void login() {
		logger.info("/user/login [GET]");
	}
	
	// 로그인 Process
	@PostMapping("/user/login")
	public String loginProcess(User user, HttpSession session) {
		logger.info("/user/login [POST]");
		logger.info("{}", user);
		
		// 로그인 인증
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
	
	// 로그아웃
	@GetMapping("user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원가입
	@GetMapping("user/join")
	public void join() {
		logger.info("user/join [GET]");
	}
	
	// 회원가입 Process
	@PostMapping("user/join")
	public String join(User user) {
		logger.info("user/join [POST]");
		logger.info("{}", user);
		
		boolean joinResult = userService.join(user);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/";			
		} else {
			logger.info("회원가입 실패");
			return "redirect:/user/join";
		}
	}

	@GetMapping(value="/user/mypage")
	public void mypage(HttpSession session, Model model) {
		logger.info("/user/mypage");
		
		//Integer.parseInt( session.getAttribute("userno").toString());
		int userno=(Integer)session.getAttribute("userno");
		logger.info("/userno:{}",userno);
		
		User user =userService.viewUserInfo(userno);
		logger.info("조회결과{}",user );
		
		model.addAttribute("info", user);
	}

}
