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
import com.skip.www.dto.Concert;
import com.skip.www.dto.ExReview;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.Wish;
import com.skip.www.service.face.ExhibitionService;
import com.skip.www.service.impl.ExhibitionServiceImpl;
import com.skip.www.util.Paging;

@Controller
public class ExhibitionController {

private static final Logger logger = LoggerFactory.getLogger(ConcertController.class);
	
	@Autowired ExhibitionService exhibitionService;
	
	@RequestMapping(value="/exhibition/list", method=RequestMethod.GET)
	public void list( 
			String curPage
			, String search
			, String sort
			, Model model
			) {
		logger.info("/exhibition/list [GET]");
		
		//curPage값과 search값을 받아 Paging객체 생성
		Paging paging = exhibitionService.getExhibitionPaging(curPage, search);
		
		paging.setSearch(search);
		
		paging.setSort(sort);
		
		//전시회 게시글 리스트 출력(최신순, 예매순)
		List<Exhibition> exList = exhibitionService.getExhibitionList(paging);
		
		//전시회 게시글 top3 리스트 출력
		List<Exhibition> topList = exhibitionService.getTopExhibitionList();
		
		model.addAttribute("exList", exList);
		
		model.addAttribute("topList", topList);
		
		model.addAttribute("paging", paging);
		
		model.addAttribute("sort", sort);
		
		model.addAttribute("search", search);
		
	}
	
	@RequestMapping(value="/exhibition/view", method=RequestMethod.GET)
	public void view(
			int exNo
			, String curPage
			, Model model
			, Wish wish
			, HttpSession session
			) {
		logger.info("/exhition/view [GET]");
		
		logger.info("exNo : {}", exNo);
		
		//exNo로 게시글 상세내역 조회
		Exhibition viewExhibition = exhibitionService.getExhibition(exNo);
		
		//Paging 객체 생성
		Paging paging = exhibitionService.getExhibitionReviewPaging(curPage, exNo);
		
		//Paging 객체에 exNo 삽입
		paging.setExNo(exNo);

		logger.info("paging : {}", paging);
		
		//Paging 객체로 해당 전시회 게시글 전체 리뷰 내역 조회
		List<ExReview> reviewList = exhibitionService.reviewList(paging);
		
		//해당 게시글 전체 댓글 수 조회
		int cntUser = exhibitionService.getAllUser(exNo);
		
		//해당 게시글 별점 전체 조회
		List<ExReview> allstar = exhibitionService.getAllStar(exNo);
		
		double addAllStar = 0;
		
		for(int i=0; i<allstar.size(); i++) {
			addAllStar += allstar.get(i).getExReviewStar();
		}
		
		double exStar = 0;
		
		if(addAllStar == 0 && cntUser == 0) {
			exStar = 0;
			
		} else {	
			exStar = addAllStar / cntUser;

		}
		logger.info("{}", exStar);

		model.addAttribute("exStar", String.format("%.1f", exStar));
		
		wish.setExNo(exNo);
		wish.setShowType(2);
		
		if( session.getAttribute("userNo") != null ) {
			wish.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));
		
		}
		
		//위시리스트 목록 조회
		boolean isWish = exhibitionService.isWish(wish);
		
		HashMap<Object, String> map = new HashMap<Object, String>();
		
		if( session.getAttribute("userNo") != null ) {
			map.put("userNo", String.valueOf(Integer.parseInt(String.valueOf(session.getAttribute("userNo")))));
		
		}	
		map.put("exNo", String.valueOf(exNo));
		
		logger.info("map : {}", map);
		
		//전시회 예매 조회
		boolean isTicketing = exhibitionService.isTicketing(map);
		
		//리뷰 작성 조회
		boolean isReview = exhibitionService.isReview(map);
		
		model.addAttribute("isReview", isReview);		
		
		model.addAttribute("isTicketing", isTicketing);
		
		model.addAttribute("isWish", isWish);
		
		model.addAttribute("cntReview", cntUser);
		
		model.addAttribute("viewExhibition", viewExhibition);
		
		model.addAttribute("paging", paging);
		
		model.addAttribute("reviewList", reviewList);
		
	}
	
	@RequestMapping(value="/exhibition/reviewwrite", method=RequestMethod.POST)
	public String reviewWrite(
			ExReview exReview
			, int exNo
			, String reviewContent
			, int reviewStar
			, HttpSession session
			) {
		logger.info("/concert/reviewwrite [POST]");

		exReview.setExNo(exNo);
		exReview.setExReviewContent(reviewContent);

		exReview.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));
		
		exReview.setExReviewStar(reviewStar);
		
		//exReview의 값들을 넘겨서 댓글 테이블에 삽입
		exhibitionService.insertReview(exReview);
		
		return "redirect:/exhibition/view?exNo="+exNo;
	}
	
	@RequestMapping(value="/exhibition/reviewdelete", method=RequestMethod.GET)
	public String reviewDelete(
				int exReviewNo
				, int exNo
			) {
		logger.info("/exhibition/reviewdelete [GET]");
		logger.info("exReview : {}", exReviewNo);
		
		//exReview 번호를 받아서 리뷰 삭제
		exhibitionService.delete(exReviewNo);
		
		return "redirect:/exhibition/view?exNo="+exNo;
	}
	
	@RequestMapping(value="/exhibition/wish", method=RequestMethod.GET)
	@ResponseBody
	public Boolean wishList(
			Wish wish
			, int exNo
			, HttpSession session
			, Model model
			) {
		logger.info("/concert/wish [GET]");
		
		wish.setExNo(exNo);
		
		if( session.getAttribute("userNo") != null ) {
		wish.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));
		
		}
		
		wish.setShowType(2);
		
		//wish리스트 테이블 insert 유무 확인 후 반환
		boolean result = exhibitionService.getWish(wish);
		
		return result;
		
	}
	
}
