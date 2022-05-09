package com.skip.www.service.face;

import java.util.HashMap;

import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.User;

public interface MypageService {
	
	
	
	/**
	 *  공연 회원 등급 조회
	 * @param userNo -회원등급을 조회 할 유저번호
	 * 
	 */
	public ConUserLevel viewConLevel(int userNo);
	
	/**
	 * 전시 회원 등급 조회
	 * @param userNo -회원등급을 조회 할 유저번호
	 * @return
	 */
	public ExUserLevel viewExLevel(int userNo);



	/**
	 * 회원정보 수정
	 * @param updateUser -수정할 회원 정보
	 */
	public void updateUserinfo(User updateUser);

	/**
	 * 수정 할 회원 정보 조회
	 * @param userNo -회원등급을 수정 할 유저 번호
	 * @return
	 */
	public User viewUserInfo(int userNo);

	/**
	 * 회원탈퇴
	 * @param user -삭제할 유저 정보
	 * @return
	 */
	public boolean deleteUserInfo(User user);


	





	




	

}
