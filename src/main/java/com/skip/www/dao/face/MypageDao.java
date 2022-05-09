package com.skip.www.dao.face;

import java.util.HashMap;

import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.User;

public interface MypageDao {

	
	
	/**
	 * 공연등급레벨을 조회한다
	 * @param userNo -회원등급을 조회할 유저 번호
	 * @return
	 */
	public ConUserLevel selectByConUserLevelconuserlevelno(int userNo);

	/**
	 * 전시등급레벨을 조회한다
	 * @param userNo -회원등급을 조회할 유저 번호
	 * @return
	 */
	public ExUserLevel selectByExUserLevelconuserlevelno(int userNo);


	public User selectUserinfo(int userNo);

	public void updateUserInfo(User updateUser);

	
	/**
	 * 회원정보 삭제
	 * @param user -삭제할 회원 정보
	 * @return
	 */
	public int deleteUserinfo(User user);

	/**
	 * 탈퇴 할 회원의 id와 비밀번호 조회
	 * @param userNo -조회할 no,비밀번호를 가진 객체
	 * @return
	 */

	public int selectcountUserInfo(User userNo);






}
