package com.skip.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skip.www.dto.QnA;
import com.skip.www.service.face.QnaService;
import com.skip.www.util.Paging;

@Controller
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired private QnaService qnaService;
	
	@RequestMapping(value="/qna/list")
	public void list(Paging paramData, Model model) {
		logger.info("/qna/list");
		
		//페이징 계산
		Paging paging = qnaService.getPaging( paramData );
		logger.info("{}", paging);
		
		//게시글 목록 조회
		List<QnA> list = qnaService.list(paging);
		for(QnA q : list) {
			logger.info("{}", q);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		}
		
	@RequestMapping("/qna/view")
	public String view(QnA viewQna, Model model) {
		logger.info("/qna/view - {}", viewQna);
		
		//잘못된 문의글 번호 처리
		if( viewQna.getQnaNo() < 1 ) {
		return "redirect:/qna/list";
		}
		
		//게시글 조회
		viewQna = qnaService.view(viewQna);
		logger.info("조회된 문의글 {}", viewQna);
		
		//모델값 전달 - 문의글
		model.addAttribute("viewQna", viewQna);
		
		
		
		return "qna/list";
		
	}
}
