package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.ConOrderTicket;
import com.skip.www.dto.ExOrderTicket;
import com.skip.www.util.Paging;

public interface MyorderDao {

	/**
	 * 페이징을 적용하여 전시회 티켓 주문 조회
	 * @param paging 페이징 정보 객체
	 * @return 페이징이 적용된 전시회 티켓 주문 목록
	 */
	public List<ExOrderTicket> selectList(Paging paging);

	/**
	 * 유저의 전체 전시회 티켓 주문 수 조회
	 * @param userNo -해당 유저의 주문
	 * @return
	 */
	public int selectCntAll(int userNo);

	/**
	 * 페이징을 적용한 공연 티켓 주문 조회
	 * @param paging 페이징 정보 객체
	 * @return 페이징이 적용된 공연 티켓 주문 목록
	 */
	public List<ConOrderTicket> selectconList(Paging paging);



}
