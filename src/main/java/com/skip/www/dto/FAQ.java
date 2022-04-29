package com.skip.www.dto;

public class FAQ {

		private int faqNo;
		private String faqTitle;
		private String faqContent;
		
		@Override
		public String toString() {
			return "FAQ [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + "]";
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
		
}
