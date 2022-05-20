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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.QnA;
import com.skip.www.dto.QnAFile;
import com.skip.www.dto.User;
import com.skip.www.service.face.MypageService;
import com.skip.www.util.Paging;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Autowired MypageService mypageService;
	User user = new User();


	//회원의 공연,전시 등급 보여주기
	@GetMapping(value="/mypage/main")
	public String mypage(HttpSession session, Model model) {
		logger.info("/mypage/main");
		
		if(session.getAttribute("userNo") == null) {
			return "redirect:/user/login";
		
		}
		
		int userNo = Integer.parseInt(String.valueOf(session.getAttribute("userNo")));
		logger.info("/userno:{}",userNo);
		
		//공연등급 보기
		ConUserLevel cul = mypageService.viewConLevel(userNo);
		logger.info("/ConUserLevelNo:{}",cul);

		//전시회 등급 보기
		ExUserLevel eul =mypageService.viewExLevel(userNo);
		logger.info("/ExUserLevelNo:{}",eul);


		logger.info("조회결과:{}",cul);
		logger.info("조회결과:{}",eul);

		model.addAttribute("cul", cul);
		model.addAttribute("eul", eul);
		
		return "/mypage/main";
		
	}



	//회원 정보 수정
	@GetMapping(value="/userinfo/update")
	public String update(User user, Model model,HttpSession session) {
		logger.info("/userinfo/update-{}",user);

		if(session.getAttribute("userNo") == null) {
			return "redirect:/user/login";
			
		}

		int userNo = Integer.parseInt(String.valueOf(session.getAttribute("userNo")));
		
		logger.info("/userno:{}",userNo);			

		//회원정보 조회
		user = mypageService.viewUserInfo(userNo);
		logger.info("조회된 회원 정보{}", user);
		model.addAttribute("updateUser", user);
		logger.info("모델값{}",user);

		return "/userinfo/update";
	}



	@PostMapping(value="/userinfo/update")
	public String updateUserInfo(User updateUser) {
		logger.info("/userinfo/update[ POST]-{}",updateUser);

		mypageService.updateUserinfo(updateUser);


		return "/userinfo/update";
	}


	// 회원가입 닉네임 중복 체크 (AJAX)
	@GetMapping("/userinfo/update/userNickCheck")
	@ResponseBody
	public int nickCheck(@RequestParam(value = "userNick") String userNick) {
		user.setUserNick(userNick);

		return mypageService.checkNick(user);
	}

	// 회원가입 이메일 중복 체크 (AJAX)
	@GetMapping("/userinfo/update/userEmailCheck")
	@ResponseBody
	public int eamilCheck(@RequestParam(value = "userEmail") String userEmail) {
		user.setUserEmail(userEmail);

		return mypageService.checkEmail(user);
	}

	// 회원가입 주민등록번호 중복 체크 (AJAX)
		@GetMapping("/userinfo/update/userRrnCheck")
		@ResponseBody
		public int rrnCheck(@RequestParam(value = "userRrn") String userRrn) {
			user.setUserRrn(userRrn);
			
			return mypageService.checkRrn(user);
		}
		
		// 회원가입 휴대폰 번호 중복 체크 (AJAX)
		@GetMapping("/userinfo/update/userPhoneCheck")
		@ResponseBody
		public int phoneCheck(@RequestParam(value = "userPhone") String userPhone) {
			user.setUserPhone(userPhone);
			
			return mypageService.checkPhone(user);
		}
	//회원 탈퇴
	@GetMapping("/userinfo/delete")
	public void delete(HttpSession session , User user) {
		logger.info("/userinfo/delete[GET]");



	}

	@PostMapping("/userinfo/delete")
	public String deleteUserInfo(HttpSession session, User user) {
		logger.info("/userinfo/delete[POST]-{}",user);

		if(session.getAttribute("userNo") != null) {
			user.setUserNo(Integer.parseInt(String.valueOf(session.getAttribute("userNo"))));
			
		}

		if( mypageService.deleteUserInfo(user) ) {
			
			session.invalidate();
			
			return "redirect:/user/logout";

		}

		return "redirect:/userinfo/delete";
	}


	@RequestMapping(value="/mypage/qnalist")
	public String list(HttpSession session, User user, String curPage, Model model) {
		logger.info("/mypage/qnalist");

		if(session.getAttribute("userNo") == null) {
			return "redirect:/user/login";
			
		}
		
		int userNo = Integer.parseInt(String.valueOf(session.getAttribute("userNo")));

		//페이징 계산
		Paging paging = mypageService.getPaging( curPage, userNo );
		logger.info("{}", paging);

		paging.setUserNo(userNo);				

		//게시글 목록 조회
		List<QnA> list = mypageService.list(paging);
		for(QnA q : list) {
			if(q.getQnaMentContent() == "" || q.getQnaMentContent() == null) {
				q.setQnaMentContent("관리자의 답변을 기다리는 중입니다.");
			}
			logger.info("{}", q);
		}

		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return "/mypage/qnalist";

	}

	@RequestMapping("/mypage/qnaview")
	public String view(QnA viewQna, Model model,HttpSession session) {
		logger.info("/qna/view - {}", viewQna);

		//잘못된 문의글 번호 처리
		if( viewQna.getQnaNo() < 1 ) {
			return "redirect:/qna/list";
		}

		//게시글 조회
		viewQna = mypageService.view(viewQna);
		logger.info("조회된 문의글 {}", viewQna);

		//모델값 전달 - 문의글
		model.addAttribute("viewQna", viewQna);

		//첨부파일 정보 모델값 전달
		QnAFile qnaFile = mypageService.getAttachFile(viewQna);
		model.addAttribute("qnaFile", qnaFile);

		return "/mypage/qnaview";



	}

	@GetMapping("/mypage/qnawrite")
	public void write() { }

	@PostMapping("/mypage/qnawrite")
	public String writeProcess(QnA qna, MultipartFile file, HttpSession session) {
		logger.info("/mypage/qnawrite [POST]");
		logger.info("{}", qna);
		logger.info("{}", file);

		if(session.getAttribute("userNo") != null ) {
			qna.setUserNo( Integer.parseInt(String.valueOf(session.getAttribute("userNo"))) );

			logger.info("글쓰기 유저번호-{}", qna);
			
		}


		mypageService.write(qna, file);

		return "redirect:/mypage/qnalist"; //게시글 목록
	}

	@RequestMapping("/mypage/download")
	public String qnadownload(QnAFile qnaFile, Model model) {

		qnaFile = mypageService.getFile(qnaFile);
		model.addAttribute("qnaFile", qnaFile);

		return "downQna";
	}

	@GetMapping("/mypage/qnaupdate")
	public String update(QnA qna, Model model) {
		logger.info("/mypage/qnaupdate - {}", qna);		

		//잘못된 게시글 번호 처리
		if( qna.getQnaNo() < 1 ) {
			return "redirect:/mypage/qnalist";
		}

		//수정할 게시글의 상세보기
		qna = mypageService.view(qna);
		model.addAttribute("qnaupdate", qna);

		//첨부파일 정보 모델값 전달
		QnAFile qnaFile = mypageService.getAttachFile(qna);
		model.addAttribute("qnaFile", qnaFile);

		return "mypage/qnaupdate";
	}

	@PostMapping("/mypage/qnaupdate")
	public String updateProcess(QnA qna, MultipartFile file) {
		logger.info("/mypage/qnaupdate [POST] - {}", qna);

		mypageService.update(qna);	//게시글만 수정
		mypageService.update(qna, file); //게시글+첨부파일 수정

		return "redirect:/mypage/qnaview?qnaNo=" + qna.getQnaNo();
	}


	@RequestMapping("/mypage/qnadelete")
	public String delete(QnA qna) {
		mypageService.delete(qna);

		return "redirect:/mypage/qnalist";
	}
}