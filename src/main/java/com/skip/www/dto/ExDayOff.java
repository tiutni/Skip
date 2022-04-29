package com.skip.www.dto;

import java.util.Date;

public class ExDayOff {
	
	private int exDayOffNo;
	private int exNo;
	private Date exDayOff;

	@Override
	public String toString() {
		return "ExDayOff [exDayOffNo=" + exDayOffNo + ", exNo=" + exNo + ", exDayOff=" + exDayOff + "]";
	}

	public int getExDayOffNo() {
		return exDayOffNo;
	}

	public void setExDayOffNo(int exDayOffNo) {
		this.exDayOffNo = exDayOffNo;
	}

	public int getExNo() {
		return exNo;
	}

	public void setExNo(int exNo) {
		this.exNo = exNo;
	}

	public Date getExDayOff() {
		return exDayOff;
	}

	public void setExDayOff(Date exDayOff) {
		this.exDayOff = exDayOff;
	}
	

}
