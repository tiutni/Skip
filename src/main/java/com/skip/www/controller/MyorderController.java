package com.skip.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skip.www.dto.ConOrderTicket;
import com.skip.www.dto.ExOrderTicket;
import com.skip.www.service.face.MyorderService;
import com.skip.www.util.Paging;

@Controller
public class MyorderController {

	private static final Logger logger = LoggerFactory.getLogger(MyorderController.class);

	@Autowired MyorderService myorderService;


	//전시회 주문 조회
	@RequestMapping(value="/mypage/myorder")
	public void list(HttpSession session, String curPage, Model model) {
		logger.info("/mypage/myorder");

		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("/userno:{}",userNo);


		//페이징 계산 curPage값과 userNo을 받아 페이징 객체 생성
		Paging paging = myorderService.getPaging( curPage, userNo );
		logger.info("{}", paging);

		paging.setUserNo(userNo);	

		//전시회 주문 목록 조회
		List<ExOrderTicket> list =myorderService.list(paging);

		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

	}

	//공연 주문 조회
	@GetMapping(value="/mypage/myorder")
	public void conlist(HttpSession session, String curPage, Model model) {
		logger.info("/mypage/myorder");

		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("/userno:{}",userNo);


		//페이징 계산 curPage값과 userNo을 받아 페이징 객체 생성
		Paging paging = myorderService.getPaging( curPage, userNo );
		logger.info("{}", paging);

		paging.setUserNo(userNo);	

		//공연 주문 목록 조회
		List<ConOrderTicket> conlist =myorderService.conlist(paging);

		model.addAttribute("paging", paging);
		model.addAttribute("conlist", conlist);

	}
}