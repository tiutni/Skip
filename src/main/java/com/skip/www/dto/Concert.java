package com.skip.www.dto;

import java.util.Date;

public class Concert {
	
	private int 	conNo;					// con_no (PK)				NUMBER			1  공연 번호
	private Date 	conRegDate;				// con_regdate				DATE			2  공연 등록일자
	private String 	conTitle;				// con_title				VARCHAR2(100)	3  공연 제목
	private String 	conAddress;				// con_address				VARCHAR2(500)	4  공연 주소
	private String 	conContent;				// con_content				VARCHAR2(2000)	5  공연 상세내용
	private Date 	conStartDay;			// con_startday				DATE			6  공연 시작일
	private Date 	conEndDay;				// con_endday				DATE			7  공연 종료일
	private Date	conReserveStartdayVIP;	// con_reserveStartdayVIP	DATE			8  공연 예약시작일(VIP)
	private Date 	conReserveStartDay;		// con_reserveStartday		DATE			9  공연 예약시작일
	private Date 	conReserveEndDay;		// con_reserveEndday		DATE			10 공연 예약종료일
	private int 	conActivate;			// con_activate				NUMBER			11 공연 활성화
	private String 	adminId;				// admin_id	(FK)			VARCHAR2(500)	12 관리자ID(작성자)
	
											// 공연 (첨부)이미지
											// con_img
	private String 	conImgStoredName;		// con_img_storedName		VARCHAR2(500)	13 공연 이미지파일 사본명
	
	private String 	conStartDayString;			// con_startday				DATE			6  공연 시작일
	private String 	conEndDayString;				// con_endday				DATE			7  공연 종료일
	private String	conReserveStartdayVIPString;	// con_reserveStartdayVIP	DATE			8  공연 예약시작일(VIP)
	private String 	conReserveStartDayString;		// con_reserveStartday		DATE			9  공연 예약시작일
	private String 	conReserveEndDayString;		// con_reserveEndday		DATE			10 공연 예약종료일
	
	@Override
	public String toString() {
		return "Concert [conNo=" + conNo + ", conRegDate=" + conRegDate + ", conTitle=" + conTitle + ", conAddress="
				+ conAddress + ", conContent=" + conContent + ", conStartDay=" + conStartDay + ", conEndDay="
				+ conEndDay + ", conReserveStartdayVIP=" + conReserveStartdayVIP + ", conReserveStartDay="
				+ conReserveStartDay + ", conReserveEndDay=" + conReserveEndDay + ", conActivate=" + conActivate
				+ ", adminId=" + adminId + ", conImgStoredName=" + conImgStoredName + ", conStartDayString="
				+ conStartDayString + ", conEndDayString=" + conEndDayString + ", conReserveStartdayVIPString="
				+ conReserveStartdayVIPString + ", conReserveStartDayString=" + conReserveStartDayString
				+ ", conReserveEndDayString=" + conReserveEndDayString + "]";
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	public Date getConRegDate() {
		return conRegDate;
	}

	public void setConRegDate(Date conRegDate) {
		this.conRegDate = conRegDate;
	}

	public String getConTitle() {
		return conTitle;
	}

	public void setConTitle(String conTitle) {
		this.conTitle = conTitle;
	}

	public String getConAddress() {
		return conAddress;
	}

	public void setConAddress(String conAddress) {
		this.conAddress = conAddress;
	}

	public String getConContent() {
		return conContent;
	}

	public void setConContent(String conContent) {
		this.conContent = conContent;
	}

	public Date getConStartDay() {
		return conStartDay;
	}

	public void setConStartDay(Date conStartDay) {
		this.conStartDay = conStartDay;
	}

	public Date getConEndDay() {
		return conEndDay;
	}

	public void setConEndDay(Date conEndDay) {
		this.conEndDay = conEndDay;
	}

	public Date getConReserveStartdayVIP() {
		return conReserveStartdayVIP;
	}

	public void setConReserveStartdayVIP(Date conReserveStartdayVIP) {
		this.conReserveStartdayVIP = conReserveStartdayVIP;
	}

	public Date getConReserveStartDay() {
		return conReserveStartDay;
	}

	public void setConReserveStartDay(Date conReserveStartDay) {
		this.conReserveStartDay = conReserveStartDay;
	}

	public Date getConReserveEndDay() {
		return conReserveEndDay;
	}

	public void setConReserveEndDay(Date conReserveEndDay) {
		this.conReserveEndDay = conReserveEndDay;
	}

	public int getConActivate() {
		return conActivate;
	}

	public void setConActivate(int conActivate) {
		this.conActivate = conActivate;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getConImgStoredName() {
		return conImgStoredName;
	}

	public void setConImgStoredName(String conImgStoredName) {
		this.conImgStoredName = conImgStoredName;
	}

	public String getConStartDayString() {
		return conStartDayString;
	}

	public void setConStartDayString(String conStartDayString) {
		this.conStartDayString = conStartDayString;
	}

	public String getConEndDayString() {
		return conEndDayString;
	}

	public void setConEndDayString(String conEndDayString) {
		this.conEndDayString = conEndDayString;
	}

	public String getConReserveStartdayVIPString() {
		return conReserveStartdayVIPString;
	}

	public void setConReserveStartdayVIPString(String conReserveStartdayVIPString) {
		this.conReserveStartdayVIPString = conReserveStartdayVIPString;
	}

	public String getConReserveStartDayString() {
		return conReserveStartDayString;
	}

	public void setConReserveStartDayString(String conReserveStartDayString) {
		this.conReserveStartDayString = conReserveStartDayString;
	}

	public String getConReserveEndDayString() {
		return conReserveEndDayString;
	}

	public void setConReserveEndDayString(String conReserveEndDayString) {
		this.conReserveEndDayString = conReserveEndDayString;
	}

	
}
