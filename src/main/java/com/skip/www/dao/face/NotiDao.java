package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.Noti;
import com.skip.www.dto.NotiFile;
import com.skip.www.util.Paging;

public interface NotiDao {

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Noti> selectList(Paging paging);

	/**
	 * 전체 공지사항 수를 조회한다
	 * 
	 * @param paramData - search를 포함한 페이징 객체
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);
	
	/**
	 * 공지사항 게시글 번호를 이용하여 공지사항을 조회한다
	 * 
	 * @param viewNoti - 조회하려는 공지사항 게시글 번호
	 * @return 조회된 공지사항 게시글 정보
	 */
	public Noti select(Noti viewNoti);
	
	/**
	 * 공지사항 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewNoti - 조회할 공지사항 번호
	 * @return 조회된 첨부파일 정보
	 */
	public NotiFile selectNotiFileByNotiNo(Noti viewNoti);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param NotiFile - 조회할 첨부파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public NotiFile selectNotiFileByNotiFileNo(NotiFile notiFile);

}
