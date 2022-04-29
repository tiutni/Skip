package com.skip.www.dto;

import java.util.Date;

public class Exhibition {
	
	private int exNo;
	private String adminId;
	private Date exRegDate;
	private String exTitle;
	private String exContent;
	private Date exStartDay;
	private Date exEndDay;
	private Date exReserveStartDay;
	private Date exReserveEndDay;
	private String exEnterStartTime;
	private String exEnterEndTime;
	private String exEnterInterval;
	private int exTicketNum;
	private int exPrice;
	private int exActivate;

	@Override
	public String toString() {
		return "Exhibition [exNo=" + exNo + ", adminId=" + adminId + ", exRegDate=" + exRegDate + ", exTitle=" + exTitle
				+ ", exContent=" + exContent + ", exStartDay=" + exStartDay + ", exEndDay=" + exEndDay
				+ ", exReserveStartDay=" + exReserveStartDay + ", exReserveEndDay=" + exReserveEndDay
				+ ", exEnterStartTime=" + exEnterStartTime + ", exEnterEndTime=" + exEnterEndTime + ", exEnterInterval="
				+ exEnterInterval + ", exTicketNum=" + exTicketNum + ", exPrice=" + exPrice + ", exActivate="
				+ exActivate + "]";
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
	

}
