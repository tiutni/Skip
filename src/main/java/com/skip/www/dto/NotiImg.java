package com.skip.www.dto;

public class NotiImg {

	private int notiImgNo;
	private String notiImgOriginName;
	private String notiImgStoredName;
	private String notiImgPath;
	private int notiImgSize;
	private int notiNo;
	
	@Override
	public String toString() {
		return "NotiImg [notiImgNo=" + notiImgNo + ", notiImgOriginName=" + notiImgOriginName + ", notiImgStoredName="
				+ notiImgStoredName + ", notiImgPath=" + notiImgPath + ", notiImgSize=" + notiImgSize + ", notiNo="
				+ notiNo + "]";
	}
	
	public int getNotiImgNo() {
		return notiImgNo;
	}
	public void setNotiImgNo(int notiImgNo) {
		this.notiImgNo = notiImgNo;
	}
	public String getNotiImgOriginName() {
		return notiImgOriginName;
	}
	public void setNotiImgOriginName(String notiImgOriginName) {
		this.notiImgOriginName = notiImgOriginName;
	}
	public String getNotiImgStoredName() {
		return notiImgStoredName;
	}
	public void setNotiImgStoredName(String notiImgStoredName) {
		this.notiImgStoredName = notiImgStoredName;
	}
	public String getNotiImgPath() {
		return notiImgPath;
	}
	public void setNotiImgPath(String notiImgPath) {
		this.notiImgPath = notiImgPath;
	}
	public int getNotiImgSize() {
		return notiImgSize;
	}
	public void setNotiImgSize(int notiImgSize) {
		this.notiImgSize = notiImgSize;
	}
	public int getNotiNo() {
		return notiNo;
	}
	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}
	
	
}
