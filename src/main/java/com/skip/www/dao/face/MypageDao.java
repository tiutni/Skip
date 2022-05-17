package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.QnA;
import com.skip.www.dto.QnAFile;
import com.skip.www.dto.User;
import com.skip.www.util.Paging;

public interface MypageDao {

	
	
	/**
	 * 공연등급레벨을 조회한다
	 * @param userNo -회원등급을 조회할 유저 번호
	 * @return
	 */
	public ConUserLevel selectByConUserLevelconuserlevelno(int userNo);

	/**
	 * 전시등급레벨을 조회한다
	 * @param userNo -회원등급을 조회할 유저 번호
	 * @return
	 */
	public ExUserLevel selectByExUserLevelconuserlevelno(int userNo);


	public User selectUserinfo(int userNo);

	public void updateUserInfo(User updateUser);

	
	/**
	 * 회원정보 삭제
	 * @param user -삭제할 회원 정보
	 * @return
	 */
	public int deleteUserinfo(User user);

	/**
	 * 탈퇴 할 회원의 id와 비밀번호 조회
	 * @param userNo -조회할 no,비밀번호를 가진 객체
	 * @return
	 */

	public int selectcountUserInfo(User userNo);


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
	public int selectCntAll(int userNo);

	public void insertQna(QnA qna);

	public QnAFile selectQnaFileByQnaNo(QnA viewQna);

	public QnAFile selectQnaFileByQnaFileNo(QnAFile qnaFile);

	public QnA select(QnA viewQna);

	public void insertQnaFile(QnAFile qnaFile);

	public void update(QnA qna);

	public void deleteFile(QnA qna);

	public void insertFile(QnAFile qnaFile);

	public void delete(QnA qna);



}
