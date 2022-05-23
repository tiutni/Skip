package com.skip.www.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.ConcertDao;
import com.skip.www.dao.face.ExhibitionDao;
import com.skip.www.dao.face.MypageDao;
import com.skip.www.dao.face.PayDao;
import com.skip.www.dto.Concert;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.User;
import com.skip.www.service.face.PayService;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	private MypageDao mypageDao;
	@Autowired
	private ConcertDao concertDao;
	@Autowired
	private ExhibitionDao exhibitionDao;
	@Autowired
	private PayDao payDao;
	
	// 회원번호로 회원정보 조회
	@Override
	public User selectUserInfo(int userNo) {
		
		return mypageDao.selectUserinfo(userNo);
	}

	// 공연번호로 공연정보 조회
	@Override
	public Concert selectConTitle(int conNo) {
		
		return concertDao.selectConcertByConNo(conNo);
	}

	// 전시번호로 전시정보 조회
	@Override
	public Exhibition selectExTitle(int exNo) {
		
		return exhibitionDao.selectExhibitionByExNo(exNo);
	}

	@Override
	public void insertBill(HashMap<Object, String> map) {		
		payDao.insertOrder(map);
		
	}

	@Override
	public String getConRoundNo(HashMap<Object, String> con) {
		return payDao.selectConRoundNoByConNoConRound(con);
	}

	@Override
	public String getSeatSeq(HashMap<Object, String> con) {
		return payDao.selectConNoConRoundNo(con);
	}

	@Override
	public void insertConOrderTicket(HashMap<Object, String> con) {
		payDao.insertConOrderTicket(con);
	}

	@Override
	public String getOrderNo() {
		return payDao.selectOrderNoSeq();
	}

	@Override
	public void insertExOrderTicket(HashMap<Object, String> ex) {
		payDao.insertExOrderTicket(ex);
		
	}

	@Override
	public void insertPay(HashMap<Object, String> pay) {
		payDao.insertPay(pay);
		
	}
	
}
