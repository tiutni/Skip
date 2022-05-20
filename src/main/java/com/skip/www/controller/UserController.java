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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skip.www.dto.User;
import com.skip.www.service.face.UserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired UserService userService;
	User user = new User();
	
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
		logger.info("/user/kakaoLogin [GET]");
		
		System.out.println("Code:" + code);
		
		String accessToken = userService.getAccessToken(code);
		System.out.println("accessToken : " + accessToken);
		
		HashMap<String, Object> userInfo = userService.getUserInfo(accessToken);
		System.out.println("userInfo : " + userInfo);
		
		// 카카오 사용자 ID 중복 확인
		boolean idDoubleCheck = userService.kakaoIdCheck(userInfo);
		
		if (idDoubleCheck) {
			logger.info("카카오 회원가입");
			
			String tmpPw = UUID.randomUUID().toString().replace("-", "");
			tmpPw = tmpPw.substring(0, 10);
			
			session.setAttribute("userId", userInfo.get("userEmail"));
			session.setAttribute("userPw", tmpPw);
			
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
		
		// 회원가입 결과
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
	
	
	// 회원가입 ID 중복 체크 (AJAX)
	@GetMapping("/user/join/userIdCheck")
	@ResponseBody
	public int idCheck(@RequestParam(value = "userId") String userId) {
		user.setUserId(userId);
		
		return userService.checkId(user);
	}
	
	// 회원가입 닉네임 중복 체크 (AJAX)
	@GetMapping("/user/join/userNickCheck")
	@ResponseBody
	public int nickCheck(@RequestParam(value = "userNick") String userNick) {
		user.setUserNick(userNick);
		
		return userService.checkNick(user);
	}
	
	// 회원가입 이메일 중복 체크 (AJAX)
	@GetMapping("/user/join/userEmailCheck")
	@ResponseBody
	public int eamilCheck(@RequestParam(value = "userEmail") String userEmail) {
		user.setUserEmail(userEmail);
		
		return userService.checkEmail(user);
	}
		
	// 회원가입 주민등록번호 중복 체크 (AJAX)
	@GetMapping("/user/join/userRrnCheck")
	@ResponseBody
	public int rrnCheck(@RequestParam(value = "userRrn") String userRrn) {
		user.setUserRrn(userRrn);
		
		return userService.checkRrn(user);
	}
	
	// 회원가입 휴대폰 번호 중복 체크 (AJAX)
	@GetMapping("/user/join/userPhoneCheck")
	@ResponseBody
	public int phoneCheck(@RequestParam(value = "userPhone") String userPhone) {
		user.setUserPhone(userPhone);
		
		return userService.checkPhone(user);
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
	
	// 아이디 찾기
	@GetMapping(value = "/user/findId")
	public void findId() {
		logger.info("/user/findId [GET]");
	}
	
	// 아이디 찾기 Process
	@PostMapping(value = "/user/findId")
	public String findIdProcess(User user, RedirectAttributes redirectAttributes) {
		logger.info("/user/findId [POST]");

		// 가입된 ID 인증
		boolean idCheck = userService.idCheck(user);
		
		if (idCheck) {
			logger.info("가입된 사용자입니다");
			redirectAttributes.addAttribute("userId", userService.findId(user));
		} else {
			logger.info("가입되지 않은 사용자입니다");
		}
		return "redirect:/user/findIdResult";
	}
	
	// 아이디 찾기 결과
	@GetMapping(value = "user/findIdResult")
	public void findIdResult(@RequestParam(value = "userId", required = false) String userId, Model model) {
		logger.info("user/findIdResult [GET]");
		
		model.addAttribute("userId", userId);
	}
	
	// 비밀번호 찾기(임시비밀번호 생성)
	@GetMapping(value = "/user/findPw")
	public void findPw() {
		logger.info("비밀번호 찾기 [GET]");
	}
	
	// 비밀번호 찾기(임시비밀번호) 이메일 발송 Process
	@PostMapping(value = "/user/findPw")
	public String findPwProcess(User user) {
		
		userService.findPw(user);
		userService.sendPwByEmail(user);
		
		return "redirect:/user/findPwResult";
	}
	
	// 비밀번호 찾기 결과
	@GetMapping(value = "user/findPwResult")
	public void findPwResult() {
		logger.info("/user/findPwResult [GET]");
	}
}
