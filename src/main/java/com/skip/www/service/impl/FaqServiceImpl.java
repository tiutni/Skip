package com.skip.www.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.FaqDao;
import com.skip.www.dto.FAQ;
import com.skip.www.service.face.FaqService;
import com.skip.www.util.Paging;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired FaqDao faqDao;
	
	@Override
	public List<FAQ> list(Paging paging) {
		
		return faqDao.selectList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 자주 묻는 글 수 조회
		int totalCount = faqDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}

	@Override
	public FAQ view(FAQ viewFaq) {
		
		//상세보기 조회 결과 리턴
		return faqDao.select(viewFaq);
	}

	@Override
	public void write(FAQ faq) {
		
		if( "".equals( faq.getFaqTitle() ) ) {
			faq.setFaqTitle("(제목이 없습니다)");
			}
			faqDao.insertFaq(faq);
		}

	@Override
	public void update(FAQ faq) {

		if( "".equals( faq.getFaqTitle() ) ) {
			faq.setFaqTitle("(제목없음)");
		}
		faqDao.update(faq);
		
	}

	@Override
	public void delete(FAQ faq) {
		
		faqDao.delete(faq);
		
	}
}
