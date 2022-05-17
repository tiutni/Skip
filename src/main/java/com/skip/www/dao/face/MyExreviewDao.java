package com.skip.www.dao.face;

import java.util.HashMap;
import java.util.List;

import com.skip.www.util.Paging;

public interface MyExreviewDao {


	public int selectCntAllReview(int userNo);

	public List<HashMap<String, Object>> selectExReviewListByExNo(Paging paging);



}
