package com.skip.www.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.skip.www.dao.face.MypageDao;
import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.User;
import com.skip.www.service.face.MypageService;


@Service
public  class MypageServiceImpl implements MypageService {

	private static final Logger logger = LoggerFactory.getLogger(MypageService.class);

	@Autowired MypageDao mypageDao;


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

	
	




}
















