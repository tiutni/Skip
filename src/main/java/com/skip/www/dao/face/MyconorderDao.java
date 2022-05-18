package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.ConOrderTicket;
import com.skip.www.dto.ExOrderTicket;
import com.skip.www.util.Paging;

public interface MyconorderDao {

	public int selectCntAll(int userNo);

	public List<ConOrderTicket> selectconList(Paging paging);

	


}
