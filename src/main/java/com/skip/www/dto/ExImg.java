package com.skip.www.dto;

public class ExImg {
	
	private int 	exImgNo;			// ex_img_no (PK)		NUMBER			1 전시회 이미지 번호
	private String 	exImgOriginName;	// ex_img_originName	VARCHAR2(500)	2 전시회 이미지 원본 파일명
	private String 	exImgStoredName;	// ex_img_storedName	VARCHAR2(500)	3 전시회 이미지 저장 파일명
	private String 	exImgPath;			// ex_img_path			VARCHAR2(1000)	4 전시회 이미지 저장 경로명
	private int 	exImgSize;			// ex_img_size			NUMBER			5 전시회 이미지 파일 크기
	private int 	exNo;				// ex_no (FK)			NUMBER			6 전시회 번호

	@Override
	public String toString() {
		return "ExImg [exImgNo=" + exImgNo + ", exImgOriginName=" + exImgOriginName + ", exImgStoredName="
				+ exImgStoredName + ", exImgPath=" + exImgPath + ", exImgSize=" + exImgSize + ", exNo=" + exNo + "]";
	}

	public int getExImgNo() {
		return exImgNo;
	}

	public void setExImgNo(int exImgNo) {
		this.exImgNo = exImgNo;
	}

	public String getExImgOriginName() {
		return exImgOriginName;
	}

	public void setExImgOriginName(String exImgOriginName) {
		this.exImgOriginName = exImgOriginName;
	}

	public String getExImgStoredName() {
		return exImgStoredName;
	}

	public void setExImgStoredName(String exImgStoredName) {
		this.exImgStoredName = exImgStoredName;
	}

	public String getExImgPath() {
		return exImgPath;
	}

	public void setExImgPath(String exImgPath) {
		this.exImgPath = exImgPath;
	}

	public int getExImgSize() {
		return exImgSize;
	}

	public void setExImgSize(int exImgSize) {
		this.exImgSize = exImgSize;
	}

	public int getExNo() {
		return exNo;
	}

	public void setExNo(int exNo) {
		this.exNo = exNo;
	}
	

}
