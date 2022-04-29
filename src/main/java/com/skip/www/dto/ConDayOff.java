package com.skip.www.dto;

import java.util.Date;

public class ConDayOff {

	private int conDayOffNo;
	private int conNo;
	private Date conDayOff;

	@Override
	public String toString() {
		return "ConDayOff [conDayOffNo=" + conDayOffNo + ", conNo=" + conNo + "]";
	}

	public int getConDayOffNo() {
		return conDayOffNo;
	}

	public void setConDayOffNo(int conDayOffNo) {
		this.conDayOffNo = conDayOffNo;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	public Date getConDayOff() {
		return conDayOff;
	}

	public void setConDayOff(Date conDayOff) {
		this.conDayOff = conDayOff;
	}
	
}
