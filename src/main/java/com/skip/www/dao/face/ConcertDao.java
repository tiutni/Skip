package com.skip.www.dao.face;

import java.util.HashMap;
import java.util.List;

import com.skip.www.dto.ConReview;
import com.skip.www.dto.ConRound;
import com.skip.www.dto.ConSeatImg;
import com.skip.www.dto.Concert;
import com.skip.www.dto.Seat;
import com.skip.www.dto.Wish;
import com.skip.www.util.Paging;

public interface ConcertDao {

	public int selectCntAll(String search);

	public List<Concert> selectAllConcert(Paging paging);

	public Concert selectConcertByConNo(int conNo);
	
	public int selectCntAllReview(int conNo);

	public List<ConReview> selectConReviewListByConNo(Paging paging);

	public void insertConReview(ConReview conReview);

	public int selectWishByConNoUserNo(Wish wish);

	public void deleteWishByConNoUserNo(Wish wish);

	public void insertWish(Wish wish);

	public List<ConReview> selectAllStar(int conNo);

	public int cntAllUser(int conNo);

	public List<Concert> selectConcertTopList();

	public int selectCntReviewByConNoUserNo(HashMap<Object, String> map);

	public int selectCntOrderByConNoUserNo(HashMap<Object, String> map);

	public List<ConRound> selectConRoundListByConNo(int conNo);

	public void deleteConReviewByConReviewNo(int conReviewNo);

	public List<Seat> selectSeatListByConNoConRound(HashMap<Object, String> map);

	public int selectVIPSeatPriceByConNo(int conNo);

	public int selectBasicSeatPriceByConNo(int conNo);

	public List<Seat> selectUnreservedSeatListByConNoDateConRound(HashMap<Object, String> map);

	public ConSeatImg selectConSeatimgByConNo(int conNo);

	public List<Concert> selectTop6ConList();

}
