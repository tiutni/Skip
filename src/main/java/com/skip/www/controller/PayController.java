package com.skip.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skip.www.service.face.PayService;

@Controller
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired PayService payService;
	
	@RequestMapping("/pay/concert")
	public void selectExDate() {
		
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
