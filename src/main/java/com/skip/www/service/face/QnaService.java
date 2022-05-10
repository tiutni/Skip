package com.skip.www.service.face;

import java.util.List;

import com.skip.www.dto.QnA;
import com.skip.www.util.Paging;

public interface QnaService {

	/**
	 * 페이징이 적용된 문의글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<QnA> list(Paging paging);

	/**
	 * 문의글 목록을 위한 페이징 객체를 생성한다
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

	public QnA view(QnA viewQna);


}
