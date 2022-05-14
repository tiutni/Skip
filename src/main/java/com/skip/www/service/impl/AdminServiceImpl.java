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

import com.skip.www.dao.face.AdminDao;
import com.skip.www.dto.Admin;
import com.skip.www.dto.ExImg;
import com.skip.www.dto.Exhibition;
import com.skip.www.service.face.AdminService;
import com.skip.www.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;
	
	@Autowired private ServletContext context;
//	@Autowired private CommentDao commentDao;

	@Override
	public boolean login(Admin admin) {
		int loginChk = adminDao.selectCntAdmin(admin);

		if (loginChk > 0)
			
			return true;
			
			return false;
	}

	@Override
	public boolean join(Admin admin) {

		// 중복된 id인지 확인
		if (adminDao.selectCntById(admin) > 0) {

			return false;
		}

		// 관리자 생성(삽입)
		adminDao.insert(admin);

		// 관리자 생성 확인
		if (adminDao.selectCntById(admin) > 0) {

			return true;
		}

			return false;
		}

	@Override
	public void update(Admin admin) throws Exception {
		adminDao.update(admin);
		
		}

	@Override
	public boolean checkAuth(String adminAuth) {
		if (adminDao.selectAdminAuth(adminAuth) == 1) {
			
			return true;
		
			}
		
			return false;

			}

	
	//전시
	
	@Override
	public List<Exhibition> listExhibition(Paging paging) {
		
		return adminDao.selectExhibitionList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = adminDao.selectExhibitionCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());

		return paging;
	}
	
	@Override
	public Exhibition viewExhibition(Exhibition viewExhibition) {
		
		//상세보기 조회 결과 리턴
		return adminDao.selectExhibition(viewExhibition);
	}
	
	@Override
	@Transactional
	public void writeExhibition(Exhibition exhibition, MultipartFile file) {
		if( "".equals( exhibition.getExTitle() ) ) {
			exhibition.setExTitle("(제목없음)");
		}
		adminDao.insertExhibition(exhibition);
	
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
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, storedName);

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//-----------------------------------------------------

		ExImg exImg = new ExImg();
		exImg.setExNo( exhibition.getExNo() );
		exImg.setExImgOriginName(originName);
		exImg.setExImgStoredName(storedName);
		
		adminDao.insertExImg(exImg);
		
	}

	@Override
	public ExImg getAttachExImg(Exhibition viewExhibition) {
		return adminDao.selectExImgByExNo(viewExhibition);
	}

	@Override
	public ExImg getExImg(ExImg exImg) {
		return adminDao.selectExImgByExImgNo(exImg);
	}

	@Override
	public void updateExhibition(Exhibition exhibition) {
		
		if( "".equals( exhibition.getExTitle() ) ) {
			exhibition.setExTitle("(제목없음)");
		}
		adminDao.updateExhibition(exhibition);
		
	}
	
	@Override
	@Transactional
	public void updateExhibition(Exhibition exhibition, MultipartFile file) {
		
		this.updateExhibition(exhibition);
		
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
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, storedName);

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//-----------------------------------------------------

		ExImg exImg = new ExImg();
		exImg.setExNo( exhibition.getExNo() );
		exImg.setExImgOriginName(originName);
		exImg.setExImgStoredName(storedName);
		
		
		//게시글에 연결되어있는 기존의 모든 첨부파일 정보를 삭제한다
		adminDao.deleteExImg(exhibition);
		
		
		adminDao.insertExImg(exImg);
		
	}

	@Override
	@Transactional
	public void deleteExhibition(Exhibition exhibition) {
		
		adminDao.deleteExImg(exhibition);
		adminDao.deleteExhibition(exhibition);
		
	}

	@Override
	@Transactional
	public void activateExhibition(Exhibition exhibition) {
		adminDao.activateExhibition(exhibition);
	}

	@Override
	@Transactional
	public void unactivateExhibition(Exhibition exhibition) {
		adminDao.unactivateExhibition(exhibition);
	}

}
