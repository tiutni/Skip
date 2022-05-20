<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 본문 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				TICKETS OVERVIEW
			</h3>
		</div>

		<div class="flex-w flex-sb-m p-b-52" style="margin: 9px 0px 10px 0px">
			<!-- 카테고리 -->
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button class="stext-106 cl6 hov1 bor3 m-r-32 m-tb-5" onclick="location.href='/'">
					Concerts
				</button>

				<button class="stext-106 cl6 hov1 bor3 m-r-32 m-tb-5" onclick="location.href='/exhibitions'">
					Exhibitions
				</button>
			</div> <!-- 카테고리 End -->
		</div>

		<h3 class="ltext-103 cl5">
			Most Popular Concerts
		</h3>
		<br>
	
		<div class="row isotope-grid">
			<c:forEach items="${top3ConList }" var="i">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="/upload/${i.conImgStoredName }">
	
						</div>
	
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="/concert/view?conNo=${i.conNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"></a>
	
								<span class="stext-105 cl3">
									<a href="/concert/view?conNo=${i.conNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><b>${i.conTitle }</b></a>
									<br>
									<span>${i.conAddress }</span>
								</span>
							</div>
	
							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="../../resources/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="../../resources/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<h3 class="ltext-103 cl5">
			Concerts
		</h3>
		<br>

		<div class="row isotope-grid">
			<c:if test="${not empty search }">
				<h3 class="ltext-103 cl5">"${search }"의 검색 결과</h3>
				<hr>
			</c:if>
		
			<c:forEach items="${top6ConList }" var="i">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="/upload/${i.conImgStoredName }">
						</div>
	
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="/concert/view?conNo=${i.conNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"></a>
	
								<span class="stext-105 cl3">
									<a href="/concert/view?conNo=${i.conNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><b>${i.conTitle }</b></a>
									<br>
									<span>${i.conAddress }</span>
								</span>
							</div>
	
							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="../../resources/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="../../resources/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- Load more -->
		<!-- 더보기 필요없으신 분은 지우고 사용해주세요 -->
		<div class="flex-c-m flex-w w-full p-t-45">
			<a href="/concert/list?sort=recent" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
				Load More
			</a>
		</div> <!-- Load More End -->
	</div>
</section> <!-- 본문 End -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />