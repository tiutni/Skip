package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.FAQ;
import com.skip.www.util.Paging;

public interface FaqDao {

	/**
	 * 페이징을 적용하여 자주 묻는 글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 자주 묻는 글 목록
	 */
	public List<FAQ> selectList(Paging paging);

	/**
	 * 전체 자주 묻는 글 수를 조회한다
	 * 
	 * @return 총 자주 묻는 글 수
	 */
	public int selectCntAll();

	/**
	 * 자주 묻는 글 번호를 이용하여 자주 묻는 글을 조회한다
	 * 
	 * @param viewFaq - 조회하려는 자주 묻는 글 번호
	 * @return 조회된 자주 묻는 글 정보
	 */
	public FAQ select(FAQ viewFaq);

}
