package com.skip.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.skip.www.service.face.PayService;

@Controller
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired PayService payService;
	
	@GetMapping("/pay/pay")
	public void testPay() {
		logger.info("테스트결제");
	
	
	}
}
