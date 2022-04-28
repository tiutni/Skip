package com.skip.www.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.UserDao;
import com.skip.www.dto.User;
import com.skip.www.service.face.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired UserDao userDao;

	@Override
	public boolean login(User user) {
		int loginChk = userDao.selectCntUser(user);
		
		if (loginChk > 0) {
			return true;
		}
		return false;
	}

}
