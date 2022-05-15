package com.skip.www.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skip.www.dto.ConReview;
import com.skip.www.dto.ConRound;
import com.skip.www.dto.Concert;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.Seat;
import com.skip.www.dto.Wish;
import com.skip.www.service.face.ConcertService;
import com.skip.www.util.Paging;

@Controller
public class ConcertController {

	private static final Logger logger = LoggerFactory.getLogger(ConcertController.class);
	
	@Autowired ConcertService concertService;
	
	@RequestMapping(value="/concert/list", method=RequestMethod.GET)
	public void list(
			String curPage
			, String search
			, String sort
			, Model model
			) {
		logger.info("/concert/list [GET]");
		
		logger.info("sort : {}", sort);		

		Paging paging = concertService.getConcertPaging(curPage, search);
		
		paging.setSearch(search);
		
		paging.setSort(sort);
		
		List<Concert> concertList = concertService.getConcertList(paging);
		
		List<Exhibition> topList = concertService.getTopConcertList();
		
		model.addAttribute("conList", concertList);
		
		model.addAttribute("topList", topList);
		
		model.addAttribute("paging", paging);
		
		model.addAttribute("sort", sort);
		
		model.addAttribute("search", search);
		
	}
	
	@RequestMapping(value="/concert/view", method=RequestMethod.GET)
	public void view(
			int conNo
			, String curPage
			, Model model
			, Wish wish
			, HttpSession session
			, String round
			) {
		logger.info("/concert/view [GET]");
		
		logger.info("Round : {}", round);
		
		logger.info("conNo : {}", conNo);

		//conNo로 게시글 상세내역 조회
		Concert viewConcert = concertService.getConcert(conNo);
		
		//conNo로 concert 회차 시간 조회
		List<ConRound> conRoundList = concertService.conRoundList(conNo);
		
		//Paging 객체 생성
		Paging paging = concertService.getConcertReviewPaging(curPage, conNo);
		
		//Paging 객체에 conNo 삽입
		paging.setConNo(conNo);
		
		//Paging 객체로 해당 공연 게시글 전체 리뷰 내역 조회
		List<ConReview> reviewList = concertService.reviewList(paging);
		
		//해당 게시글 전체 댓글 수 조회
		int cntUser = concertService.getAllUser(conNo);
		
		//해당 게시글 별점 전체 조회
		List<ConReview> allstar = concertService.getAllStar(conNo);
		
		double addAllStar = 0;
		
		for(int i=0; i<allstar.size(); i++) {
			addAllStar += allstar.get(i).getConReviewStar();
		}
		
		double conStar = 0;
		
		if(addAllStar == 0 && cntUser == 0) {
			conStar = 0;
			
		} else {	
			conStar = addAllStar / cntUser;

		}
		logger.info("{}", conStar);

		model.addAttribute("conStar", String.format("%.1f", conStar));
		
		wish.setConNo(conNo);
		wish.setShowType(1);

		if( session.getAttribute("userNo") != null ) {
			wish.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));
		
		}
		
		//해당유저 위시리스트 목록 조회
		boolean isWish = concertService.isWish(wish);
		
		HashMap<Object, String> map = new HashMap<Object, String>();
		
		if( session.getAttribute("userNo") != null ) {
		map.put("userNo", String.valueOf(Integer.parseInt(String.valueOf(session.getAttribute("userNo")))));
		
		}	
		map.put("conNo", String.valueOf(conNo));

		//공연 예매 조회
		boolean isTicketing = concertService.isTicketing(map);

		//리뷰 작성 조회
		boolean isReview = concertService.isReview(map);
		
		//VIP 예매 가격 조회
		int vipSeatPrice = concertService.getVIPSeatPrice(conNo);
		
		//일반 예매 가격 조회
		int basicSeatPrice = concertService.getBasicSeatPrice(conNo);
		
		model.addAttribute("vipSeatPrice", vipSeatPrice);

		model.addAttribute("basicSeatPrice", basicSeatPrice);
		
		model.addAttribute("isReview", isReview);
				
		model.addAttribute("isTicketing", isTicketing);
		
		model.addAttribute("isWish", isWish);
		
		model.addAttribute("cntReview", cntUser);
		
		model.addAttribute("conRoundList", conRoundList);
		
		model.addAttribute("viewConcert", viewConcert);
		
		model.addAttribute("paging", paging);
		
		model.addAttribute("reviewList", reviewList);
		
	}
	
	@RequestMapping(value="/concert/reviewwrite", method=RequestMethod.POST)
	public String reviewWrite(
			ConReview conReview
			, int conNo
			, String reviewContent
			, int reviewStar
			, HttpSession session
			) {
		logger.info("/concert/reviewwrite [POST]");

		conReview.setConNo(conNo);
		conReview.setConReviewContent(reviewContent);

		conReview.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));
		
		conReview.setConReviewStar(reviewStar);
		
		concertService.insertReview(conReview);
		
		return "redirect:/concert/view?conNo="+conNo;
		
	}
	
	@RequestMapping(value="/concert/reviewdelete", method=RequestMethod.GET)
	public String reviewDelete(
				int conReviewNo
				, int conNo
			) {
		
		concertService.delete(conReviewNo);
		
		return "redirect:/concert/view?conNo="+conNo;
		
	}
	
	@RequestMapping(value="/concert/wish", method=RequestMethod.GET)
	@ResponseBody
	public Boolean wishList(
			Wish wish
			, int conNo
			, HttpSession session
			, Model model
			) {
		logger.info("/concert/wish [GET]");
		
		wish.setConNo(conNo);
		
		if( session.getAttribute("userNo") != null ) {
		wish.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));

		}
		
		wish.setShowType(1);
		
		boolean result = concertService.getWish(wish);
		
		return result;
		
	}
	
	@RequestMapping(value="/concert/seat", method=RequestMethod.GET)
	@ResponseBody
	public List<Seat> selectSeat(
			String conNo
			, String conRound
			, String date
			, Model model
			) {
		
		logger.info("conNo : {}", conNo);
		logger.info("conRound : {}", conRound);
		logger.info("date : {}", date);
		
		HashMap<Object, String> map = new HashMap<Object, String>();
		
		map.put("conNo", conNo);
		map.put("conRound", conRound);
		
		logger.info("{}", map);

		List<Seat> getSeatList = concertService.getSeatList(map);
		
		logger.info("seatList : {}", getSeatList);
		
		return getSeatList;
		
	}
	
}
