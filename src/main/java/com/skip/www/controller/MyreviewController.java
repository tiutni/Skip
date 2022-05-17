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

import com.skip.www.dto.ConReview;
import com.skip.www.dto.User;
import com.skip.www.service.face.MyreviewService;
import com.skip.www.util.Paging;

@Controller
public class MyreviewController {

	private static final Logger logger = LoggerFactory.getLogger(MyreviewController.class);

	@Autowired MyreviewService myreviewService;

	@RequestMapping(value="/mypage/myreviewlist")
	public void list(HttpSession session, User user, String curPage, Model model) {
		logger.info("/mypage/myreviewlist");

		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("/userno:{}",userNo);

		//Paging 객체 생성
		Paging paging = myreviewService.getConcertReviewPaging(curPage, userNo);

		//Paging 객체에 userNo 삽입
		paging.setUserNo(userNo);

		//Paging 객체로 유저가 쓴 리뷰 내역 조회
//		List<ConReview> reviewList = myreviewService.reviewList(paging);
		List<HashMap<String, Object>> reviewList = myreviewService.reviewList(paging);


		model.addAttribute("paging", paging);
		model.addAttribute("list", reviewList);

	}
}
