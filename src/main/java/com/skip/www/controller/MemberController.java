package com.skip.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skip.www.dto.User;
import com.skip.www.service.face.MemberService;
import com.skip.www.util.Paging;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired private MemberService memberService;

	@RequestMapping(value="admin/member/list")
	public void list(Paging paramData, Model model) {
		logger.info("/admin/member/list");
		
		//페이징 계산
		Paging paging = memberService.getPaging( paramData );
		logger.info("{}", paging);
		
		//회원 목록 조회
		List<User> list = memberService.list(paging);
		for(User u : list) {
			logger.info("{}", u);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	@GetMapping("/admin/member/delete")
	public String delete(User user) {
		logger.info("/admin/member/delete [GET]");
		memberService.delete(user);
		
			return "redirect:/admin/member/list";
	}
	
	@RequestMapping("admin/member/view")
	public String view(User viewMember, Model model) {
		logger.info("/admin/member/view - {}", viewMember);
		
		//잘못된 회원 번호 처리
		if( viewMember.getUserNo() < 1 ) {
			return "redirect:/admin/member/list";
		}
		
		//회원 조회
		viewMember = memberService.view(viewMember);
		logger.info("조회된 게시글 {}", viewMember);
		
		//모델값 전달
		model.addAttribute("viewMember", viewMember);
		
		return "admin/member/view";
	}
	
}
