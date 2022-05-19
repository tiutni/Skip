package com.skip.www.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.skip.www.dto.Admin;
import com.skip.www.dto.ConImg;
import com.skip.www.dto.ConRound;
import com.skip.www.dto.ConSeatImg;
import com.skip.www.dto.Concert;
import com.skip.www.dto.ExImg;
import com.skip.www.dto.Exhibition;
import com.skip.www.util.Paging;

public interface AdminService {

	/**
	 * 로그인 인증
	 * 
	 * @param admin - 입력한 ID/PW 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(Admin admin);

	/**
	 * 관리자 생성
	 * 
	 * @param admin - 관리자 생성 정보
	 * @return 생성 결과
	 */
	public boolean join(Admin admin);

	/**
	 * 관리자 수정
	 * 
	 * @param admin - 관리자 수정 정보
	 * @throws Exception
	 */
	public void update(Admin admin) throws Exception;

	/**
	 * 관리자가입인증
	 * 
	 * @param adminAuth - 가입인증번호
	 * @return - 인증번호 일치
	 */
	public boolean checkAuth(String adminAuth);
	
	
	//전시--------------------------------------------------------------

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Exhibition> listExhibition(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPagingExhibition(Paging paramData);

	/**
	 * 게시글 상세보기
	 * 
	 * @param viewExhibition - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Exhibition viewExhibition(Exhibition viewExhibition);
	
	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param exhibition - 게시글 정보 DTO
	 * @param file - 첨부파일 정보 DTO
	 */
	public void writeExhibition(Exhibition exhibition, MultipartFile file);

	/**
	 * 게시글 수정 처리
	 * 
	 * @param exhibition - 게시글 정보 객체
	 */
	public void updateExhibition(Exhibition exhibition);

	/**
	 * 게시글 수정 처리
	 * 첨부파일 수정 처리
	 * 
	 * @param exhibition - 게시글 정보 객체
	 * @param file - 파일업로드 객체
	 */
	public void updateExhibition(Exhibition exhibition, MultipartFile file);

	/**
	 * 게시글 + 첨부파일 삭제 처리
	 * 
	 * @param exhibition - 삭제할 게시글의 글번호
	 */
	public void deleteExhibition(Exhibition exhibition);

	public void activateExhibition(Exhibition exhibition);

	public void unactivateExhibition(Exhibition exhibition);
	
	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewExhibition - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public ExImg getAttachExImg(Exhibition viewExhibition);
	
	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param exImg - 조회할 파일 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public ExImg getExImg(ExImg exImg);
	
	
	
	//공연--------------------------------------------------------------

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Concert> listConcert(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPagingConcert(Paging paramData);
	
	/**
	 * 게시글 상세보기
	 * 
	 * @param viewConcert - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Concert viewConcert(Concert viewConcert);
	
	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param concert - 게시글 정보 DTO
	 * @param fileConImg - 첨부파일 정보 DTO
	 * @param fileConSeatImg - 첨부파일 정보 DTO
	 */
	public void writeConcert(Concert concert, MultipartFile fileConImg, MultipartFile fileConSeatImg);

	/**
	 * 게시글 수정 처리
	 * 
	 * @param concert - 게시글 정보 객체
	 */
	public void updateConcert(Concert concert);

	/**
	 * 게시글 수정 처리
	 * 첨부파일 수정 처리
	 * 
	 * @param concert - 게시글 정보 객체
	 * @param fileConImg - 파일업로드 객체
	 * @param fileConSeatImg - 파일업로드 객체
	 */
	public void updateConcert(Concert concert, MultipartFile fileConImg, MultipartFile fileConSeatImg);

	/**
	 * 게시글 + 첨부파일 삭제 처리
	 * 
	 * @param concert - 삭제할 게시글의 글번호
	 */
	public void deleteConcert(Concert concert);

	public void activateConcert(Concert concert);

	public void unactivateConcert(Concert concert);

	
	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewConcert - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public ConImg getAttachConImg(Concert viewConcert);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param conImg - 조회할 파일 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public ConImg getConImg(ConImg conImg);

	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewConcert - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public ConSeatImg getAttachConSeatImg(Concert viewConcert);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param conSeatImg - 조회할 파일 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public ConSeatImg getConSeatImg(ConSeatImg conSeatImg);


}
