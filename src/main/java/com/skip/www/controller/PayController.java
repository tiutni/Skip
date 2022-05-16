package com.skip.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skip.www.dto.Pay;
import com.skip.www.dto.User;
import com.skip.www.service.face.PayService;

@Controller
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired PayService payService;
	
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public void testPay(
			int userNo
			, int conNo
			, String exNo
			, String count
			, String price
			, String date
			, String round
			, String selectedSeat
			, Pay pay
			) {
		
		//미완성코드 값만 잘 받아오나 실험해본 코드입니다.
		logger.info("userNo : {}", userNo);
		logger.info("conNo : {}", conNo);
		logger.info("exNo : {}", exNo);
		logger.info("count : {}", count);
		logger.info("price : {}", price);
		logger.info("date : {}", date);
		logger.info("round : {}", round);
		logger.info("selectedSeat : {}", selectedSeat);
		
	}
	
	@RequestMapping("/pay/concert")
	public void selectExDate(HttpSession session, Model model) {
		int userNo = (Integer)session.getAttribute("userNo");

		User userInfo = payService.selectUserInfo(userNo);
		
		model.addAttribute("user", userInfo);
		
		
	}
	
	@RequestMapping("/pay/exhibition")
	public void selectConSeatAndDate() {
		
	}
	
	
	@RequestMapping("/pay/confirm")
	public void confirmBuyer() {
		
	}
	
	@RequestMapping("/pay/method")
	public void selectPaymentMethod() {
		
	}
	
	@RequestMapping("/pay/consent")
	public void getConsent() {
		
	}
	
	@RequestMapping("/refund/check")
	public void checkRefund() {
		
	}
	
}
