package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.QnA;
import com.skip.www.util.Paging;


public interface QnaDao {

	/**
	 * 페이징을 적용하여 문의글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<QnA> selectList(Paging paging);

	/**
	 * 전체 문의글 수를 조회한다
	 * 
	 * @param paramData - search를 포함한 페이징 객체
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);
	

}


























