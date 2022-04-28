package com.skip.www.dao.face;

import com.skip.www.dto.User;

public interface UserDao {

	/**
	 * ID/PW가 일치하는 사용자 수를 반환한다
	 * 
	 * @param user - 조회할 ID/PW를 가진 객체
	 * @return 조회된 행 수
	 */
	public int selectCntUser(User user);

	User selectByUseruserno(int userno);

}
