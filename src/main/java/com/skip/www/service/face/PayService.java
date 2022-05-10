package com.skip.www.service.face;

import com.skip.www.dto.User;

public interface PayService {
	/**
	 * 회원정보 불러오기
	 * 
	 * @param userNo
	 * @return userInfo
	 */
	public User selectUserInfo(int userNo);

}
