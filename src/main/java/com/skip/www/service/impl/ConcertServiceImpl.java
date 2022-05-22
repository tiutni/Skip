package com.skip.www.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.ConcertDao;
import com.skip.www.dto.ConReview;
import com.skip.www.dto.ConRound;
import com.skip.www.dto.ConSeatImg;
import com.skip.www.dto.Concert;
import com.skip.www.dto.Seat;
import com.skip.www.dto.Wish;
import com.skip.www.service.face.ConcertService;
import com.skip.www.util.Paging;

@Service
public class ConcertServiceImpl implements ConcertService {

	private static final Logger logger = LoggerFactory.getLogger(ConcertServiceImpl.class);
	
	@Autowired ConcertDao concertDao;
	
	@Override
	public Paging getConcertPaging(String curPage, String search) {
		
		int page = 0;
		
		if( curPage != null && !"".equals(curPage) ) {
			page = Integer.parseInt(curPage);
		}
		
		int listCount = 12;
		
		//게시글 수 조회하기
		int totalCount = concertDao.selectCntAll(search);
		
		//Paging 객체 생성 - 페이징 계산
		Paging paging = new Paging(totalCount, page, listCount);
		
		return paging;
		
	}

	@Override
	public List<Concert> getConcertList(Paging paging) {
		return concertDao.selectAllConcert(paging);
	}

	@Override
	public Concert getConcert(int conNo) {
		return concertDao.selectConcertByConNo(conNo);
	}
	
	@Override
	public Paging getConcertReviewPaging(String curPage, int conNo) {
		
		int page = 0;
		
		if( curPage != null && !"".equals(curPage) ) {
			page = Integer.parseInt(curPage);
		}
		
		int listCount = 5;
		
		//게시글 수 조회하기
		int totalCount = concertDao.selectCntAllReview(conNo);
		
		//Paging 객체 생성 - 페이징 계산
		Paging paging = new Paging(totalCount, page, listCount);
		
		return paging;
	}

	@Override
	public List<ConReview> reviewList(Paging paging) {
		return concertDao.selectConReviewListByConNo(paging);
	}

	@Override
	public void insertReview(ConReview conReview) {
		concertDao.insertConReview(conReview);
	}

	@Override
	public boolean getWish(Wish wish) {
		logger.info("wish : {}", wish);
		
		int result = concertDao.selectWishByConNoUserNo(wish);
		
		if(result > 0) {
			logger.info("result : {}", result);
			concertDao.deleteWishByConNoUserNo(wish);
			return true;
			
		} else {
			logger.info("result : {}", result);
			concertDao.insertWish(wish);
			return false;
			
		}
		
	}

	@Override
	public boolean isWish(Wish wish) {
		
		int result = concertDao.selectWishByConNoUserNo(wish);
		
		if(result > 0) {
			return true;
			
		} else {
			return false;
			
		}
		
	}

	@Override
	public List<ConReview> getAllStar(int conNo) {
		return concertDao.selectAllStar(conNo);
	}

	@Override
	public int getAllUser(int conNo) {
		
		int cntAllUser = concertDao.cntAllUser(conNo);
		
		return cntAllUser;
	}

	@Override
	public List<Concert> getTop3ConcertList() {
		return concertDao.selectConcertTopList();
	}

	@Override
	public boolean isTicketing(HashMap<Object, String> map) {
		
		int result = concertDao.selectCntOrderByConNoUserNo(map);
		
		if(result > 0) {
			logger.info("result : {}", result);
			return true;
			
		} else {
			logger.info("result : {}", result);
			return false;
		
		}
		
	}

	@Override
	public boolean isReview(HashMap<Object, String> map) {

		int result = concertDao.selectCntReviewByConNoUserNo(map);
		
		if(result > 0) {
			logger.info("result : {}", result);
			return false;
			
		} else {
			logger.info("result : {}", result);
			return true;
		
		}
		
	}

	@Override
	public List<ConRound> conRoundList(int conNo) {
		return concertDao.selectConRoundListByConNo(conNo);
	}

	@Override
	public void delete(int conReviewNo) {
		concertDao.deleteConReviewByConReviewNo(conReviewNo);
	}

	@Override
	public List<Seat> getSeatList(HashMap<Object, String> map) {
		return concertDao.selectSeatListByConNoConRound(map);
	}

	@Override
	public int getVIPSeatPrice(int conNo) {
		return concertDao.selectVIPSeatPriceByConNo(conNo);
	}

	@Override
	public int getBasicSeatPrice(int conNo) {
		return concertDao.selectBasicSeatPriceByConNo(conNo);
	}

	@Override
	public List<Seat> getUnreservedSeatList(HashMap<Object, String> map) {
		return concertDao.selectUnreservedSeatListByConNoDateConRound(map);
	}

	@Override
	public ConSeatImg getConSeatImg(int conNo) {
		return concertDao.selectConSeatimgByConNo(conNo);
	}

	@Override
	public List<Concert> getTop6ConcertList() {
		return concertDao.selectTop6ConList();
	}


}
