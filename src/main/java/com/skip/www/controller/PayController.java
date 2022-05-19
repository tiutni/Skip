package com.skip.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.skip.www.dto.Concert;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.User;
import com.skip.www.service.face.PayService;

@Controller
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired PayService payService;
	
	// 주문자정보 및 선택한 주문정보 조회
	@PostMapping("/pay")
	public String selectedInfo(
		int userNo				// 회원번호
		, int conNo				// 공연번호
		, int exNo				// 전시번호
		, String date			// 관람일
		, String round			// 회차
		, String[] selectedSeat	// 선택된 좌석
		, String count			// 전시 매수
		, String price			// 총 결제금액
//		, Pay pay
		, Model model
		) {
		
		//테스트용 로그
		logger.info("/pay - 주문정보 확인------------");
		logger.info("userNo : {}", userNo);
		logger.info("conNo : {}", conNo);
		logger.info("exNo : {}", exNo);
		logger.info("date : {}", date);
		logger.info("round : {}", round);
		for(int i=0; i<selectedSeat.length; i++) {
			logger.info("selectedSeat[{}] : {}", i, selectedSeat[i]);
		}
		logger.info("count : {}", count);
		logger.info("price : {}", price);
		logger.info("---------------------------------");
		
		// 회원번호로 회원정보 조회
		User buyer = payService.selectUserInfo(userNo);
		
		// 공연번호로 공연 조회
		Concert con = payService.selectConTitle(conNo);
		
		// 전시번호로 전시회 조회
		Exhibition ex = payService.selectExTitle(exNo);
		
		model.addAttribute("userName", buyer.getUserName());
		model.addAttribute("userEmail", buyer.getUserEmail());
		model.addAttribute("userPhone", buyer.getUserPhone());
		model.addAttribute("userAddr", buyer.getUserAddr());
		model.addAttribute("conTitle", con.getConTitle());
		model.addAttribute("exTitle", ex.getExTitle());
		model.addAttribute("date", date);
		model.addAttribute("round", round);
		model.addAttribute("selectedSeat", selectedSeat);
		model.addAttribute("count", count);
		model.addAttribute("price", price);
		
		return "/pay/info";
	}
	
	@PostMapping("/pay/success")
	public void successPay() {
	
		
	}
	

}
