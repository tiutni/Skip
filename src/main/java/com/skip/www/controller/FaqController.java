package com.skip.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skip.www.dto.FAQ;
import com.skip.www.service.face.FaqService;
import com.skip.www.util.Paging;

@Controller
public class FaqController {

	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
		
	@Autowired private FaqService faqService;
		
	@RequestMapping(value="faq/list")
	public void list(Paging paramData, Model model) {
		logger.info("/faq/list");
		
		//페이징 계산
		Paging paging = faqService.getPaging( paramData );
		logger.info("{}", paging);
			
		//자주 묻는 글 목록 조회
		List<FAQ> list = faqService.list(paging);
		for(FAQ f : list) {
			logger.info("{}", f);
		}
			
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("faq/view")
	public String view(FAQ viewFaq, Model model) {
		logger.info("/faq/view - {}", viewFaq);
		
		//잘못된 자주 묻는 글 번호 처리
		if( viewFaq.getFaqNo() < 1 ) {
			return "redirect:/faq/list";
		}
		
		//자주 묻는 글 조회
		viewFaq = faqService.view(viewFaq);
		logger.info("조회된 게시글 {}", viewFaq);
		
		//모델값 전달
		model.addAttribute("viewFaq", viewFaq);
		
		return "faq/view";
	}
}