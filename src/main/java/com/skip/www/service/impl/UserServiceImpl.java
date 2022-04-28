package com.skip.www.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.UserDao;
import com.skip.www.dto.User;
import com.skip.www.service.face.UserService;


@Service
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired UserDao userDao;

	@Override
	public boolean login(User user) {
		int loginChk = userDao.selectCntUser(user);
		
		if (loginChk > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean join(User user) {
		
		// ID 중복 확인
		if(userDao.selectCntById(user) > 0 ) {
			return false;
		}
		
		// 회원 가입
		userDao.insert(user);
		
		// 회원가입 결과 확인
		if(userDao.selectCntById(user) > 0 ) {
			
			return true;
		}
		
		return false;
	}
	
	@Override
	public User viewUserInfo(int userno) {

		logger.info("viewUserInfo() 호출");
		
		return userDao.selectByUseruserno(userno);
	}

}
