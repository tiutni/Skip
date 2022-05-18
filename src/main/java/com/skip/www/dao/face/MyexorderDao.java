package com.skip.www.dao.face;

import java.util.List;

import com.skip.www.dto.ExOrderTicket;
import com.skip.www.util.Paging;

public interface MyexorderDao {

	public int selectCntAll(int userNo);

	public List<ExOrderTicket> selectexList(Paging paging);

}
