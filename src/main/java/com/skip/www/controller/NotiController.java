package com.skip.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skip.www.dto.Noti;
import com.skip.www.dto.NotiFile;
import com.skip.www.service.face.NotiService;
import com.skip.www.service.face.UserService;
import com.skip.www.util.Paging;

@Controller
public class NotiController {

	private static final Logger logger = LoggerFactory.getLogger(NotiController.class);
	
	@Autowired NotiService notiService;

	
	@RequestMapping(value="/list")
	public void list(Paging paramData, Model model) {
		logger.info("/noti/list");
		
		//페이징 계산
		Paging paging = notiService.getPaging( paramData );
		logger.info("{}", paging);
		
		//게시글 목록 조회
		List<Noti> list = notiService.list(paging);
		for(Noti n : list) {
			logger.info("{}", n);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/view")
	public String view(Noti viewNoti, Model model, HttpSession session) {
		logger.info("/noti/view - {}", viewNoti);
		
		//잘못된 게시글 번호 처리
		if( viewNoti.getNotiNo() < 1 ) {
			return "redirect:/noti/list";
		}
		
		//게시글 조회
		viewNoti = notiService.view(viewNoti);
		logger.info("조회된 게시글 {}", viewNoti);
		
		//모델값 전달 - 게시글
		model.addAttribute("viewNoti", viewNoti);
		
		
		//첨부파일 정보 모델값 전달
		NotiFile notiImg = notiService.getAttachNotiFile(viewNoti);
		model.addAttribute("notiImg", notiImg);
		
		return "noti/view";
	}
}
