package com.skip.www.service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.QnA;
import com.skip.www.dto.QnAFile;
import com.skip.www.dto.User;
import com.skip.www.util.Paging;


public interface MypageService {
	
	
	
	/**
	 *  공연 회원 등급 조회
	 * @param userNo -회원등급을 조회 할 유저번호
	 * 
	 */
	public ConUserLevel viewConLevel(int userNo);
	
	/**
	 * 전시 회원 등급 조회
	 * @param userNo -회원등급을 조회 할 유저번호
	 * @return
	 */
	public ExUserLevel viewExLevel(int userNo);



	/**
	 * 회원정보 수정
	 * @param updateUser -수정할 회원 정보
	 */
	public void updateUserinfo(User updateUser);

	/**
	 * 수정 할 회원 정보 조회
	 * @param userNo -회원등급을 수정 할 유저 번호
	 * @return
	 */
	public User viewUserInfo(int userNo);

	/**
	 * 회원탈퇴
	 * @param user -삭제할 유저 정보
	 * @return
	 */
	public boolean deleteUserInfo(User user);

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
	public Paging getPaging(String curPage, int userNo);
	
	public QnA view(QnA viewQna);

	public void write(QnA qna, MultipartFile file);

	public QnAFile getAttachFile(QnA viewQna);

	public QnAFile getFile(QnAFile qnaFile);

//	public void qnaupdate(QnA qna, MultipartFile file);


	





	




	

}
