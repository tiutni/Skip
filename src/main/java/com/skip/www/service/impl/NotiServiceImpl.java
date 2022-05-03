package com.skip.www.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.NotiDao;
import com.skip.www.dto.Noti;
import com.skip.www.dto.NotiFile;
import com.skip.www.service.face.NotiService;
import com.skip.www.util.Paging;

@Service
public class NotiServiceImpl implements NotiService {

	@Autowired NotiDao notiDao;
	
	@Override
	public List<Noti> list(Paging paging) {
		
		return notiDao.selectList(paging);
		
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = notiDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());

		return paging;
	}

	@Override
	public Noti view(Noti viewNoti) {
		
		//상세보기 조회 결과 리턴
		return notiDao.select(viewNoti);
	}

	@Override
	public NotiFile getAttachNotiFile(Noti viewNoti) {
		
		return notiDao.selectNotiFileByNotiNo(viewNoti);
		
	}

	@Override
	public NotiFile getNotiFile(NotiFile notiFile) {
		
		return notiDao.selectNotiFileByNotiFileNo(notiFile);
		
	}




	
}















