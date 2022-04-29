package com.skip.www.dto;

import java.util.Date;

public class Noti {

	private int notiNo;
	private String notiTitle;
	private Date notiDate;
	private String notiContent;
	private String adminId;
	
	@Override
	public String toString() {
		return "Noti [notiNo=" + notiNo + ", notiTitle=" + notiTitle + ", notiDate=" + notiDate + ", notiContent="
				+ notiContent + ", adminId=" + adminId + "]";
	}
	
	public int getNotiNo() {
		return notiNo;
	}
	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}
	public String getNotiTitle() {
		return notiTitle;
	}
	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}
	public Date getNotiDate() {
		return notiDate;
	}
	public void setNotiDate(Date notiDate) {
		this.notiDate = notiDate;
	}
	public String getNotiContent() {
		return notiContent;
	}
	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
}
