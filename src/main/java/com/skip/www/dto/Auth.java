package com.skip.www.dto;

public class Auth {

	private int adminAuth;

	@Override
	public String toString() {
		return "Auth [adminAuth=" + adminAuth + "]";
	}

	public int getAdminAuth() {
		return adminAuth;
	}

	public void setAdminAuth(int adminAuth) {
		this.adminAuth = adminAuth;
	}

}
