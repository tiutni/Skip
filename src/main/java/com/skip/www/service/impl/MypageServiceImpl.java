package com.skip.www.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.skip.www.dao.face.MypageDao;
import com.skip.www.dao.face.QnaDao;
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
		
		int listCount = 5;
		
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
	public void write(QnA qna, MultipartFile file) {
		mypageDao.insertQna(qna);
		
		
		
	}

	@Override
	public QnAFile getAttachFile(QnA viewQna) {
		return mypageDao.selectBoardFileByBoardNo(viewQna);

	}

	@Override
	public QnAFile getFile(QnAFile qnaFile) {
		return mypageDao.selectBoardFileByFileNo(qnaFile);

	}

}
	





















