package com.skip.www.dao.face;

import com.skip.www.dto.User;

public interface UserDao {

	/**
	 * ID/PW가 일치하는지 확인한다
	 * 
	 * @param user - 조회할 ID/PW를 가진 객체
	 * @return 조회된 행 수
	 */
	public int selectCntUser(User user);

	/**
	 * 중복된 ID가 존재하는지 확인한다
	 * 
	 * @param user - 조회할 ID를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 존재)
	 */
	public int selectCntById(User user);
	
	/**
	 * 신규 회원 정보를 삽입한다
	 * 
	 * @param user - 신규 회원 정보
	 */
	public void insert(User user);
	
	
	
	User selectByUseruserno(int userno);

}
