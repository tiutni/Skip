package com.skip.www.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.QnaDao;
import com.skip.www.dto.QnA;
import com.skip.www.service.face.QnaService;
import com.skip.www.util.Paging;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired QnaDao qnaDao;
	
	@Override
	public List<QnA> list(Paging paging) {
		
		return qnaDao.selectList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = qnaDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());

		return paging;
	}

}























