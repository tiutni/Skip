package com.skip.www.controller;

import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
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
		
		// 로그인 인증
		boolean loginResult = userService.login(user);
		
		if(loginResult) {
			logger.info("로그인 성공");
			session.setAttribute("login", loginResult);
			session.setAttribute("userNo", userService.getUserNo(String.valueOf(user.getUserId())));
			session.setAttribute("userId", user.getUserId());
			
			return "redirect:/";
		} else {
			logger.info("로그인 실패");
			session.invalidate();
			
			return "redirect:/user/login";
		}
	}
	
	// 카카오 로그인
	@GetMapping("/user/kakaoLogin")
	public String kakaoLogin(@RequestParam(value = "code") String code, HttpSession session) {
		System.out.println("Code:" + code);
		
		String accessToken = userService.getAccessToken(code);
		System.out.println("accessToken : " + accessToken);
		
		HashMap<String, Object> userInfo = userService.getUserInfo(accessToken);
		System.out.println("userInfo : " + userInfo);
		
		boolean idDoubleCheck = userService.kakaoIdCheck(userInfo);
		
		if (idDoubleCheck) {
			logger.info("카카오 회원가입");
			session.setAttribute("userId", userInfo.get("userEmail"));
			session.setAttribute("userPw", UUID.randomUUID());
			
			return "redirect:/user/kakaoJoin";
		} else {
			logger.info("카카오 로그인");
			session.setAttribute("userNo", userService.getUserNo(String.valueOf(userInfo.get("userEmail"))));
			session.setAttribute("userId", userInfo.get("userEmail"));
			session.setAttribute("accessToken", accessToken);
			
			return "redirect:/";
		}		
	}
	
	// 로그아웃
	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 카카오 로그아웃
	@GetMapping("/user/kakaoLogout")
	public String kakaoLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원가입
	@GetMapping("/user/join")
	public void join() {
		logger.info("user/join [GET]");
	}
	
	// 회원가입 Process
	@PostMapping("/user/join")
	public String join(User user, HttpSession session) {
		logger.info("user/join [POST]");
		
		boolean joinResult = userService.join(user);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			session.invalidate();
			
			return "redirect:/";			
		} else {
			logger.info("회원가입 실패");
			session.invalidate();
			
			return "redirect:/user/join";
		}
	}
	
	// 카카오 회원가입
	@GetMapping("/user/kakaoJoin")
	public void kakaoJoin() {
		logger.info("user/kakaoJoin [GET]");
	}
	
	// 카카오 회원가입 Process
	@PostMapping("/user/kakaoJoin")
	public String kakaoJoin(User user, HttpSession session) {
		logger.info("user/kakaoJoin [POST]");
		logger.info("{}", user);
		
		boolean joinResult = userService.join(user);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			session.invalidate();
			
			return "redirect:/";			
		} else {
			logger.info("회원가입 실패");
			session.invalidate();
			
			return "redirect:/user/kakaoJoin";
		}
	}
	//회원의 공연,전시 등급 보여주기
	@GetMapping(value="/mypage/main")
	public void mypage(HttpSession session, Model model) {
		logger.info("/user/mypage");
		
		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("/userno:{}",userNo);
		


		//공연등급 보기
		ConUserLevel cul = userService.viewConLevel(userNo);
		logger.info("/ConUserLevelNo:{}",cul);

		
		//전시회 등급 보기
		ExUserLevel eul =userService.viewExLevel(userNo);
		logger.info("/ExUserLevelNo:{}",eul);

		
		logger.info("조회결과:{}",cul);
		logger.info("조회결과:{}",eul);
		
		model.addAttribute("cul", cul);
		model.addAttribute("eul", eul);
	}

	
	//회원 정보 수정
	@GetMapping(value="/userinfo/update")
	public String update(User user, Model model,HttpSession session) {
		logger.info("/userinfo/update-{}",user);
		
		
		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("/userno:{}",userNo);
		
		//회원정보 조회
		user=userService.viewUserInfo(userNo);
		logger.info("조회된 회원 정보{}", user);
		model.addAttribute("updateUser", user);
		logger.info("모델값{}",user);
		
		return "userinfo/update";
	}
	
	
	
	//회원 정보 수정
	@PostMapping(value="/userinfo/update")
	public String updateUserInfo(User updateUser) {
		logger.info("/userinfo/update[ POST]-{}",updateUser);
		
		userService.updateUserinfo(updateUser);
		
		
		return "userinfo/update";
	}

	//회원 탈퇴
	@GetMapping("/userinfo/delete")
	public void delete(HttpSession session , User user) {
		logger.info("/userinfo/delete[GET]");
		
		
		
	}
	
	@PostMapping("/userinfo/delete")
	public String deleteUserInfo(HttpSession session, User user) {
		logger.info("/userinfo/delete[POST]-{}",user);
		
		
		//비밀번호 검증
		
		int userNo =(int)session.getAttribute("userNo");
		logger.info("유저번호{}-",userNo);

		user.setUserNo(userNo);
		
		if( userService.deleteUserInfo(user) ) {
			return "redirect:/user/logout";
			
		}
		
		return "redirect:/userinfo/delete";
	}

	

	
}
