package com.skip.www.service.face;

import com.skip.www.dto.User;

public interface UserService {
	
	/**
	 * 로그인 인증 처리
	 * 
	 * @param user - 입력한 ID/PW 정보
	 * return 로그인 인증 결과
	 */
	public boolean login(User user);
}
