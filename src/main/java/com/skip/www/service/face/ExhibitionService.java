package com.skip.www.service.face;

import java.util.HashMap;
import java.util.List;

import com.skip.www.dto.ExReview;
import com.skip.www.dto.Exhibition;
import com.skip.www.dto.Wish;
import com.skip.www.util.Paging;

public interface ExhibitionService {

	public Paging getExhibitionPaging(String curPage, String search);

	public List<Exhibition> getExhibitionList(Paging paging);

	public Exhibition getExhibition(int exNo);

	public List<ExReview> reviewList(Paging paging);

	public int getAllUser(int exNo);

	public List<ExReview> getAllStar(int exNo);

	public boolean isWish(Wish wish);

	public void insertReview(ExReview exReview);

	public boolean getWish(Wish wish);

	public Paging getExhibitionReviewPaging(String curPage, int exNo);

	public List<Exhibition> getTopExhibitionList();

	public boolean isTicketing(HashMap<Object, String> map);

	public boolean isReview(HashMap<Object, String> map);

	public void delete(int exReviewNo);

	public List<Exhibition> getTop6ExhibitionList();

}
