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
	
	@RequestMapping(value="faq/admlist")
	public void admlist(Paging paramData, Model model) {
		logger.info("/faq/admlist");
		
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
	@RequestMapping("faq/admview")
	public String admview(FAQ viewFaq, Model model) {
		logger.info("/faq/view - {}", viewFaq);
		
		//잘못된 자주 묻는 글 번호 처리
		if( viewFaq.getFaqNo() < 1 ) {
			return "redirect:/faq/admlist";
		}
		
		//자주 묻는 글 조회
		viewFaq = faqService.view(viewFaq);
		logger.info("조회된 게시글 {}", viewFaq);
		
		//모델값 전달
		model.addAttribute("viewFaq", viewFaq);
		
		return "faq/admview";
	}
	
	@GetMapping("faq/write")
	public void write() { }
	
	@PostMapping("faq/write")
	public String writeProcess(FAQ faq, HttpSession session) {
		logger.info("/faq/write [POST]");
		logger.info("{}", faq);
		
		faq.setAdminId( (String) session.getAttribute("id") ); //관리자 ID
		logger.info("{}", faq);
		
		faqService.write(faq);
		
		return "redirect:/faq/admlist"; //관리자 FAQ 목록
	}
	
	@GetMapping("faq/update")
	public String update(FAQ faq, Model model) {
		logger.info("/faq/update - {}", faq);		
		
		//잘못된 자주 묻는 글 번호 처리
		if( faq.getFaqNo() < 1 ) {
			return "redirect:/faq/admlist";
		}
		
		//수정할 자주 묻는 글의 상세보기
		faq = faqService.view(faq);
		model.addAttribute("updateFaq", faq);
		
		return "faq/update";
	}
	
	@PostMapping("faq/update")
	public String updateProcess(FAQ faq) {
		logger.info("/faq/update [POST] - {}", faq);
		
		faqService.update(faq); //자주 묻는 글 수정
		
		return "redirect:/faq/admlist";
	}
	
	@RequestMapping("faq/delete")
	public String delete(FAQ faq) {
		faqService.delete(faq);
		
		return "redirect:/faq/admlist";
	}
}