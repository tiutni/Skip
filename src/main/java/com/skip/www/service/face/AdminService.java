package com.skip.www.service.face;

import com.skip.www.dto.Admin;

public interface AdminService {

	/**
	 * 로그인 인증
	 * 
	 * @param admin - 입력한 ID/PW 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(Admin admin);

	/**
	 * 관리자 생성
	 * 
	 * @param admin - 관리자 생성 정보
	 * @return 생성 결과
	 */
	public boolean join(Admin admin);

	/**
	 * 관리자 수정
	 * 
	 * @param admin - 관리자 수정 정보
	 * @throws Exception
	 */
	public void update(Admin admin) throws Exception;

	/**
	 * 관리자가입인증
	 * 
	 * @param adminAuth - 가입인증번호
	 * @return - 인증번호 일치
	 */
	public boolean checkAuth(String adminAuth);
	
	

}
