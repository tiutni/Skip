package com.skip.www.service.face;

import java.util.HashMap;
import java.util.List;

import com.skip.www.util.Paging;

public interface MyExreviewService {

	public Paging getExReviewPaging(String curPage, int userNo);

	public List<HashMap<String, Object>> reviewList(Paging paging);
	
}
