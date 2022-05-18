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
	
	@Override
	public List<Wish> list(User userNo) {
		
		return wishListDao.selectList(userNo);
		
	}

	@Override
	public int countWish(User userNo) {
		
		return wishListDao.selectCntAll(userNo);
		
	}


}
