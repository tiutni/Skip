package com.skip.www.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.skip.www.dto.Admin;
import com.skip.www.dto.ConImg;
import com.skip.www.dto.ConRound;
import com.skip.www.dto.ConSeatImg;
import com.skip.www.dto.Concert;
import com.skip.www.dto.ExImg;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.Seat;
import com.skip.www.service.face.AdminService;
import com.skip.www.util.Paging;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired private AdminService adminService;

	@GetMapping("/admin/login")
	public void login() {
		logger.info("/admin/login [GET]");
	}

	@PostMapping("/admin/login")
	public String loginProcess(Admin admin, HttpSession session) {
		logger.info("/admin/login [POST]");
		logger.info("{}", admin);

		boolean loginResult = adminService.login(admin);

		if (loginResult) {
			logger.info("로그인 성공");

			session.setAttribute("login", loginResult);
			session.setAttribute("id", admin.getAdminId());

			return "redirect:/admin/member/list";

		} else {
			logger.info("로그인 실패");

			session.invalidate();

			return "redirect:/admin/login";

		}

	}

	@RequestMapping("/admin/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();

		return "redirect:/admin/login";
	}

	@GetMapping("/admin/join")
	public void join() {
	}

	@PostMapping("/admin/join")
	public String joinProcess(Admin admin, HttpServletRequest request) {
		logger.info("/admin/login [POST]");
		logger.info("{}", admin);
		logger.info("{}", request.getParameter("adminAuth") );
		boolean checkAuth = adminService.checkAuth(request.getParameter("adminAuth"));
		if (checkAuth) {
			boolean joinResult = adminService.join(admin);

			if (joinResult) {
				logger.info("회원가입 성공");

				return "redirect:/admin/login";
			} else {
				logger.info("회원가입 실패");
				return "redirect:/admin/join";
			}
		} else {
			logger.info("인증 실패");
			return "redirect:/admin/join";		
		}
	}

	@RequestMapping("/admin/main")
	public void main() {
	}

	@RequestMapping(value = "admin/update", method = RequestMethod.GET)
	public void getUpdate() throws Exception {
		logger.info("get Update");
	}

	@RequestMapping(value = "admin/update", method = RequestMethod.POST)
	public String postUpdate(HttpSession session, Admin admin) throws Exception {
		logger.info("/admin/update");

		adminService.update(admin);

		session.invalidate();

		return "redirect:/admin/login";

	}
	

	@RequestMapping(value="/admin/error")
	public void error() {}

	
	//전시------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/admin/exhibition/list")
	public void listExhibition(Paging paramData, Model model) {
		logger.info("/admin/exhibiton/list");
		
		//페이징 계산
		Paging paging = adminService.getPagingExhibition( paramData );
		logger.info("{}", paging);
		
		//게시글 목록 조회
		List<Exhibition> list = adminService.listExhibition(paging);
		for(Exhibition b : list) {
			logger.info("{}", b);
		}

		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}

	@GetMapping("/admin/exhibition/write")
	public void writeExhibition() { }
	
	@PostMapping("/admin/exhibition/write")
	public String writeProcessExhibition(Exhibition exhibition, MultipartFile file, HttpSession session) {
		logger.info("/admin/exhibition/write [POST]");
		logger.info("{}", exhibition);
		logger.info("{}", file);
		
		exhibition.setAdminId( (String) session.getAttribute("id") );
		logger.info("{}", exhibition);
		
		adminService.writeExhibition(exhibition, file);
		
		return "redirect:/admin/exhibition/list"; //게시글 목록
	}
	
	@GetMapping("/admin/exhibition/update")
	public String updateExhibition(Exhibition exhibition, Model model) {
		logger.info("/admin/exhibition/update - {}", exhibition);		
		
		//잘못된 게시글 번호 처리
		if( exhibition.getExNo() < 1 ) {
			return "redirect:/admin/exhibition/list";
		}
		
		//수정할 게시글의 상세보기
		exhibition = adminService.viewExhibition(exhibition);
		model.addAttribute("updateExhibition", exhibition);
		
		//첨부파일 정보 모델값 전달
		ExImg exImg = adminService.getAttachExImg(exhibition);
		model.addAttribute("exImg", exImg);
		
		return "/admin/exhibition/update";
	}
	
	@PostMapping("/admin/exhibition/update")
	public String updateProcessExhibition(Exhibition exhibition, MultipartFile file) {
		logger.info("/admin/exhibition/update [POST] - {}", exhibition);
		
		adminService.updateExhibition(exhibition, file); //게시글+첨부파일 수정
		
		return "redirect:/admin/exhibition/list";
//		return "redirect:/admin/exhibition/view?exNo=" + exhibition.getExNo();
	}
	
	@RequestMapping("/admin/exhibition/delete")
	public String deleteExhibition(Exhibition exhibition) {
		adminService.deleteExhibition(exhibition);
		
		return "redirect:/admin/exhibition/list";
	}

	@RequestMapping("/admin/exhibition/activate")
	public String activateExhibition(HttpServletRequest request, Exhibition exhibition) {
		adminService.activateExhibition(exhibition);
		
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}
	
	@RequestMapping("/admin/exhibition/unactivate")
	public String unactivateExhibition(HttpServletRequest request, Exhibition exhibition) {
		adminService.unactivateExhibition(exhibition);
		
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}

	@RequestMapping("/admin/exhibition/download")
	public String downloadExImg(ExImg exImg, Model model) {
		
		exImg = adminService.getExImg(exImg);
		model.addAttribute("downExImg", exImg);
		
		return "downExhibition";
	}
	
	
	//공연------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/admin/concert/list")
	public void listConcert(Paging paramData, Model model) {
		logger.info("/admin/concert/list");
		
		//페이징 계산
		Paging paging = adminService.getPagingConcert( paramData );
		logger.info("{}", paging);
		
		//게시글 목록 조회
		List<Concert> list = adminService.listConcert(paging);
		for(Concert b : list) {
			logger.info("{}", b);
		}

		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}

	@GetMapping("/admin/concert/write")
	public void writeConcert() { }
	
	@PostMapping("/admin/concert/write")
	public String writeProcessConcert(Concert concert, MultipartFile fileConImg, MultipartFile fileConSeatImg, HttpSession session) {
		logger.info("/admin/concert/write [POST]");
		logger.info("{}", concert);
		logger.info("{}", fileConImg);
		logger.info("{}", fileConSeatImg);
		logger.info("{}", session);
		
		concert.setAdminId( (String) session.getAttribute("id") );
		logger.info("{}", concert);
		
		adminService.writeConcert(concert, fileConImg, fileConSeatImg);
		
//		return "forward:/admin/conRound/write?conNo="+concert.getConNo();
		return "redirect:/admin/concert/list"; //게시글 목록
	}
	
	@GetMapping("/admin/concert/update")
	public String updateConcert(Concert concert, Model model) {
		logger.info("/admin/concert/update [GET] - {}", concert);		
		
		//잘못된 게시글 번호 처리
		if( concert.getConNo() < 1 ) {
			return "redirect:/admin/concert/list";
		}
		
		//수정할 게시글의 상세보기
		concert = adminService.viewConcert(concert);
		model.addAttribute("updateConcert", concert);

		
		//첨부파일1 정보 모델값 전달
		ConImg conImg = adminService.getAttachConImg(concert);
		model.addAttribute("conImg", conImg);

		//첨부파일2 정보 모델값 전달
		ConSeatImg conSeatImg = adminService.getAttachConSeatImg(concert);
		model.addAttribute("conSeatImg", conSeatImg);

//		//공연 회차 정보 모델값 전달
//		ConRound conRound = adminService.getConRound(concert);
//		model.addAttribute("conRound", conRound);
		
		return "/admin/concert/update";
	}
	
	@PostMapping("/admin/concert/update")
	public String updateProcessConcert(Concert concert, MultipartFile fileConImg, MultipartFile fileConSeatImg) {
		logger.info("/admin/concert/update [POST] - {}", concert);
		
		adminService.updateConcert(concert, fileConImg, fileConSeatImg); //게시글+첨부파일 수정
		
		return "redirect:/admin/concert/list";
	}
	
	@RequestMapping("/admin/concert/delete")
	public String deleteConcert(Concert concert) {
		logger.info("/admin/concert/delete - {}", concert);
		
		adminService.deleteConcert(concert);
		
		return "redirect:/admin/concert/list";
	}

	@RequestMapping("/admin/concert/activate")
	public String activateConcert(HttpServletRequest request, HttpServletResponse response, Concert concert, Model model) { //활성화 버튼 클릭시 동작하는 컨트롤러 메소드
		logger.info("/admin/concert/activate - {}", concert);

		//공연 회차와 좌석(기본, VIP 둘다)이 존재하지 않을때에 대한 예외처리
		//1. DB가서 해당 공연에 대한 회차가 없는 경우 -> 해당 공연의 회차 생성페이지로 이동-----------------------------------------------------------------------------
		List<ConRound> listRound  = adminService.getConRoundList(concert);
		logger.info("listRound - {}", listRound);
		
		if( listRound.size() == 0 ) {
			logger.info("회차가 없는 경우@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('해당 공연에 회차가 존재하지 않습니다!\\n회차 생성 페이지로 이동합니다.'); location.href='/admin/conRound/write?conNo="+concert.getConNo()+"';</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/admin/conRound/write";
		}

//		//알림용 jsp를 두는 방식, 근데 알 수 없는 이유로 jsp로 안넘어가서 폐기
//		if( list.size() == 0 ) {
//			logger.info("회차가 없는 경우@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//			model.addAttribute("msg", "회차정보가 없습니다. 회차 생성 페이지로 이동합니다.");
//			model.addAttribute("url", "/admin/conRound/write?conNo="+concert.getConNo());
//			return "/admin/concert/alertRound";
//		}
		
		//2. DB가서 해당 회차에 대한 좌석이 없는 경우 -> 해당 공연의 좌석 생성페이지로 이동-----------------------------------------------------------------------------
		List<Seat> listSeat = adminService.getSeatList(concert);
		logger.info("listSeat - {}", listSeat);
		
		if( listSeat.size() == 0 ) {
			logger.info("아예 좌석이 없는 경우@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('해당 공연에 회차만 존재하고 좌석이 존재하지 않습니다!\\n좌석을 먼저 생성해주세요.'); location.href='/admin/concert/list';</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/admin/concert/list";
		}
		
		//2-1. DB가서 해당 회차에 대한 기본 좌석이 없는 경우------------------------------------------------------------------------------------------------------------
		List<Seat> listNormalSeat = adminService.getNormalSeatList(concert);
		logger.info("listNormalSeat - {}", listNormalSeat);
		
		if( listNormalSeat.size() == 0 ) {
			logger.info("기본좌석이 없는 경우@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('해당 공연에 기본좌석이 존재하지 않습니다!\\n최소 1개의 기본좌석을 먼저 생성해주세요.'); location.href='/admin/concert/list';</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/admin/concert/list";
		}
		
		
		//2-2. DB가서 해당 회차에 대한 VIP 좌석이 없는 경우-------------------------------------------------------------------------------------------------------------
		List<Seat> listVIPSeat = adminService.getVIPSeatList(concert);
		logger.info("listVIPSeat - {}", listVIPSeat);
		
		if( listVIPSeat.size() == 0 ) {
			logger.info("VIP좌석이 없는 경우@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('해당 공연에 VIP좌석이 존재하지 않습니다!\\n최소 1개의 VIP좌석을 먼저 생성해주세요.'); location.href='/admin/concert/list';</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/admin/concert/list";
		}
		
		
		//정상일때------------------------------------------------------------------------------------------------------------------------------------------------------
		adminService.activateConcert(concert);
		
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}
	
//	@RequestMapping("/admin/concert/alertRound")
//	public String alertRound(Concert concert, Model model) {
//		
//		model.addAttribute("msg", "회차정보가 없습니다. 회차 생성 페이지로 이동합니다.");
//		model.addAttribute("url", "/admin/conRound/write?conNo="+concert.getConNo());
//		
//		return "/admin/concert/alertRound";
//	}
	
	@RequestMapping("/admin/concert/unactivate")
	public String unactivateConcert(HttpServletRequest request, Concert concert) {
		adminService.unactivateConcert(concert);
		
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}

	@RequestMapping("/admin/concert/con_img/download")
	public String downloadConImg(ConImg conImg, Model model) {
		
		conImg = adminService.getConImg(conImg);
		model.addAttribute("downConImg", conImg);
		
		return "downConImg";
	}

	@RequestMapping("/admin/concert/con_seatimg/download")
	public String downloadConSeatImg(ConSeatImg conSeatImg, Model model) {
		
		conSeatImg = adminService.getConSeatImg(conSeatImg);
		model.addAttribute("downConSeatImg", conSeatImg);
		
		return "downConSeatImg";
	}
	
	
	//공연 회차------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/admin/conRound/list")
	public void listConRound(Paging paramData, Model model, Concert concert) {
		logger.info("/admin/conRound/list");
		
		//페이징 계산
		Paging paging = adminService.getPagingConRound( paramData );
		logger.info("{}", paging);
		
		//게시글 목록 조회
		List<ConRound> list = adminService.listConRound(paging);
		for(ConRound b : list) {
			logger.info("{}", b);
		}
		
		//콘서트로부터 전달받은 concert 객체(conNo만 담겼을것) 확인
		logger.info("{}", concert);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("concert", concert);
	}

	@GetMapping("/admin/conRound/write")
	public void writeConRound(Concert concert, Model model) {
		logger.info("/admin/conRound/write [GET] - {}", concert);
		model.addAttribute("concert", concert);
	}
	
	@PostMapping("/admin/conRound/write")
	public String writeProcessConRound(ConRound conRound) {
		logger.info("/admin/conRound/write [POST]");
		logger.info("{}", conRound);
		
		adminService.writeConRound(conRound);
		
		return "redirect:/admin/conRound/list?conNo="+conRound.getConNo();
	}
	
	@GetMapping("/admin/conRound/update")
	public String updateConRound(ConRound conRound, Model model) {
		logger.info("/admin/conRound/update - {}", conRound);		
		
		//잘못된 게시글 번호 처리
		if( conRound.getConRoundNo() < 1 ) {
			return "redirect:/admin/concert/list";
		}
		
		//수정할 게시글의 상세보기
		conRound = adminService.viewConRound(conRound);
		model.addAttribute("updateConRound", conRound);
		
		return "/admin/conRound/update";
	}
	
	@PostMapping("/admin/conRound/update")
	public String updateProcessConRound(ConRound conRound) {
		logger.info("/admin/conRound/update [POST] - {}", conRound);
		
		adminService.updateConRound(conRound); //게시글+첨부파일 수정
		
		return "redirect:/admin/conRound/list?conNo="+conRound.getConNo();
	}
	
	@RequestMapping("/admin/conRound/delete")
	public String deleteConRound(HttpServletRequest request, ConRound conRound) {
		adminService.deleteConRound(conRound);
		
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}
	
	
	//공연 좌석------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/admin/seat/list")
	public void listSeat(Paging paramData, Model model) {
		logger.info("/admin/seat/list");
		
		//페이징 계산
		Paging paging = adminService.getPagingSeat( paramData );
		logger.info("{}", paging);
		
		//게시글 목록 조회
		List<Seat> list = adminService.listSeat(paging);
		for(Seat b : list) {
			logger.info("{}", b);
		}

		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}

	@GetMapping("/admin/seat/write")
	public void writeSeat(int conRoundNo, Model model) {
		logger.info("/admin/seat/write - {}", conRoundNo);		
		model.addAttribute("seatConRoundNo", conRoundNo);
	}
	
	@PostMapping("/admin/seat/write")
	public String writeProcessSeat(Seat seat) {
		logger.info("/admin/seat/write [POST]");
		logger.info("{}", seat);
		
		adminService.writeSeat(seat);
		
		return "redirect:/admin/seat/list?conRoundNo="+seat.getConRoundNo();
	}
	
	@GetMapping("/admin/seat/update")
	public String updateSeat(Seat seat, Model model) {
		logger.info("/admin/seat/update - {}", seat);		
		
		//잘못된 게시글 번호 처리
		if( seat.getSeatSeq() < 1 ) {
			return "redirect:/admin/concert/list";
		}
		
		//수정할 게시글의 상세보기
		seat = adminService.viewSeat(seat);
		model.addAttribute("updateSeat", seat);
		
		return "/admin/seat/update";
	}
	
	@PostMapping("/admin/seat/update")
	public String updateProcessSeat(Seat seat) {
		logger.info("/admin/seat/update [POST] - {}", seat);
		
		adminService.updateSeat(seat); //게시글+첨부파일 수정
		
		return "redirect:/admin/seat/list?conRoundNo="+seat.getConRoundNo();
	}
	
	@RequestMapping("/admin/seat/delete")
	public String deleteSeat(HttpServletRequest request, Seat seat) {
		adminService.deleteSeat(seat);
		
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}

}
