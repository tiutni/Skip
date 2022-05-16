package com.skip.www.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.MypageDao;
import com.skip.www.dao.face.PayDao;
import com.skip.www.dto.Pay;
import com.skip.www.dto.User;
import com.skip.www.service.face.PayService;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	private PayDao payDao;
	
	@Override
	public User selectUserInfo(int userNo) {
		
		return mypageDao.selectUserinfo(userNo);
	}
	
}
