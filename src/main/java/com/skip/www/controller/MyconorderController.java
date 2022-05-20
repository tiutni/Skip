package com.skip.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.skip.www.dto.ConOrderTicket;
import com.skip.www.service.face.MyconorderService;
import com.skip.www.util.Paging;

@Controller
public class MyconorderController {

	private static final Logger logger = LoggerFactory.getLogger(MyconorderController.class);

	@Autowired MyconorderService myorderService;

	//공연 주문 조회
	@GetMapping(value="/mypage/myconorder")
	public String conlist(HttpSession session, String curPage, Model model) {
		logger.info("/mypage/myconorder");
		
		if(session.getAttribute("userNo") == null) {
			return "redirect:/user/login";
		
		}
		
		int userNo = Integer.parseInt(String.valueOf(session.getAttribute("userNo")));
			
		logger.info("/userno:{}",userNo);

		//페이징 계산 curPage값과 userNo을 받아 페이징 객체 생성
		Paging paging = myorderService.getPaging( curPage, userNo );
		logger.info("{}", paging);

		paging.setUserNo(userNo);	

		//공연 주문 목록 조회
		List<ConOrderTicket> conlist =myorderService.conlist(paging);

		model.addAttribute("paging", paging);
		model.addAttribute("conlist", conlist);

		return "/mypage/myconorder";
		
	}
}