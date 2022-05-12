package com.skip.www.dto;

import java.util.Date;

public class FAQ {

		private int faqNo;
		private String faqTitle;
		private String faqContent;
		private Date faqDate;
		private String adminId;
		
		@Override
		public String toString() {
			return "FAQ [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqDate="
					+ faqDate + ", adminId=" + adminId + "]";
		}

		public int getFaqNo() {
			return faqNo;
		}

		public void setFaqNo(int faqNo) {
			this.faqNo = faqNo;
		}

		public String getFaqTitle() {
			return faqTitle;
		}

		public void setFaqTitle(String faqTitle) {
			this.faqTitle = faqTitle;
		}

		public String getFaqContent() {
			return faqContent;
		}

		public void setFaqContent(String faqContent) {
			this.faqContent = faqContent;
		}

		public Date getFaqDate() {
			return faqDate;
		}

		public void setFaqDate(Date faqDate) {
			this.faqDate = faqDate;
		}

		public String getAdminId() {
			return adminId;
		}

		public void setAdminId(String adminId) {
			this.adminId = adminId;
		}
		
}
