package com.skip.www.dao.face;

import java.util.HashMap;
import java.util.List;

import com.skip.www.dto.ExReview;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.Wish;
import com.skip.www.util.Paging;

public interface ExhibitionDao {

	public int selectCntAll(String search);

	public List<Exhibition> selectAllConcert(Paging paging);

	public Exhibition selectExhibitionByExNo(int exNo);
	
	public int selectCntAllReview(int exNo);

	public List<ExReview> selectExReviewListByExNo(Paging paging);

	public int cntAllUser(int exNo);

	public List<ExReview> selectAllStar(int exNo);

	public int selectWishByExNoUserNo(Wish wish);

	public void insertExReview(ExReview exReview);

	public void deleteWishByExNoUserNo(Wish wish);

	public void insertWish(Wish wish);

	public List<Exhibition> selectExhibitionTopList();

	public int selectCntOrderByExNoUserNo(HashMap<Object, String> map);

	public int selectCntReviewByExNoUserNo(HashMap<Object, String> map);

	public void deleteExReviewByExReviewNo(int exReviewNo);


}
