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
	 * 카카오 회원 AccessToken 발급
	 * @param authorizeCode - 인가 코드 정보
	 * @return 카카오 회원 AccessToken
	 */
	public String getAccessToken(String authorizeCode);
	
	/**
	 * 카카오 회원 정보 조회
	 * @param accessToken - 토큰 정보
	 * @return 회원 정보
	 */
	public HashMap<String, Object> getUserInfo(String access_Token);
	
	/**
	 * 카카오 회원 ID 중복 확인
	 * @param userInfo - 카카오 회원 ID 정보
	 * @return ID 중복 결과
	 */
	public boolean kakaoIdCheck(HashMap<String, Object> userInfo);
	
	/**
	 * 회원 번호 조회
	 * @param userId - 회원 번호를 조회하려는 회원의 ID 정보
	 * @return 회원 번호
	 */
	public int getUserNo(String userId);
	
	/**
	 * 회원 가입
	 * @param user - 신규 회원 정보
	 * @return 회원 가입 결과
	 */
	public boolean join(User user);
	
	/**
	 * 회원 ID 중복 확인
	 * @param userId - 회원 ID 정보
	 * @return ID 중복 결과
	 */
	public int checkId(User userId);
	
	/**
	 * 회원 닉네임 중복 확인
	 * @param userNick - 회원 닉네임 정보
	 * @return 닉네임 중복 결과
	 */
	public int checkNick(User userNick);
	
	/**
	 * 회원 이메일 중복 확인
	 * @param userEmail - 회원 이메일 정보
	 * @return 이메일 중복 결과
	 */
	public int checkEmail(User userEmail);
	
	/**
	 * 회원 주민등록번호 중복 확인
	 * @param userRrn - 회원 주민등록번호 정보
	 * @return 주민등록번호 중복 결과
	 */
	public int checkRrn(User userRrn);
	
	/**
	 * 회원 핸드폰 번호 중복 확인
	 * @param userPhone - 회원 핸드폰 번호 정보
	 * @return 핸드폰 번호 중복 결과
	 */
	public int checkPhone(User userPhone);
	
	/**
	 * 가입된 회원인지 확인
	 * @param user - 신규 회원 정보
	 * @return 가입 결과
	 */
	public boolean idCheck(User user);
	
	/**
	 * ID 찾기
	 * @param user - 회원 정보
	 * @return 회원 ID
	 */
	public String findId(User user);
	
	/**
	 * PW 찾기(임시비밀번호 생성)
	 * @param user - 회원 정보
	 */
	public void findPw(User user);
	
	/**
	 * PW 찾기(임시비밀번호) 이메일 발송
	 * @param user
	 */
	public void sendPwByEmail(User user);
}
