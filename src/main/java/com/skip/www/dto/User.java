package com.skip.www.dto;

import java.util.Date;

public class User {
	private int userNo;
	private String userId;
	private String userPw;
	private String userNick;
	private String userEmail;
	private String userName;
	private String userRrn;
	private String userTelecom;
	private String userPhone;
	private String userAddr;
	private Date userRegdate;
	private int conUserLevelNo;
	private int exUserLevelNo;
	
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userNick=" + userNick
				+ ", userEmail=" + userEmail + ", userName=" + userName + ", userRrn=" + userRrn + ", userTelecom="
				+ userTelecom + ", userPhone=" + userPhone + ", userAddr=" + userAddr + ", userRegdate=" + userRegdate
				+ ", conUserLevelNo=" + conUserLevelNo + ", exUserLevelNo=" + exUserLevelNo + "]";
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserRrn() {
		return userRrn;
	}
	public void setUserRrn(String userRrn) {
		this.userRrn = userRrn;
	}
	public String getUserTelecom() {
		return userTelecom;
	}
	public void setUserTelecom(String userTelecom) {
		this.userTelecom = userTelecom;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public Date getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(Date userRegdate) {
		this.userRegdate = userRegdate;
	}
	public int getConUserLevelNo() {
		return conUserLevelNo;
	}
	public void setConUserLevelNo(int conUserLevelNo) {
		this.conUserLevelNo = conUserLevelNo;
	}
	public int getExUserLevelNo() {
		return exUserLevelNo;
	}
	public void setExUserLevelNo(int exUserLevelNo) {
		this.exUserLevelNo = exUserLevelNo;
	}
}