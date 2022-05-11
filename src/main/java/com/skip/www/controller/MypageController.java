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
	
	
	
	//회원의 공연,전시 등급 보여주기
	@GetMapping(value="/mypage/main")
	public void mypage(HttpSession session, Model model) {
		logger.info("/mypage/main");
		
		int userNo=(Integer)session.getAttribute("userNo");
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
	}

	
	//회원 정보 수정
	@GetMapping(value="/userinfo/update")
	public String update(User user, Model model,HttpSession session) {
		logger.info("/userinfo/update-{}",user);
		
		
		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("/userno:{}",userNo);
		
		//회원정보 조회
		user=mypageService.viewUserInfo(userNo);
		logger.info("조회된 회원 정보{}", user);
		model.addAttribute("updateUser", user);
		logger.info("모델값{}",user);
		
		return "userinfo/update";
	}
	
	
	
	//회원 정보 수정
	@PostMapping(value="/userinfo/update")
	public String updateUserInfo(User updateUser) {
		logger.info("/userinfo/update[ POST]-{}",updateUser);
		
		mypageService.updateUserinfo(updateUser);
		
		
		return "userinfo/update";
	}

	//회원 탈퇴
	@GetMapping("/userinfo/delete")
	public void delete(HttpSession session , User user) {
		logger.info("/userinfo/delete[GET]");
		
		
		
	}
	
	@PostMapping("/userinfo/delete")
	public String deleteUserInfo(HttpSession session, User user) {
		logger.info("/userinfo/delete[POST]-{}",user);
		
		
		//비밀번호 검증
		
		int userNo =(int)session.getAttribute("userNo");
		logger.info("유저번호{}-",userNo);

		user.setUserNo(userNo);
		
		if( mypageService.deleteUserInfo(user) ) {
			return "redirect:/user/logout";
			
		}
		
		return "redirect:/userinfo/delete";
	}

	
			@RequestMapping(value="/mypage/qnalist")
			public void list(HttpSession session, User user, String curPage, Model model) {
				logger.info("/mypage/qnalist");
				
				int userNo=(Integer)session.getAttribute("userNo");
		
				
				
				//페이징 계산
				Paging paging = mypageService.getPaging( curPage, userNo );
				logger.info("{}", paging);
				
				paging.setUserNo(userNo);				
				
				//게시글 목록 조회
				List<QnA> list = mypageService.list(paging);
				
				model.addAttribute("paging", paging);
				model.addAttribute("list", list);
				
			}
				
			@RequestMapping("/mypageqna/qnaview")
			public String view(QnA viewQna, Model model) {
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
				
				return "mypage/qnalist";
				
			
		
	}
	
			@GetMapping("/mypage/qnawrite")
			public void write() { }
			
			@PostMapping("/mypage/qnawrite")
			public String writeProcess(QnA qna, MultipartFile file, HttpSession session) {
				logger.info("/board/write [POST]");
				logger.info("{}", qna);
				logger.info("{}", file);
				
				qna.setUserNo( (Integer) session.getAttribute("userNo") );
				logger.info("{}", qna);
				
				mypageService.write(qna, file);
				
				return "redirect:/board/list"; //게시글 목록
			}

			@RequestMapping("/download")
			public String download(QnAFile qnaFile, Model model) {
				
				qnaFile = mypageService.getFile(qnaFile);
				model.addAttribute("qnaFile", qnaFile);
				
				return "down";
			}
}
