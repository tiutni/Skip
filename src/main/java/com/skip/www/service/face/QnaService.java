package com.skip.www.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.skip.www.dto.QnA;
import com.skip.www.dto.QnAFile;
import com.skip.www.dto.QnAMent;
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
	
	/**
	 * 문의글 상세보기
	 * 
	 * @param viewQna - 상세 조회할 문의글 번호 객체
	 * @return 조회된 상세 문의글 객체
	 */
	public QnA view(QnA viewQna);

	/**
	 * 문의글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param qna - 문의글 정보 DTO
	 * @param file - 첨부파일 정보 DTO
	 */
	public void write(QnA qna, MultipartFile file);

	/**
	 * 문의글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewQna - 조회할 문의글 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public QnAFile getAttachFile(QnA viewQna);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param qnaFile - 조회할 파일 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public QnAFile getFile(QnAFile qnaFile);

	/**
	 * 문의글 수정 처리
	 * 첨부파일 수정 처리
	 * 
	 * @param qna - 문의글 정보 객체
	 */
	public void update(QnA qna);
	
	/**
	 * 문의글 수정 처리
	 * 첨부파일 수정 처리
	 * 
	 * @param qna - 문의글 정보 객체
	 */
	public void update(QnA qna, MultipartFile file);

	/**
	 * 문의글 + 첨부파일 삭제 처리
	 * 
	 * @param qna - 삭제할 문의글의 글번호
	 */
	public void delete(QnA qna);

	//관리자
	public void admdelete(QnA qna);
	
	//문의 답변하기
	public void write(QnAMent qnament);

	//상세보기에서 답변 확인하기
	public List<QnAMent> getQnAMentList(QnA viewQna);

}