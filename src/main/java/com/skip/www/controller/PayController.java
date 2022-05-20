package com.skip.www.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.skip.www.dto.Concert;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.User;
import com.skip.www.service.face.PayService;

@Controller
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired PayService payService;
	
	private IamportClient api;
	
	// 생성자 - IMPORT REST API 기본 설정
	public PayController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("8367395191713875","fa7bd1b727d086ff1a5c93019047207f6115b0cb5323c53bb754f7a78ddf820e9591b6833ab607e3");
	}
	
	
	// 주문자정보 및 선택한 주문정보 조회 - 공연
	@PostMapping("/pay/con")
	public String selectedInfo(
		int userNo				// 회원번호
		, int conNo				// 공연 번호
		, String date			// 관람일
		, String round			// 회차
		, String[] selectedSeat	// 선택된 좌석
		, String price			// 총 결제금액
		, Model model
		) {
		
		//테스트용 로그
		logger.info("/pay/con - 주문정보 확인------------");
		logger.info("userNo : {}", userNo);
		logger.info("conNo : {}", conNo);
		logger.info("date : {}", date);
		logger.info("round : {}", round);
		for(int i=0; i<selectedSeat.length; i++) {
			logger.info("selectedSeat[{}] : {}", i, selectedSeat[i]);
		}
		logger.info("price : {}", price);
		logger.info("---------------------------------");
		
		// 회원번호로 회원정보 조회
		User buyer = payService.selectUserInfo(userNo);
		
		// 공연번호로 공연 조회
		Concert con = payService.selectConTitle(conNo);
		
		model.addAttribute("userName", buyer.getUserName());
		model.addAttribute("userEmail", buyer.getUserEmail());
		model.addAttribute("userPhone", buyer.getUserPhone());
		model.addAttribute("userAddr", buyer.getUserAddr());
		model.addAttribute("conTitle", con.getConTitle());
		model.addAttribute("date", date);
		model.addAttribute("round", round);
		model.addAttribute("selectedSeat", selectedSeat);
		model.addAttribute("price", price);
		
		return "/pay/info";
	}
	
	// 주문자정보 및 선택한 주문정보 조회 - 전시
	@PostMapping("/pay/ex")
	public String selectedInfo(
			int userNo				// 회원번호
			, int exNo				// 전시 번호
			, String date			// 관람일
			, String count			// 전시 매수
			, String price			// 총 결제금액
			, Model model
			) {
		
		//테스트용 로그
		logger.info("/pay/ex - 주문정보 확인------------");
		logger.info("userNo : {}", userNo);
		logger.info("exNo : {}", exNo);
		logger.info("date : {}", date);
		logger.info("count : {}", count);
		logger.info("price : {}", price);
		logger.info("---------------------------------");
		
		// 회원번호로 회원정보 조회
		User buyer = payService.selectUserInfo(userNo);
		
		// 전시번호로 전시회 조회
		Exhibition ex = payService.selectExTitle(exNo);
		
		model.addAttribute("userName", buyer.getUserName());
		model.addAttribute("userEmail", buyer.getUserEmail());
		model.addAttribute("userPhone", buyer.getUserPhone());
		model.addAttribute("userAddr", buyer.getUserAddr());
		model.addAttribute("exTitle", ex.getExTitle());
		model.addAttribute("date", date);
		model.addAttribute("count", count);
		model.addAttribute("price", price);
		
		return "/pay/info";
	}
	
	
	// IMPORT 결제 검증
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
	
	@PostMapping("/pay/complete")
	public void successPay() {
		
		
	}
	
	

}
