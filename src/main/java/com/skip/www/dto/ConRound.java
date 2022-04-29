package com.skip.www.dto;

import java.util.Date;

public class ConRound {

	private int conRoundNo;
	private int conNo;
	private int conRound;
	private Date conRoundStartTime;
	private Date conRoundEndTime;
	
	@Override
	public String toString() {
		return "ConRound [conRoundNo=" + conRoundNo + ", conNo=" + conNo + ", conRound=" + conRound
				+ ", conRoundStartTime=" + conRoundStartTime + ", conRoundEndTime=" + conRoundEndTime + "]";
	}

	public int getConRoundNo() {
		return conRoundNo;
	}

	public void setConRoundNo(int conRoundNo) {
		this.conRoundNo = conRoundNo;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	public int getConRound() {
		return conRound;
	}

	public void setConRound(int conRound) {
		this.conRound = conRound;
	}

	public Date getConRoundStartTime() {
		return conRoundStartTime;
	}

	public void setConRoundStartTime(Date conRoundStartTime) {
		this.conRoundStartTime = conRoundStartTime;
	}

	public Date getConRoundEndTime() {
		return conRoundEndTime;
	}

	public void setConRoundEndTime(Date conRoundEndTime) {
		this.conRoundEndTime = conRoundEndTime;
	}
	
	
	
}
