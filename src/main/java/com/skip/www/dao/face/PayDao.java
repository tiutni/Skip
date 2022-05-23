package com.skip.www.dao.face;

import java.util.HashMap;

public interface PayDao {

	public String selectConRoundNoByConNoConRound(HashMap<Object, String> con);

	public void insertOrder(HashMap<Object, String> map);

	public void insertConOrderTicket(HashMap<Object, String> map);

	public String selectConNoConRoundNo(HashMap<Object, String> con);

	public String selectOrderNoSeq();

	public void insertExOrderTicket(HashMap<Object, String> ex);

	public void insertPay(HashMap<Object, String> pay);

}
