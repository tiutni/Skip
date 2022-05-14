package com.skip.www.service.face;

import java.util.List;

import com.skip.www.dto.FAQ;
import com.skip.www.util.Paging;

public interface FaqService {

	/**
	 * 페이징이 적용된 자주 묻는 글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 자주 묻는 글 목록
	 */
	public List<FAQ> list(Paging paging);

	/**
	 * 자주 묻는 글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 자주 묻는 글 상세보기
	 * 
	 * @param viewFaq - 상세 조회할 자주 묻는 글 번호 객체
	 * @return 조회된 상세 자주 묻는 글 객체
	 */
	public FAQ view(FAQ viewFaq);

	/**
	 * 자주 묻는 글 정보
	 * 
	 * @param faq - 자주 묻는 글 정보 DTO
	 */
	public void write(FAQ faq);

	/**
	 * 자주 묻는 글 수정 처리
	 * 
	 * @param faq - 자주 묻는 글 정보 객체
	 */
	public void update(FAQ faq);
	
	/**
	 * 자주 묻는 글 삭제 처리
	 * 
	 * @param faq - 삭제할 자주 묻는 글의 글번호
	 */
	public void delete(FAQ faq);

}
