package com.skip.www.service.face;

import java.util.List;

import com.skip.www.dto.User;
import com.skip.www.util.Paging;

public interface MemberService {

	/**
	 * 페이징이 적용된 회원 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 회원 목록
	 */
	public List<User> list(Paging paging);

	/**
	 * 회원 목록을 위한 페이징 객체를 생성한다
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
	 * 회원 삭제 처리
	 * 
	 * @param user - 삭제할 회원의 회원번호
	 */
	public void delete(User user);
}
