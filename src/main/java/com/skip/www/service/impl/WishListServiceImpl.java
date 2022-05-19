package com.skip.www.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.WishListDao;
import com.skip.www.dto.User;
import com.skip.www.dto.Wish;
import com.skip.www.service.face.WishListService;

@Service
public class WishListServiceImpl implements WishListService {

	@Autowired WishListDao wishListDao;
	
	// 위시리스트 조회
	@Override
	public List<Wish> list(User userNo) {
		
		return wishListDao.selectList(userNo);
		
	}

	// 위시리스트의 위시 갯수 조회
	@Override
	public int countWish(User userNo) {
		
		return wishListDao.selectCntAll(userNo);
		
	}

	// 위시 삭제
	@Override
	public void delete(Wish wishNo) {

		wishListDao.delete(wishNo);
	}


}
