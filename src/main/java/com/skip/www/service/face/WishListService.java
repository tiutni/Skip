package com.skip.www.service.face;

import java.util.List;

import com.skip.www.dto.User;
import com.skip.www.dto.Wish;

public interface WishListService {

	/**
	 * 위시리스트 조회
	 * 
	 * @param userNo - 조회할 회원번호
	 * @return 조회된 위시리스트 목록
	 */
	public List<Wish> list(User userNo);
	/**
	 * 위시리스트의 수 조회
	 * 
	 * @param userNo - 조회할 회원번호
	 * @return
	 */
	public int countWish(User userNo);
}
