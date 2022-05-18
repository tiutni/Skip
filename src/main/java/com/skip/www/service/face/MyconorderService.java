package com.skip.www.service.face;

import java.util.List;

import com.skip.www.dto.ConOrderTicket;
import com.skip.www.dto.ExOrderTicket;
import com.skip.www.util.Paging;

public interface MyconorderService {

	public Paging getPaging(String curPage, int userNo);

	public List<ConOrderTicket> conlist(Paging paging);

	


	
	
}
