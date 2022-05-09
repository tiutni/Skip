package com.skip.www.service.face;

import java.util.HashMap;

import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.User;

public interface UserService {
	
	/**
	 * 로그인 인증 처리
	 * @param user - 입력한 ID/PW 정보
	 * return 로그인 인증 결과
	 */
	public boolean login(User user);
	
	/**
	 * 카카오 사용자 AccessToken 발급
	 * @param authorizeCode - 인가 코드 정보
	 * @return 카카오 사용자 AccessToken
	 */
	public String getAccessToken(String authorizeCode);
	
	/**
	 * 카카오 사용자 정보 조회
	 * @param accessToken - 토큰 정보
	 * @return 사용자 정보
	 */
	public HashMap<String, Object> getUserInfo(String access_Token);
	
	/**
	 * 카카오 사용자 ID 중복 확인
	 * @param userInfo - 카카오 사용자 ID 정보
	 * @return ID 중복 결과
	 */
	public boolean kakaoIdCheck(HashMap<String, Object> userInfo);
	
	/**
	 * 사용자의 회원번호 조회
	 * @param userId - 회원번호를 조회하려는 사용자의 ID 정보
	 * @return 사용자의 회원번호
	 */
	public int getUserNo(String userId);
	
	/**
	 * 회원 가입
	 * @param user - 신규 회원 정보
	 * @return 회원 가입 결과
	 */
	public boolean join(User user);
	
	

	





	




	

}
