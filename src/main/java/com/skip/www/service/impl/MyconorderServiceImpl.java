package com.skip.www.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.MyconorderDao;
import com.skip.www.dto.ConOrderTicket;
import com.skip.www.dto.ExOrderTicket;
import com.skip.www.service.face.MyconorderService;
import com.skip.www.util.Paging;

@Service
public class MyconorderServiceImpl implements MyconorderService{
	
	private static final Logger logger = LoggerFactory.getLogger(MyconorderService.class);

	@Autowired MyconorderDao myconorderDao;

	@Override
	public Paging getPaging(String curPage, int userNo) {
		int page = 0;

		if( curPage != null && !"".equals(curPage) ) {
			page = Integer.parseInt(curPage);
		}

		int listCount = 10;
		
		logger.info("getPaging- {}", userNo);

		//총 게시글 수 조회
		int totalCount = myconorderDao.selectCntAll(userNo);

		//페이징 계산
		Paging paging = new Paging(totalCount, page, listCount);

		logger.info("Paging : {}", paging);

		return paging;
	}

	@Override
	public List<ConOrderTicket> conlist(Paging paging) {
		return myconorderDao.selectconList(paging);
	}

	

	
	
}
