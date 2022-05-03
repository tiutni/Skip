package com.skip.www.service.face;

import java.util.List;

import com.skip.www.dto.Noti;
import com.skip.www.dto.NotiFile;
import com.skip.www.util.Paging;

public interface NotiService {


	/**
	 * 페이징이 적용된 공지사항 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 공지사항 목록
	 */
	public List<Noti> list(Paging paging);

	/**
	 * 공지사항 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 공지사항 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 공지사항 상세보기
	 * 
	 * @param viewNoti - 상세 조회할 공지사항 번호 객체
	 * @return 조회된 상세 공지사항 게시글 객체
	 */
	public Noti view(Noti viewNoti);
	
	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewNoti - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public NotiFile getAttachNotiFile(Noti viewNoti);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param notiFile - 조회할 파일 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public NotiFile getNotiFile(NotiFile notiFile);

}
