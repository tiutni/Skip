package com.skip.www.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.skip.www.dao.face.MypageDao;
import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.QnA;
import com.skip.www.dto.QnAFile;
import com.skip.www.dto.User;
import com.skip.www.service.face.MypageService;
import com.skip.www.util.Paging;


@Service
public  class MypageServiceImpl implements MypageService {

	private static final Logger logger = LoggerFactory.getLogger(MypageService.class);

	@Autowired MypageDao mypageDao;
	@Autowired private ServletContext context;

	@Override
	public ConUserLevel viewConLevel(int userNo) {

		logger.info("info() 호출");

		return mypageDao.selectByConUserLevelconuserlevelno(userNo);
	}

	@Override
	public ExUserLevel viewExLevel(int userNo) {
		logger.info("info()호출");
		return mypageDao.selectByExUserLevelconuserlevelno(userNo);
	}



	@Override
	public User viewUserInfo(int userNo) {
		return mypageDao.selectUserinfo(userNo);
	}


	@Override
	public void updateUserinfo(User updateUser) {
		mypageDao.updateUserInfo(updateUser);
	}

	//회원탈퇴를 위한 회원 정보 검증
	@Override
	public boolean deleteUserInfo(User user) {


		if( mypageDao.selectcountUserInfo(user) > 0 ) {
			mypageDao.deleteUserinfo(user);
			return true;
		}

		return false;


	}

	@Override
	public List<QnA> list(Paging paging) {

		return mypageDao.selectList(paging);
	}

	@Override
	public Paging getPaging(String curPage, int userNo) {

		int page = 0;

		if( curPage != null && !"".equals(curPage) ) {
			page = Integer.parseInt(curPage);
		}

		int listCount = 10;

		//총 게시글 수 조회
		int totalCount = mypageDao.selectCntAll(userNo);

		//페이징 계산
		Paging paging = new Paging(totalCount, page, listCount);

		logger.info("Paging : {}", paging);

		return paging;
	}

	@Override
	public QnA view(QnA viewQna) {
		return mypageDao.select(viewQna);
	}

	@Override
	@Transactional
	public void write(QnA qna, MultipartFile qnafile) {

		if( "".equals( qna.getQnaTitle() ) ) {
			qna.setQnaTitle("(제목없음)");
		}

		mypageDao.insertQna(qna);

		//-----------------------------------------------------


		//빈 파일일 경우
		if( qnafile.getSize() <= 0 ) {
			return;
		}

		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}

		//파일이 저장될 이름
		String qnaFileOriginName = qnafile.getOriginalFilename();
		String qnaFileStoredName = qnaFileOriginName + UUID.randomUUID().toString().split("-")[4];
		String qnaFilePath = "upload";
		int qnaFileSize = (int)qnafile.getSize();
		
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, qnaFileStoredName);

		try {
			qnafile.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//-----------------------------------------------------

		QnAFile qnaFile = new QnAFile();
		qnaFile.setQnaNo( qna.getQnaNo() );
		qnaFile.setQnaFileOriginName(qnaFileOriginName);
		qnaFile.setQnaFileStoredName(qnaFileStoredName);
		qnaFile.setQnaFilePath(qnaFilePath);
		qnaFile.setQnaFileSize(qnaFileSize);

//		logger.info("qna파일{}- ",qna);
		mypageDao.insertQnaFile(qnaFile);

		logger.info("파일{}- ",qnaFile);


	}

	@Override
	public QnAFile getAttachFile(QnA viewQna) {
		return mypageDao.selectQnaFileByQnaNo(viewQna);

	}

	@Override
	public QnAFile getFile(QnAFile qnaFile) {
		return mypageDao.selectQnaFileByQnaFileNo(qnaFile);

	}

//	@Override
//	public void qnaupdate(QnA qna, MultipartFile file) {
//		// TODO Auto-generated method stub
//		
//	}

}






















