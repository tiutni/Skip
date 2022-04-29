package com.skip.www.dto;

import java.util.Date;

public class Concert {

	private int conNo;
	private String adminId;
	private String conTitle;
	private String conAddress;
	private String conContent;
	private Date conRegDate;
	private Date conStartDay;
	private Date conEndDay;
	private Date conReserveStartDay;
	private Date conReserveEndDay;
	private int conActivate;
	
	@Override
	public String toString() {
		return "Concert [conNo=" + conNo + ", adminId=" + adminId + ", conTitle=" + conTitle + ", conAddress="
				+ conAddress + ", conContent=" + conContent + ", conRegDate=" + conRegDate + ", conStartDay="
				+ conStartDay + ", conEndDay=" + conEndDay + ", conReserveStartDay=" + conReserveStartDay
				+ ", conReserveEndDay=" + conReserveEndDay + ", conActivate=" + conActivate + "]";
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
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

	public Date getConRegDate() {
		return conRegDate;
	}

	public void setConRegDate(Date conRegDate) {
		this.conRegDate = conRegDate;
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
	
	
}
