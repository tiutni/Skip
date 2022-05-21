package com.skip.www.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.skip.www.dao.face.NotiDao;
import com.skip.www.dto.Noti;
import com.skip.www.dto.NotiFile;
import com.skip.www.service.face.NotiService;
import com.skip.www.util.Paging;


@Service
public class NotiServiceImpl implements NotiService {

	@Autowired NotiDao notiDao;
	@Autowired private ServletContext context;
	
	// 공지사항 목록 조회
	@Override
	public List<Noti> list(Paging paging) {
		
		return notiDao.selectList(paging);
		
	}

	// 공지사항 페이징
	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = notiDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());

		return paging;
	}

	// 공지사항 상세보기
	@Override
	public Noti view(Noti viewNoti) {
		
		//상세보기 조회 결과 리턴
		return notiDao.selectNoti(viewNoti);
	}


	//공지사항 작성
	@Override
	@Transactional
	public void write(Noti noti, MultipartFile file) {
	
		if( "".equals( noti.getNotiTitle() ) ) {
			noti.setNotiTitle("(제목이 없습니다)");
		}
		notiDao.insertNoti(noti);
	
		//-----------------------------------------------------
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}

		//파일이 저장될 이름
		String notiFileOriginName = file.getOriginalFilename();
		String notiFileStoredName = notiFileOriginName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, notiFileStoredName);

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//-----------------------------------------------------

		NotiFile notiFile = new NotiFile();
		notiFile.setNotiNo( noti.getNotiNo() );
		notiFile.setNotiFileOriginName(notiFileOriginName);
		notiFile.setNotiFileStoredName(notiFileStoredName);
		
		notiDao.insertFile(notiFile);
		
	}
	
	// 공지사항 번호로 첨부파일 조회
	@Override
	public NotiFile getAttachFile(Noti viewNoti) {
		
		return notiDao.selectNotiFileByNotiNo(viewNoti);
		
	}

	// 첨부파일 번호로 첨부파일 조회
	@Override
	public NotiFile getFile(NotiFile notiFile) {
		
		return notiDao.selectNotiFileByNotiFileNo(notiFile);
		
	}

	// 공지사항 수정(글)
	@Override
	public void update(Noti noti) {
		
		if( "".equals( noti.getNotiTitle() ) ) {
			noti.setNotiTitle("(제목없음)");
		}
		notiDao.update(noti);
	
	}

	// 공지사항 수정(글+파일)
	@Override
	@Transactional
	public void update(Noti noti, MultipartFile file) {
		
		this.update(noti);
		
		//-------------------------------------------------------
		
		//업로드된 파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}

		//파일이 저장될 이름
		String notiFileOriginName = file.getOriginalFilename();
		String notiFileStoredName = notiFileOriginName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, notiFileStoredName);

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//-----------------------------------------------------

		NotiFile notiFile = new NotiFile();
		notiFile.setNotiNo( noti.getNotiNo() );
		notiFile.setNotiFileOriginName(notiFileOriginName);
		notiFile.setNotiFileStoredName(notiFileStoredName);
		
		
		//게시글에 연결되어있는 기존의 모든 첨부파일 정보를 삭제한다
		notiDao.deleteFile(noti);
		
		
		notiDao.insertFile(notiFile);
		
	}

	// 공지사항 삭제
	@Override
	public void delete(Noti noti) {
	
		notiDao.deleteFile(noti);
		notiDao.delete(noti);
		
	}




	
}















