package com.skip.www.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.MemberDao;
import com.skip.www.dto.User;
import com.skip.www.service.face.MemberService;
import com.skip.www.util.Paging;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberDao memberDao;
	
	@Override
	public List<User> list(Paging paging) {
		
		return memberDao.selectList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {

		//총 회원 수 조회
		int totalCount = memberDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
 		
		return paging;
	}

	@Override
	public void delete(User user) {

		memberDao.delete(user);
		
	}

	@Override
	public User view(User viewMember) {
		
		//상세보기 조회 결과 리턴
		return memberDao.select(viewMember);
	}

}
