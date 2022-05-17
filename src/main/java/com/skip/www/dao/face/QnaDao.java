package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.QnA;
import com.skip.www.dto.QnAFile;
import com.skip.www.dto.QnAMent;
import com.skip.www.util.Paging;


public interface QnaDao {

	/**
	 * 페이징을 적용하여 문의글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 문의글 목록
	 */
	public List<QnA> selectList(Paging paging);

	/**
	 * 전체 문의글 수를 조회한다
	 * 
	 * @param paramData - search를 포함한 페이징 객체
	 * @return 총 문의글 수
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 문의글 번호를 이용하여 문의글을 조회한다
	 * 
	 * @param viewQna - 조회하려는 문의글 번호
	 * @return 조회된 문의글 정보
	 */
	public QnA select(QnA viewQna);

	/**
	 * 문의글 정보를 삽입한다
	 * 
	 * @param qna - 삽입할 문의글 정보
	 */
	public void insertQna(QnA qna);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param qnaFile - 삽입할 첨부파일 정보
	 */
	public void insertFile(QnAFile qnaFile);

	/**
	 * 문의글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewQna - 조회할 문의글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public QnAFile selectQnaFileByQnaNo(QnA viewQna);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param qnaFile - 조회할 첨부파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public QnAFile selectQnaFileByQnaFileNo(QnAFile qnaFile);

	/**
	 * 문의글 정보 수정
	 * 
	 * @param qna - 수정할 내용을 가진 문의글 객체
	 */
	public void update(QnA qna);

	/**
	 * 문의글을 참조하고 있는 모든 첨부파일을 삭제한다
	 * 
	 * @param qna - 첨부파일을 삭제할 문의글 번호 객체
	 */
	public void deleteFile(QnA qna);

	/**
	 * 문의글 정보 삭제
	 * 
	 * @param qna - 삭제할 문의글의 글번호
	 */
	public void delete(QnA qna);

	public void insertQnAMent(QnAMent qnament);

}