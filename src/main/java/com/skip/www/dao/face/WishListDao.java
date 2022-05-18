package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.User;
import com.skip.www.dto.Wish;

public interface WishListDao {

	/**
	 * 회원번호로 위시리스트 목록 조회
	 * 
	 * @param userNo - 조회할 회원번호
	 * @return 조회된 위시리스트 목록
	 */
	public List<Wish> selectList(User userNo);

	/**
	 * 회원의 전체 위시리스트 수 조회
	 * 
	 * @param userNo - 조회할 회원번호
	 * @return
	 */
	public int selectCntAll(User userNo);

}
