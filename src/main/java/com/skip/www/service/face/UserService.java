package com.skip.www.service.face;

import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.User;

public interface UserService {
	
	/**
	 * 로그인 인증 처리
	 * 
	 * @param user - 입력한 ID/PW 정보
	 * return 로그인 인증 결과
	 */
	public boolean login(User user);

	/**
	 * 회원 가입
	 * 
	 * @param user - 신규 회원 정보
	 * @return 회원 가입 결과
	 */
	public boolean join(User user);
	
	
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
	 
	
	
}
