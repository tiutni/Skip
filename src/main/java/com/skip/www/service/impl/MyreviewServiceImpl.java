package com.skip.www.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.MyreviewDao;
import com.skip.www.dto.ConReview;
import com.skip.www.service.face.MyreviewService;
import com.skip.www.util.Paging;

@Service
public class MyreviewServiceImpl implements MyreviewService {

	private static final Logger logger = LoggerFactory.getLogger(ConcertServiceImpl.class);


	@Autowired MyreviewDao myreviewDao;


	@Override
	public Paging getConcertReviewPaging(String curPage, int userNo) {
		int page = 0;

		if( curPage != null && !"".equals(curPage) ) {
			page = Integer.parseInt(curPage);
		}

		int listCount = 5;

		//게시글 수 조회하기
		int totalCount = myreviewDao.selectCntAllReview(userNo);

		//Paging 객체 생성 - 페이징 계산
		Paging paging = new Paging(totalCount, page, listCount);

		return paging;
	}


	@Override
	public List<HashMap<String, Object>> reviewList(Paging paging) {
		return myreviewDao.selectConReviewListByConNo(paging);
	}


}
