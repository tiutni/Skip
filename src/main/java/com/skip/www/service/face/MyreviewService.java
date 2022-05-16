package com.skip.www.service.face;

import java.util.HashMap;
import java.util.List;

import com.skip.www.dto.ConReview;
import com.skip.www.util.Paging;


public interface MyreviewService {

	


	public Paging getConcertReviewPaging(String curPage, int userNo);

	public List<HashMap<String, Object>> reviewList(Paging paging);

	


}
