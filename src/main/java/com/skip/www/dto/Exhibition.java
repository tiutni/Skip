package com.skip.www.dto;

import java.util.Date;

public class Exhibition {				//전시회
	
	private int 	exNo;				// ex_no (PK)			NUMBER			1  번호
	private Date 	exRegDate;			// ex_regdate			DATE			2  작성일자
	private String 	exTitle;			// ex_title				VARCHAR2(100)	3  제목
	private String 	exAddress;			// ex_address			VARCHAR2(500)	4  주소
	private String 	exContent;			// ex_content			VARCHAR2(2000)	5  상세내용
	private Date 	exStartDay;			// ex_startDay			DATE			6  시작일
	private Date 	exEndDay;			// ex_endDay			DATE			7  종료일
	private Date 	exReserveStartDay;	// ex_reserveStartDay	DATE			8  예약시작일
	private Date 	exReserveEndDay;	// ex_reserveEndDay		DATE			9  예약종료일
	private String 	exEnterStartTime;	// ex_enterStartTime	DATE			10 입장시작시간
	private String 	exEnterEndTime;		// ex_enterEndTime		DATE			11 입장종료시간
	private String 	exEnterInterval;	// ex_enterInterval		NUMBER			12 입장간격
	private int 	exTicketNum;		// ex_ticketNum			NUMBER			13 총티켓수
	private int 	exPrice;			// ex_price				NUMBER			14 금액
	private int 	exActivate;			// ex_activate			NUMBER			15 활성화
	private String 	adminId;			// admin_id (FK)		VARCHAR2(500)	16 글작성자
	private String 	exImgStoredName;	// ex_img_storedname	VARCHAR2(500)	17 전시회 이미지파일 사본명

	@Override
	public String toString() {
		return "Exhibition [exNo=" + exNo + ", exRegDate=" + exRegDate + ", exTitle=" + exTitle + ", exAddress="
				+ exAddress + ", exContent=" + exContent + ", exStartDay=" + exStartDay + ", exEndDay=" + exEndDay
				+ ", exReserveStartDay=" + exReserveStartDay + ", exReserveEndDay=" + exReserveEndDay
				+ ", exEnterStartTime=" + exEnterStartTime + ", exEnterEndTime=" + exEnterEndTime + ", exEnterInterval="
				+ exEnterInterval + ", exTicketNum=" + exTicketNum + ", exPrice=" + exPrice + ", exActivate="
				+ exActivate + ", adminId=" + adminId + ", exImgStoredName=" + exImgStoredName + "]";
	}

	public int getExNo() {
		return exNo;
	}

	public void setExNo(int exNo) {
		this.exNo = exNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public Date getExRegDate() {
		return exRegDate;
	}

	public void setExRegDate(Date exRegDate) {
		this.exRegDate = exRegDate;
	}

	public String getExTitle() {
		return exTitle;
	}

	public void setExTitle(String exTitle) {
		this.exTitle = exTitle;
	}

	public String getExAddress() {
		return exAddress;
	}

	public void setExAddress(String exAddress) {
		this.exAddress = exAddress;
	}

	public String getExContent() {
		return exContent;
	}

	public void setExContent(String exContent) {
		this.exContent = exContent;
	}

	public Date getExStartDay() {
		return exStartDay;
	}

	public void setExStartDay(Date exStartDay) {
		this.exStartDay = exStartDay;
	}

	public Date getExEndDay() {
		return exEndDay;
	}

	public void setExEndDay(Date exEndDay) {
		this.exEndDay = exEndDay;
	}

	public Date getExReserveStartDay() {
		return exReserveStartDay;
	}

	public void setExReserveStartDay(Date exReserveStartDay) {
		this.exReserveStartDay = exReserveStartDay;
	}

	public Date getExReserveEndDay() {
		return exReserveEndDay;
	}

	public void setExReserveEndDay(Date exReserveEndDay) {
		this.exReserveEndDay = exReserveEndDay;
	}

	public String getExEnterStartTime() {
		return exEnterStartTime;
	}

	public void setExEnterStartTime(String exEnterStartTime) {
		this.exEnterStartTime = exEnterStartTime;
	}

	public String getExEnterEndTime() {
		return exEnterEndTime;
	}

	public void setExEnterEndTime(String exEnterEndTime) {
		this.exEnterEndTime = exEnterEndTime;
	}

	public String getExEnterInterval() {
		return exEnterInterval;
	}

	public void setExEnterInterval(String exEnterInterval) {
		this.exEnterInterval = exEnterInterval;
	}

	public int getExTicketNum() {
		return exTicketNum;
	}

	public void setExTicketNum(int exTicketNum) {
		this.exTicketNum = exTicketNum;
	}

	public int getExPrice() {
		return exPrice;
	}

	public void setExPrice(int exPrice) {
		this.exPrice = exPrice;
	}

	public int getExActivate() {
		return exActivate;
	}

	public void setExActivate(int exActivate) {
		this.exActivate = exActivate;
	}

	public String getExImgStoredName() {
		return exImgStoredName;
	}

	public void setExImgStoredName(String exImgStoredName) {
		this.exImgStoredName = exImgStoredName;
	}

	
}
