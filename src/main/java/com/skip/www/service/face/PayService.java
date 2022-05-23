package com.skip.www.service.face;

import java.util.HashMap;
import java.util.List;

import com.skip.www.dto.Concert;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.User;

public interface PayService {
	/**
	 * 주문한 회원정보 조회
	 * 
	 * @param userNo - 주문자 회원번호
	 * @return userInfo - 주문자 회원정보
	 */
	public User selectUserInfo(int userNo);

	/**
	 * 공연번호로 공연정보 조회
	 * 
	 * @param conNo - 조회할 공연번호
	 * @return 조회된 공연 정보
	 */
	public Concert selectConTitle(int conNo);

	/**
	 * 전시번호로 전시정보 조회
	 * 
	 * @param exNo - 조회할 전시번호
	 * @return 조회된 전시 정보
	 */
	public Exhibition selectExTitle(int exNo);

	public void insertBill(HashMap<Object, String> map);

	public String getOrderNo();

	public String getConRoundNo(HashMap<Object, String> con);

	public String getSeatSeq(HashMap<Object, String> con);

	public void insertConOrderTicket(HashMap<Object, String> con);

	public void insertExOrderTicket(HashMap<Object, String> ex);

	public void insertPay(HashMap<Object, String> pay);



}
