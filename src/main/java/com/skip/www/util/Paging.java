package com.skip.www.util;

public class Paging {
	private int curPage;	//현재 페이지 번호
	
	private int totalCount;	//총 게시글 수
	
	private int listCount;	//한 페이지 당 보여질 게시글의 수
	
	private int totalPage;	//총 페이지의 수
	
	private int pageCount;	//한 화면에 출력될 페이지네이션의 개수
	
	private int startPage;	//화면에 보이는 시작 페이지네이션 번호
	
	private int endPage;	//화면에 보이는 끝 페이지네이션 번호
	
	private int startNo;	//화면에 보이는 게시글의 시작 번호
	
	private int endNo;		//화면에 보이는 게시글의 끝 번호
	
	private String search;	//검색어 			- 공연/전시회 검색
	
	private int userNo;		//유저 번호 		- 마이페이지

	private String sort;	//정렬 				- 공연/전시회 정렬
	
	private int conNo;		//공연 게시글 번호	- 공연 전체 조회
	
	private int exNo;		//전시 게시글 번호	- 전시회 전체 조회
	
	
	//디폴트 생성자 - 페이징 계산이 완료되지 않는다
	public Paging() { }
	
	//총 게시글 수를 입력하는 생성자
	public Paging(int totalCount) {
		setTotalCount(totalCount);
		
		makePaging();
	}
	
	//총 게시글 수, 현제 페이지번호를 입력하는 생성자
	public Paging(int totalCount, int curPage) {
		setTotalCount(totalCount);
		setCurPage(curPage);
		
		makePaging();
	}

	//총 게시글 수, 현제 페이지번호, 보여질 게시글 수를 입력하는 생성자
	public Paging(int totalCount, int curPage, int listCount) {
		setTotalCount(totalCount);
		setCurPage(curPage);
		setListCount(listCount);
		
		makePaging();
	}
	
	//총 게시글 수, 현제 페이지번호, 보여질 게시글 수, 보여질 페이지 수를 입력하는 생성자
	public Paging(int totalCount, int curPage, int listCount, int pageCount) {
		setTotalCount(totalCount);
		setCurPage(curPage);
		setListCount(listCount);
		setPageCount(pageCount);
		
		makePaging();
	}
	
	
	//페이징 정보를 생성하는 메소드
	private void makePaging() {
		if(totalCount == 0)	return; //게시글이 없는 경우 중단한다
		
		//기본값 설정
		if(curPage == 0)	setCurPage(1);	//첫 페이지를 기본 페이지로 설정한다
		if(listCount == 0)	setListCount(10);	//화면에 보여질 게시글 수를 기본 10개로 설정한다
		if(pageCount == 0)	setPageCount(10);	//화면에 보여질 페이지 수를 기본 10페이지로 설정한다
		
		//총 페이지수의 계산
		totalPage = totalCount / listCount;
				
		if( totalPage % totalCount > 0 )	totalPage++;
				
		//총 페이지의 수 계산 보정 작업
		if( curPage > totalPage )	totalPage = curPage;
				
		//-------------------------------------------------------
				
		//화면에 보이는 페이지네이션의 시작 번호, 끝 번호 계산
		startPage = ( (curPage-1)/pageCount ) * pageCount + 1;
		endPage = startPage + pageCount - 1;

		//페이지네이션 보정 작업
		if( endPage > totalPage )	endPage = totalPage;

		//-------------------------------------------------------
		//화면에 보이는 게시글의 시작 번호, 끝 번호 계산
		startNo = ( curPage-1 ) * listCount + 1;
		endNo = curPage * listCount;
		
	}

	@Override
	public String toString() {
		return "Paging [curPage=" + curPage + ", totalCount=" + totalCount + ", listCount=" + listCount + ", totalPage="
				+ totalPage + ", pageCount=" + pageCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", startNo=" + startNo + ", endNo=" + endNo + ", search=" + search + ", userNo=" + userNo + ", sort="
				+ sort + ", conNo=" + conNo + ", exNo=" + exNo + "]";
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	public int getExNo() {
		return exNo;
	}

	public void setExNo(int exNo) {
		this.exNo = exNo;
	}
	
}
