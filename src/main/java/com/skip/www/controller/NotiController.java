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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.skip.www.dto.Noti;
import com.skip.www.dto.NotiFile;
import com.skip.www.service.face.NotiService;
import com.skip.www.util.Paging;

@Controller
public class NotiController {

	private static final Logger logger = LoggerFactory.getLogger(NotiController.class);
	
	@Autowired NotiService notiService;

	// 사용자페이지 공지사항 목록 조회
	@RequestMapping(value="noti/list")
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
	
	// 관리자페이지 공지사항 목록 조회
	@RequestMapping(value="admin/noti/list")
	public void adminList(Paging paramData, Model model) {
		logger.info("admin/noti/list");
		
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
	
	
	// 사용자페이지 공지사항 상세보기
	@RequestMapping("noti/view")
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
		NotiFile notiFile = notiService.getAttachFile(viewNoti);
		model.addAttribute("notiFile", notiFile);
		
		return "noti/view";
	}
	
	// 관리자페이지 공지사항 상세보기
	@RequestMapping("admin/noti/view")
	public String adminView(Noti viewNoti, Model model, HttpSession session) {
		logger.info("admin/noti/view - {}", viewNoti);
		
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
		NotiFile notiFile = notiService.getAttachFile(viewNoti);
		model.addAttribute("notiFile", notiFile);
		
		return "admin/noti/view";
	}
	
	// 관리자페이지 공지사항 작성[GET]
	@GetMapping("admin/noti/write")
	public void write() { }
	
	// 관리자페이지 공지사항 작성[POST]
	@PostMapping("admin/noti/write")
	public String writeProcess(Noti noti, @RequestParam("notiFile") MultipartFile file, HttpSession session) {
		logger.info("admin/noti/write [POST]");
		logger.info("{}", noti);
		logger.info("{}", file);
		
		noti.setAdminId( (String) session.getAttribute("id") );

		logger.info("{}", noti);
		
		notiService.write(noti, file);
		
		return "redirect:/admin/noti/list"; //공지사항 목록
	}
	
	// 공지사항 첨부파일 다운로드
	@RequestMapping("noti/download")
	public String download(NotiFile notiFile, Model model) {
		
		notiFile = notiService.getFile(notiFile);
		model.addAttribute("notiFile", notiFile);
		
		return "notiFileDown";
	}
	
	// 관리자페이지 공지사항 수정[GET]
	@GetMapping("admin/noti/update")
	public String update(Noti noti, Model model) {
		logger.info("admin/noti/update - {}", noti);		
		
		//잘못된 게시글 번호 처리
		if( noti.getNotiNo() < 1 ) {
			return "redirect:/admin/noti/list";
		}
		
		//수정할 게시글의 상세보기
		noti = notiService.view(noti);
		model.addAttribute("updateNoti", noti);
		
		//첨부파일 정보 모델값 전달
		NotiFile notiFile = notiService.getAttachFile(noti);
		model.addAttribute("notiFile", notiFile);
		
		return "admin/noti/update";
	}
	
	// 관리자페이지 공지사항 수정[POST]
	@PostMapping("admin/noti/update")
	public String updateProcess(Noti noti, @RequestParam("notiFile") MultipartFile file) {
		logger.info("/admin/noti/update [POST] - {}", noti);
		
//		notiService.update(noti);	//게시글만 수정
		notiService.update(noti, file); //게시글+첨부파일 수정
		
		return "redirect:/admin/noti/view?notiNo=" + noti.getNotiNo();
	}
	
	// 관리자페이지 공지사항 삭제
	@RequestMapping("admin/noti/delete")
	public String delete(Noti noti) {
		notiService.delete(noti);
		
		return "redirect:/admin/noti/list";
	}
	
	
}
