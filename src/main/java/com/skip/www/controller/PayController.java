package com.skip.www.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skip.www.dto.Concert;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.User;
import com.skip.www.service.face.PayService;

@Controller
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired PayService payService;
	
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
		
		model.addAttribute("seatLength", selectedSeat.length);
		model.addAttribute("userNo", userNo);
		model.addAttribute("userName", buyer.getUserName());
		model.addAttribute("userEmail", buyer.getUserEmail());
		model.addAttribute("userPhone", buyer.getUserPhone());
		model.addAttribute("userAddr", buyer.getUserAddr());
		model.addAttribute("conNo", con.getConNo());
		model.addAttribute("conTitle", con.getConTitle());
		model.addAttribute("date", date);
		model.addAttribute("round", round);
		model.addAttribute("selectedSeat", selectedSeat);
		model.addAttribute("price", price);
		
		return "/pay/conInfo";
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
		
		model.addAttribute("userNo", userNo);
		model.addAttribute("userName", buyer.getUserName());
		model.addAttribute("userEmail", buyer.getUserEmail());
		model.addAttribute("userPhone", buyer.getUserPhone());
		model.addAttribute("userAddr", buyer.getUserAddr());
		model.addAttribute("exNo", ex.getExNo());
		model.addAttribute("exTitle", ex.getExTitle());
		model.addAttribute("date", date);
		model.addAttribute("count", count);
		model.addAttribute("price", price);
		
		return "/pay/exInfo";
	}
	
	@GetMapping("/pay/complete")
	@ResponseBody
	public void successPay(
			String userNo				// 회원번호
			, String exNo				// 전시회 번호
			, String count				// 매수
			, String conNo				// 공연 번호
			, String date			// 관람일
			, String round			// 회차
			, String[] selectedSeat	// 선택된 좌석
			, String price			// 총 결제금액
			, String uid
			, String applynum
			) {
		
		logger.info("/pay/complete [GET]");
		logger.info("---결제 성공---");
		
		//테스트용 로그
		logger.info("/pay/con - 주문정보 확인------------");
		logger.info("userNo : {}", userNo);
		logger.info("conNo : {}", conNo);
		logger.info("exNo : {}", exNo);
		logger.info("count : {}", count);
		logger.info("date : {}", date);
		logger.info("round : {}", round);
		logger.info("price : {}", price);
		logger.info("---------------------------------");
		
		HashMap<Object, String> map = new HashMap<>();
		
		HashMap<Object, String> con = new HashMap<>();
		
		HashMap<Object, String> ex = new HashMap<>();
		
		HashMap<Object, String> pay = new HashMap<>();
		
		String seatSeq = null;
		
		String conRoundNo = null;
		
		if(applynum == null) {
			applynum = "1111111";
		}
	
		if( conNo != null && round != null ) {
			
			String orderNo = payService.getOrderNo();

			map.put("userNo", userNo);
			map.put("conNo", conNo);
			map.put("orderNo", orderNo);
				
			payService.insertBill(map);
			
			con.put("orderNo", orderNo);
			
			con.put("round", round);
			
			con.put("conNo", conNo);
			
			con.put("date", date);
			
			conRoundNo = payService.getConRoundNo(con);

			con.put("conRoundNo", conRoundNo);
			
			for(int i=0; i<selectedSeat.length; i++) {
				
				con.put("seatNo", selectedSeat[i]);
				
				seatSeq = payService.getSeatSeq(con);
				
				con.put("seatSeq", seatSeq);
				
				logger.info("seat_seq : ", seatSeq);
				
				payService.insertConOrderTicket(con);
				
			}
			
			pay.put("orderNo", orderNo);
			pay.put("price", price);
			pay.put("uid", uid);
			pay.put("applynum", applynum);
			
			payService.insertPay(pay);
			
		} else if( exNo != null && count != null ) {
			
			String orderNo = payService.getOrderNo();

			map.put("userNo", userNo);
			map.put("exNo", exNo);
			map.put("orderNo", orderNo);
				
			payService.insertBill(map);
			
			ex.put("exNo", exNo);
			ex.put("count", count);
			ex.put("orderNo", orderNo);
			ex.put("date", date);
			
			payService.insertExOrderTicket(ex);
			
			pay.put("orderNo", orderNo);
			pay.put("price", price);
			pay.put("uid", uid);
			pay.put("applynum", applynum);
			
			payService.insertPay(pay);
			
		}
		
		
	}
	
	@RequestMapping(value="/pay/success", method=RequestMethod.GET)
	public void success() {
		logger.info("/pay/success [GET]");
		
		
	}
	
	

}
