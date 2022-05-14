package com.skip.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.skip.www.dto.QnA;
import com.skip.www.service.face.QnaService;
import com.skip.www.util.Paging;

@Controller
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired private QnaService qnaService;
	
	@RequestMapping(value="qna/list")
	public void list(Paging paramData, Model model) {
		logger.info("/qna/list");
		
		//페이징 계산
		Paging paging = qnaService.getPaging( paramData );
		logger.info("{}", paging);
		
		//문의글 목록 조회
		List<QnA> list = qnaService.list(paging);
		for(QnA q : list) {
			logger.info("{}", q);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		}
	
				@RequestMapping(value="qna/admlist") // 관리자가 볼 수 있는 리스트입니다
				public void admlist(Paging paramData, Model model) {
					logger.info("/qna/admlist");
					
					//페이징 계산
					Paging paging = qnaService.getPaging( paramData );
					logger.info("{}", paging);
					
					//문의글 목록 조회
					List<QnA> list = qnaService.list(paging);
					for(QnA q : list) {
						logger.info("{}", q);
					}
					
					model.addAttribute("paging", paging);
					model.addAttribute("list", list);
				}
		
	@RequestMapping(value="qna/view")
	public String view(QnA viewQna, Model model ) {
		logger.info("/qna/view - {}", viewQna);
		
		// 잘못된 문의글 번호 처리
		if( viewQna.getQnaNo() < 1 ) {
			return "redirect:/qna/list";
		}
		
		//문의글 조회
		viewQna = qnaService.view(viewQna);
		logger.info("조회된 문의글 {}", viewQna);
		
		//모델값 전달
		model.addAttribute("viewQna", viewQna);
		
		return "qna/view";
	}
				@RequestMapping(value="qna/admview") //관리자가 볼 수 있는 상세보기 입니다
				public String admview(QnA viewQna, Model model ) {
					logger.info("/qna/admview - {}", viewQna);
					
					// 잘못된 문의글 번호 처리
					if( viewQna.getQnaNo() < 1 ) {
						return "redirect:/qna/admlist";
					}
					
					//문의글 조회
					viewQna = qnaService.view(viewQna);
					logger.info("조회된 문의글 {}", viewQna);
					
					//모델값 전달
					model.addAttribute("viewQna", viewQna);
					
					return "qna/admview";
				}
	
	@GetMapping("qna/write")
	public void write() { }
	
	@PostMapping("qna/write")
	public String writeProcess(QnA qna, MultipartFile file, HttpSession session) {
		logger.info("qna/write [POST]");
		logger.info("{}", qna);
		logger.info("{}", file);
		
		qna.setUserNo( (int) session.getAttribute("userNo") ); //userNo을 가져온다
		
		logger.info("{}", qna);
		
		qnaService.write(qna, file);
		
		return "redirect:/qna/list";

	}
	
	@GetMapping("qna/update")
	public String update(QnA qna, Model model) {
		logger.info("/qna/update - {}", qna);	
		
		// 잘못된 문의글 번호 처리
		if( qna.getQnaNo() < 1 ) {
		return "redirect:/qna/list";
		}

		//수정할 문의글의 상세보기
		qna = qnaService.view(qna);
		model.addAttribute("updateQna", qna);
			
		return "qna/update";
		}
		
}
