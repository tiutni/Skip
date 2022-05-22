package com.skip.www.service.face;

import java.util.HashMap;
import java.util.List;

import com.skip.www.dto.ConReview;
import com.skip.www.dto.ConRound;
import com.skip.www.dto.ConSeatImg;
import com.skip.www.dto.Concert;
import com.skip.www.dto.Seat;
import com.skip.www.dto.Wish;
import com.skip.www.util.Paging;

public interface ConcertService {

	public Paging getConcertPaging(String curPage, String search);

	public List<Concert> getConcertList(Paging paging);

	public Concert getConcert(int conNo);

	public Paging getConcertReviewPaging(String curPage, int conNo);

	public List<ConReview> reviewList(Paging paging);

	public void insertReview(ConReview conReview);

	public boolean getWish(Wish wish);

	public boolean isWish(Wish wish);

	public List<ConReview> getAllStar(int conNo);

	public int getAllUser(int conNo);

	public List<Concert> getTop3ConcertList();

	public boolean isTicketing(HashMap<Object, String> map);

	public boolean isReview(HashMap<Object, String> map);

	public List<ConRound> conRoundList(int conNo);

	public void delete(int conReviewNo);
	
	public List<Seat> getSeatList(HashMap<Object, String> map);

	public int getVIPSeatPrice(int conNo);

	public int getBasicSeatPrice(int conNo);

	public List<Seat> getUnreservedSeatList(HashMap<Object, String> map);

	public ConSeatImg getConSeatImg(int conNo);

	public List<Concert> getTop6ConcertList();

}
