package com.skip.www.service.face;

import java.util.List;

import com.skip.www.dto.ConOrderTicket;
import com.skip.www.dto.ExOrderTicket;
import com.skip.www.util.Paging;

public interface MyorderService {

	/**
	 * 페이징이 적용된 전시회 주문 목록 조회
	 * @param paging 페이징이 적용된 전시회 주문 목록 조회
	 * @return 페이징이 적용된 전시회 주문 목록 조회
	 */
	public List<ExOrderTicket> list(Paging paging);

	/**
	 * 전시회 주문 목록을 위한 페이징 객체 생성
	 * @param curPage -현재 페이지 
	 * @param userNo -유저넘버의 전시회 주문 목록 조회
	 * @return
	 */
	public Paging getPaging(String curPage, int userNo);

	/**
	 * 페이징이 적용된 전시회 주문 목록 조회
	 * @param paging 페이징이 적용된 전시회 주문 목록 조회
	 * @return 페이징이 적용된 공연 주문 목록 조회
	 */
	public List<ConOrderTicket> conlist(Paging paging);


	
	
}
