package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.Admin;
import com.skip.www.dto.ConImg;
import com.skip.www.dto.ConRound;
import com.skip.www.dto.ConSeatImg;
import com.skip.www.dto.Concert;
import com.skip.www.dto.ExImg;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.Seat;
import com.skip.www.util.Paging;

public interface AdminDao {

	/**
	 * id/pw가 일치하는 관리자 수를 반환한다
	 * 
	 * @param admin - 조회할 id/pw를 가진 객체
	 * @return 조회된 행 수
	 */
	public int selectCntAdmin(Admin admin);

	/**
	 * 관리자 id가 존재하는 값인지 확인한다
	 * 중복된 id인지 확인
	 * 
	 * @param admin - 조회하려는 관리자의 id를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 있음)
	 */
	public int selectCntById(Admin admin);

	/**
	 * 신규 관리자의 정보를 새롭게 삽입한다
	 * 
	 * @param admin - 신규 관리자 정보
	 */
	public void insert(Admin admin);

	/**
	 * 관리자 정보를 수정한다
	 * 
	 * @param admin - 수정하려는 관리자
	 * @throws Exception
	 */
	public void update(Admin admin) throws Exception;

	/**
	 * 일치하는 관리자가입인증번호 반환한다
	 * 
	 * @param adminAuth - 관리자가입인증번호
	 * @return 존재 여부 (0 - 없음, 1 - 있음)
	 */
	public int selectAdminAuth(String adminAuth);

	
	//전시--------------------------------------------------------------
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Exhibition> selectExhibitionList(Paging paging);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @param paramData - search를 포함한 페이징 객체
	 * @return 총 게시글 수
	 */
	public int selectExhibitionCntAll(Paging paramData);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewExhibition - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Exhibition selectExhibition(Exhibition viewExhibition);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param exhibition - 삽입할 게시글 정보
	 */
	public void insertExhibition(Exhibition exhibition);
	
	/**
	 * 게시글 정보 수정
	 * 
	 * @param exhibition - 수정할 내용을 가진 게시글 객체
	 */
	public void updateExhibition(Exhibition exhibition);

	/**
	 * 게시글 정보 삭제
	 * 
	 * @param exhibition - 삭제할 게시글의 글번호
	 */
	public void deleteExhibition(Exhibition exhibition);
	
	
	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewExhibition - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ExImg selectExImgByExNo(Exhibition viewExhibition);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param exImg - 조회할 첨부파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ExImg selectExImgByExImgNo(ExImg exImg);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param exImg - 삽입할 첨부파일 정보
	 */
	public void insertExImg(ExImg exImg);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일을 삭제한다
	 * 
	 * @param exhibition - 첨부파일을 삭제할 게시글 번호 객체
	 */
	public void deleteExImg(Exhibition exhibition);

	public void activateExhibition(Exhibition exhibition);

	public void unactivateExhibition(Exhibition exhibition);
	
	
	//공연--------------------------------------------------------------
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Concert> selectConcertList(Paging paging);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @param paramData - search를 포함한 페이징 객체
	 * @return 총 게시글 수
	 */
	public int selectConcertCntAll(Paging paramData);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewConcert - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Concert selectConcert(Concert viewConcert);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param concert - 삽입할 게시글 정보
	 */
	public void insertConcert(Concert concert);
	
	/**
	 * 게시글 정보 수정
	 * 
	 * @param concert - 수정할 내용을 가진 게시글 객체
	 */
	public void updateConcert(Concert concert);

	/**
	 * 게시글 정보 삭제
	 * 
	 * @param concert - 삭제할 게시글의 글번호
	 */
	public void deleteConcert(Concert concert);
	
	public void activateConcert(Concert concert);

	public void unactivateConcert(Concert concert);
	
	
	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewConcert - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ConImg selectConImgByConNo(Concert viewConcert);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param conImg - 조회할 첨부파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ConImg selectConImgByConImgNo(ConImg conImg);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param conImg - 삽입할 첨부파일 정보
	 */
	public void insertConImg(ConImg conImg);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일을 삭제한다
	 * 
	 * @param concert - 첨부파일을 삭제할 게시글 번호 객체
	 */
	public void deleteConImg(Concert concert);
	
	
	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewConcert - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ConSeatImg selectConSeatImgByConNo(Concert viewConcert);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param conSeatImg - 조회할 첨부파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public ConSeatImg selectConSeatImgByConSeatImgNo(ConSeatImg conSeatImg);
	
	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param conSeatImg - 삽입할 첨부파일 정보
	 */
	public void insertConSeatImg(ConSeatImg conSeatImg);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일을 삭제한다
	 * 
	 * @param concert - 첨부파일을 삭제할 게시글 번호 객체
	 */
	public void deleteConSeatImg(Concert concert);	
	
	
	//공연회차--------------------------------------------------------------
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<ConRound> selectConRoundList(Paging paging);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @param paramData - search를 포함한 페이징 객체
	 * @return 총 게시글 수
	 */
	public int selectConRoundCntAll(Paging paramData);

	public List<ConRound> selectConRoundListByConNo(Concert concert);
	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewConRound - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public ConRound selectConRound(ConRound viewConRound);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param conRound - 삽입할 게시글 정보
	 */
	public void insertConRound(ConRound conRound);
	
	/**
	 * 게시글 정보 수정
	 * 
	 * @param conRound - 수정할 내용을 가진 게시글 객체
	 */
	public void updateConRound(ConRound conRound);

	/**
	 * 게시글 정보 삭제
	 * 
	 * @param conRound - 삭제할 게시글의 글번호
	 */
	public void deleteConRound(ConRound conRound);
	
	
	//공연좌석--------------------------------------------------------------
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Seat> selectSeatList(Paging paging);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @param paramData - search를 포함한 페이징 객체
	 * @return 총 게시글 수
	 */
	public int selectSeatCntAll(Paging paramData);

	public List<Seat> selectSeatListByConNo(Concert concert);

	public List<Seat> selectNormalSeatListByConNo(Concert concert);

	public List<Seat> selectVIPSeatListByConNo(Concert concert);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewSeat - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Seat selectSeat(Seat viewSeat);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param seat - 삽입할 게시글 정보
	 */
	public void insertSeat(Seat seat);
	
	/**
	 * 게시글 정보 수정
	 * 
	 * @param seat - 수정할 내용을 가진 게시글 객체
	 */
	public void updateSeat(Seat seat);

	/**
	 * 게시글 정보 삭제
	 * 
	 * @param seat - 삭제할 게시글의 글번호
	 */
	public void deleteSeat(Seat seat);
	
}
