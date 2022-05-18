package com.skip.www.controller;

import java.util.ArrayList;
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
import com.skip.www.dto.ConSeatImg;
import com.skip.www.dto.Concert;
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

		//curPage값과 search값을 받아 Paging객체 생성
		Paging paging = concertService.getConcertPaging(curPage, search);
		
		// 페이징 객체에 검색어 추가
		paging.setSearch(search);
		
		// 페이징 객체에 정렬방법 추가
		paging.setSort(sort);
		
		// Paging객체를 이용한 공연 게시글 목록 전체 조회(최신순, 예매순)
		List<Concert> concertList = concertService.getConcertList(paging);
		
		// 공연 게시글 중 예매순(인기순) 상위 3개 공연 조회
		List<Concert> topList = concertService.getTop3ConcertList();
		
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
		
		//conNo로 공연 좌석 배치도 조회
		ConSeatImg viewConSeatImg = concertService.getConSeatImg(conNo);
		
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
		
		//조회된 전체 별점 더해주기
		for(int i=0; i<allstar.size(); i++) {
			addAllStar += allstar.get(i).getConReviewStar();
		}
		
		double conStar = 0;
		
		if(addAllStar == 0 && cntUser == 0) { // 리뷰가 0개일때 처리
			conStar = 0;
			
		} else { // 리뷰가 1개이상 존재할때 별점 계산
			conStar = addAllStar / cntUser;

		}
		logger.info("{}", conStar);

		model.addAttribute("conStar", String.format("%.1f", conStar));
		
		wish.setConNo(conNo);
		wish.setShowType(1);

		if( session.getAttribute("userNo") != null ) {
			wish.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));
		
		}
		
		// 해당 유저의 위시리스트 목록 조회
		boolean isWish = concertService.isWish(wish);
		
		// 공연 번호와 유저 번호를 넣어줄 HashMap객체 생성
		HashMap<Object, String> map = new HashMap<Object, String>();
		
		if( session.getAttribute("userNo") != null ) {
			map.put("userNo", String.valueOf(Integer.parseInt(String.valueOf(session.getAttribute("userNo")))));
		
		}
		
		map.put("conNo", String.valueOf(conNo));

		//공연 예매 조회
		boolean isTicketing = concertService.isTicketing(map);

		//리뷰 작성 조회
		boolean isReview = concertService.isReview(map);
		
		//VIP 티켓 가격 조회
		int vipSeatPrice = concertService.getVIPSeatPrice(conNo);
		
		//일반 티켓 가격 조회
		int basicSeatPrice = concertService.getBasicSeatPrice(conNo);
		
		model.addAttribute("conSeatImg", viewConSeatImg);
		
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

		// 공연 리뷰 객체에 받아온 정보 넣어주기
		conReview.setConNo(conNo);
		conReview.setConReviewContent(reviewContent);

		conReview.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));
		
		conReview.setConReviewStar(reviewStar);
		
		// 입력받은 정보를 DB에 삽입
		concertService.insertReview(conReview);
		
		return "redirect:/concert/view?conNo="+conNo;
		
	}
	
	@RequestMapping(value="/concert/reviewdelete", method=RequestMethod.GET)
	public String reviewDelete(
				int conReviewNo
				, int conNo
			) {
		
		// 리뷰 번호로 리뷰 삭제
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
		
		// wish 객체에 view에서 받아온 정보 삽입
		wish.setConNo(conNo);
		
		if( session.getAttribute("userNo") != null ) {
		wish.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));

		}
		
		wish.setShowType(1);
		
		// 위시리스트에 이미 존재하는 게시물인지 확인
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
		
		// 공연 번호, 공연 회차, 조회 날짜를 넣어줄 HashMap 객체 생성
		HashMap<Object, String> map = new HashMap<Object, String>();
		
		map.put("conNo", conNo);
		map.put("conRound", conRound);
		map.put("date", date);
		
		logger.info("{}", map);

		// 공연 번호와 공연 회차로 해당 공연 모든 좌석 조회
		List<Seat> getAllSeatList = concertService.getSeatList(map);
		
		// 공연 번호와 공연 회차와 예약 날짜로 예약된 좌석 조회
		List<Seat> getUnreservedSeatList = concertService.getUnreservedSeatList(map);
		
		// 조회된 리스트를 넣어줄 List<Seat> 객체 생성
		List<Seat> ReservableSeats = new ArrayList<>();
		
		logger.info("seatList : {}", getAllSeatList);
		
		for(int i=0; i < getAllSeatList.size(); i++) {
			logger.info("getSeatList.get(i).seat_no : {}", getAllSeatList.get(i).getSeatNo());
			
			// 예약좌석 List size가 0일 경우 모든 좌석 반환
			if(getUnreservedSeatList.size() == 0 ) {
				ReservableSeats.add(getAllSeatList.get(i));
				
			} else {
				// 예약 좌석 List가 있을 경우 해당 좌석 제외 후 반환
				for(int j=0; j < getUnreservedSeatList.size(); j++) {
					if(!getAllSeatList.get(i).getSeatNo().equals(getUnreservedSeatList.get(j).getSeatNo())) {
						ReservableSeats.add(getAllSeatList.get(i));

					}
	
				}
			
			}
		
		}

		logger.info("ReservableSeats : {}", ReservableSeats);
		
		return ReservableSeats;
		
	}
	
}
