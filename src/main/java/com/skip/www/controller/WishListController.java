package com.skip.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skip.www.dto.User;
import com.skip.www.dto.Wish;
import com.skip.www.service.face.WishListService;

@Controller
public class WishListController {

	private static final Logger logger = LoggerFactory.getLogger(WishListController.class);
	
	@Autowired WishListService wishListService;
	
	// 로그인한 회원의 위시리스트 목록 조회
	@GetMapping("/wish/list")
	public void list(HttpSession session, Model model) {
		logger.info("/wish/list");
		
		User userNo = new User();
		
		if( session.getAttribute("userNo") != null ) {
			userNo.setUserNo((Integer)session.getAttribute("userNo"));
		}
		
		logger.info("/userno:{}", userNo);
		
		
		//게시글 목록 조회
		List<Wish> wishList = wishListService.list(userNo);
		for(Wish w : wishList) {
			logger.info("{}", w);
		}
		
		model.addAttribute("wishList", wishList);
	}
	
	// 로그인한 회원의 위시리스트 갯수 조회
	@GetMapping("/wish/count")
	@ResponseBody
	public int countWish(HttpSession session) {
		User userNo = new User();
		
		if( session.getAttribute("userNo") != null ) {
			userNo.setUserNo((Integer)session.getAttribute("userNo"));
		}
		
		return wishListService.countWish(userNo);
	}
	
	// 위시리스트의 위시 삭제
	@GetMapping("/wish/delete")
	public String delete(Wish wishNo) {
		wishListService.delete(wishNo);
		
		return "redirect:/";
	}
}
