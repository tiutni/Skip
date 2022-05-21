package com.skip.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skip.www.dto.Concert;
import com.skip.www.dto.Exhibition;
import com.skip.www.service.face.ConcertService;
import com.skip.www.service.face.ExhibitionService;

@Controller
public class Main {

	@Autowired
	private ConcertService concertService;
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	private static final Logger logger = LoggerFactory.getLogger(Main.class);
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String concerts(Model model) {
		logger.info("/concerts [GET]");
		
		// 공연 게시글 중 예매순(인기순) 상위 3개 공연 조회
		List<Concert> top3ConList = concertService.getTop3ConcertList();
		model.addAttribute("top3ConList", top3ConList);

		// 공연 게시글 중 최신순 상위 6개 공연 조회
		List<Concert> top6ConList = concertService.getTop6ConcertList();
		model.addAttribute("top6ConList", top6ConList);
		
		return "/concerts";
	}
	
	@RequestMapping(value="/exhibitions", method=RequestMethod.GET)
	public void main(Model model) {
		logger.info("/exhibitions [GET]");
		
		// 전시회 게시글 중 최신순 상위 6개 공연 조회
		List<Exhibition> top3ExList = exhibitionService.getTopExhibitionList();
		model.addAttribute("top3ExList", top3ExList);
		
		// 전시회 게시글 중 예매순(인기순) 상위 3개 공연 조회
		List<Exhibition> top6ExList = exhibitionService.getTop6ExhibitionList();
		model.addAttribute("top6ExList", top6ExList);
	}
}

