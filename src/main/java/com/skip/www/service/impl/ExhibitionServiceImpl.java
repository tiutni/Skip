package com.skip.www.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.ExhibitionDao;
import com.skip.www.dto.ExReview;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.Wish;
import com.skip.www.service.face.ExhibitionService;
import com.skip.www.util.Paging;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {

	private static final Logger logger = LoggerFactory.getLogger(ExhibitionServiceImpl.class);
	
	@Autowired ExhibitionDao exhibitionDao;
	
	@Override
	public Paging getExhibitionPaging(String curPage, String search) {
		int page = 0;
		
		if( curPage != null && !"".equals(curPage) ) {
			page = Integer.parseInt(curPage);
		}
		
		int listCount = 12;
		
		//게시글 수 조회하기
		int totalCount = exhibitionDao.selectCntAll(search);
		
		//Paging 객체 생성 - 페이징 계산
		Paging paging = new Paging(totalCount, page, listCount);
		
		return paging;
	}

	@Override
	public List<Exhibition> getExhibitionList(Paging paging) {
		return exhibitionDao.selectAllConcert(paging);
	}

	@Override
	public Exhibition getExhibition(int exNo) {
		return exhibitionDao.selectExhibitionByExNo(exNo);
	}

	@Override
	public Paging getExhibitionReviewPaging(String curPage, int exNo) {
		int page = 0;
		
		if( curPage != null && !"".equals(curPage) ) {
			page = Integer.parseInt(curPage);
		}
		
		int listCount = 5;
		
		//게시글 수 조회하기
		int totalCount = exhibitionDao.selectCntAllReview(exNo);
		
		//Paging 객체 생성 - 페이징 계산
		Paging paging = new Paging(totalCount, page, listCount);
		
		return paging;
	}
	
	@Override
	public List<ExReview> reviewList(Paging paging) {
		return exhibitionDao.selectExReviewListByExNo(paging);
	}

	@Override
	public int getAllUser(int exNo) {
		int cntAllUser = exhibitionDao.cntAllUser(exNo);
		
		return cntAllUser;
	}

	@Override
	public List<ExReview> getAllStar(int exNo) {
		return exhibitionDao.selectAllStar(exNo);
	}

	@Override
	public boolean isWish(Wish wish) {
		int result = exhibitionDao.selectWishByExNoUserNo(wish);
		
		if(result > 0) {
			return true;
			
		} else {
			return false;
			
		}
	}

	@Override
	public void insertReview(ExReview exReview) {
		exhibitionDao.insertExReview(exReview);	
	}

	@Override
	public boolean getWish(Wish wish) {
		logger.info("wish : {}", wish);
		
		int result = exhibitionDao.selectWishByExNoUserNo(wish);
		
		if(result > 0) {
			logger.info("result : {}", result);
			exhibitionDao.deleteWishByExNoUserNo(wish);
			return true;
			
		} else {
			logger.info("result : {}", result);
			exhibitionDao.insertWish(wish);
			return false;
			
		}
	}

	@Override
	public List<Exhibition> getTopExhibitionList() {
		return exhibitionDao.selectExhibitionTopList();
	}

	@Override
	public boolean isTicketing(HashMap<Object, String> map) {
		
		int result = exhibitionDao.selectCntOrderByExNoUserNo(map);
		
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
		
		int result = exhibitionDao.selectCntReviewByExNoUserNo(map);
		
		if(result > 0) {
			logger.info("result : {}", result);
			return false;
			
		} else {
			logger.info("result : {}", result);
			return true;
		
		}

	}

	@Override
	public void delete(int exReviewNo) {
		exhibitionDao.deleteExReviewByExReviewNo(exReviewNo);
		
	}

	@Override
	public List<Exhibition> getTop6ExhibitionList() {
		return exhibitionDao.selectTop6ExList();
	}

}
