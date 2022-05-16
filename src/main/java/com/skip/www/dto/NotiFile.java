package com.skip.www.dto;

public class NotiFile {

	private int notiFileNo;
	private String notiFileOriginName;
	private String notiFileStoredName;
	private int notiNo;
	
	@Override
	public String toString() {
		return "NotiFile [notiFileNo=" + notiFileNo + ", notiFileOriginName=" + notiFileOriginName + ", notiFileStoredName="
				+ notiFileStoredName + ",  notiNo=" + notiNo + "]";
	}
	
	public int getNotiFileNo() {
		return notiFileNo;
	}
	public void setNotiFileNo(int notiFileNo) {
		this.notiFileNo = notiFileNo;
	}
	public String getNotiFileOriginName() {
		return notiFileOriginName;
	}
	public void setNotiFileOriginName(String notiFileOriginName) {
		this.notiFileOriginName = notiFileOriginName;
	}
	public String getNotiFileStoredName() {
		return notiFileStoredName;
	}
	public void setNotiFileStoredName(String notiFileStoredName) {
		this.notiFileStoredName = notiFileStoredName;
	}
	public int getNotiNo() {
		return notiNo;
	}
	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}
	
	
}
