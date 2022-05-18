package com.skip.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.skip.www.dto.ExOrderTicket;
import com.skip.www.service.face.MyexorderService;
import com.skip.www.util.Paging;

@Controller
public class MyexorderController {

	private static final Logger logger = LoggerFactory.getLogger(MyexorderController.class);

	@Autowired MyexorderService myexorderService;


	

	//공연 주문 조회
	@GetMapping(value="/mypage/myexorder")
	public void conlist(HttpSession session, String curPage, Model model) {
		logger.info("/mypage/myexorder");

		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("/userno:{}",userNo);


		//페이징 계산 - curPage값과 userNo을 받아 페이징 객체 생성
		//serviceimple return paging의 값이 paging으로 반환된다.
		Paging paging = myexorderService.getPaging( curPage, userNo );
		logger.info("{}", paging);

		paging.setUserNo(userNo);	

		//공연 주문 목록 조회
		List<ExOrderTicket> exlist =myexorderService.exlist(paging);

		logger.info("리스트{}",exlist);

		
		model.addAttribute("paging", paging);
		model.addAttribute("exlist", exlist);

	}
}