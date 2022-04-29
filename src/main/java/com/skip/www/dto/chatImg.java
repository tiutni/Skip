package com.skip.www.dto;

public class chatImg {

	private int chatImgNo;
	private String chatImgOriginName;
	private String chatImgStoredName;
	private String chatImgPath;
	private int chatImgSize;
	private int chatNo;
	
	@Override
	public String toString() {
		return "chatImg [chatImgNo=" + chatImgNo + ", chatImgOriginName=" + chatImgOriginName + ", chatImgStoredName="
				+ chatImgStoredName + ", chatImgPath=" + chatImgPath + ", chatImgSize=" + chatImgSize + ", chatNo="
				+ chatNo + "]";
	}
	
	public int getChatImgNo() {
		return chatImgNo;
	}
	public void setChatImgNo(int chatImgNo) {
		this.chatImgNo = chatImgNo;
	}
	public String getChatImgOriginName() {
		return chatImgOriginName;
	}
	public void setChatImgOriginName(String chatImgOriginName) {
		this.chatImgOriginName = chatImgOriginName;
	}
	public String getChatImgStoredName() {
		return chatImgStoredName;
	}
	public void setChatImgStoredName(String chatImgStoredName) {
		this.chatImgStoredName = chatImgStoredName;
	}
	public String getChatImgPath() {
		return chatImgPath;
	}
	public void setChatImgPath(String chatImgPath) {
		this.chatImgPath = chatImgPath;
	}
	public int getChatImgSize() {
		return chatImgSize;
	}
	public void setChatImgSize(int chatImgSize) {
		this.chatImgSize = chatImgSize;
	}
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	
}
