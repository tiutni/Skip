package com.skip.www.dto;

import java.util.Date;

public class Chat {

	private int chatNo;
	private String chatContent;
	private Date chatSendDate;
	private int chatState;
	private int userNo;
	private String adminId;
	
	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", chatContent=" + chatContent + ", chatSendDate=" + chatSendDate
				+ ", chatState=" + chatState + ", userNo=" + userNo + ", adminId=" + adminId + "]";
	}
	
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public Date getChatSendDate() {
		return chatSendDate;
	}
	public void setChatSendDate(Date chatSendDate) {
		this.chatSendDate = chatSendDate;
	}
	public int getChatState() {
		return chatState;
	}
	public void setChatState(int chatState) {
		this.chatState = chatState;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
}
