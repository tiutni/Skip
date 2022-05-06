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
