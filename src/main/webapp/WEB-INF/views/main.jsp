<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<br><br><br><br>
<div class="container-fluid" style="width: 1280px;">

	<div class="p-b-10">
		<h3 class="ltext-103 cl5" style="display: inline-block; margin-right: 10px;">인기있는 TOP3 공연</h3>
		<button type="button" onclick="location.href='/concert/list?sort=popular'" style="border: 0; color: #666; background: white;">더보기</button>
		<hr>
	</div> <!-- class="p-b-10" end -->

	<!-- 공연 top3 리스트 -->
	<div style="height: 649px; position:relative">
		<c:forEach items="${top3ConList }" var="i">
		<div class="concertTop3List" style="width: 33%; height: 615px; padding: 15px; padding-bottom: 35px; display: inline-block;">
			<div class="block2">
				<!-- 공연 사진 -->
				<div class="block2-pic hov-img0" style="border: 1px solid #ccc;">
					<a href="/concert/view?conNo=${i.conNo }">
						<img src="/upload/${i.conImgStoredName }" style="width: 381px; height:482px;">
					</a>
				</div> <!-- class="block2-pic hov-img0" -->
				<!-- 공연 정보(이름, 주소) -->
				<div class="block2-txt flex-w flex-t p-t-14">
					<div class="block2-txt-child1 flex-col-l">
						<a href="/concert/view?conNo=${i.conNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><b>${i.conTitle }</b></a>
						<span>${i.conAddress }</span>
					</div> <!-- "block2-txt-child1 flex-col-l " -->
				</div> <!-- "block2-txt flex-w flex-t p-t-14" -->
			</div> <!-- "block2" -->
		</div> <!-- "concertTop3List" -->
		</c:forEach>
	</div>
	
	<div class="p-b-10">
		<h3 class="ltext-103 cl5" style="display: inline-block; margin-right: 10px;">최신 등록 공연</h3>
		<button type="button" onclick="location.href='/concert/list?sort=recent'" style="border: 0; color: #666; background: white;">더보기</button>
		<hr>
	</div> <!-- class="p-b-10" end -->
	
	<!-- 공연 TOP6 리스트 (최신순) -->
	<div style="position: relative;">
		<c:if test="${not empty search }">
			<h3>"${search }"의 검색 결과</h3>
			<hr>
		</c:if>
		
		<c:forEach items="${top6ConList }" var="i">
			<div class="concertList" style="width: 33%; height: 615px; padding: 15px; padding-bottom: 35px; display: inline-block;">
				<div class="block2">
					<!-- 공연 이미지 -->
					<div class="block2-pic hov-img0C" style="border: 1px solid #ccc;">
						<a href="/concert/view?conNo=${i.conNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
							<img src="/upload/${i.conImgStoredName }" style="width: 381px; height:482px;">
						</a>
					</div> <!-- "block2-pic hov-img0" -->
				</div> <!-- "block2" -->
				
				<div class="block2-txt flex-w flex-t p-t-14">
					<!-- 공연 정보(이름, 주소) -->
					<div class="block2-txt-child1 flex-col-l">
						<a href="/concert/view?conNo=${i.conNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><b>${i.conTitle }</b></a>
						<span>${i.conAddress }</span>
					</div> <!-- "block2-txt-child1 flex-col-l " -->
				</div> <!-- "block2-txt flex-w flex-t p-t-14" -->
			</div> <!-- "concertList" -->
		</c:forEach>
	
	</div>
	

	<div class="p-b-10">
		<h3 class="ltext-103 cl5" style="display: inline-block; margin-right: 10px;">인기있는 TOP3 전시</h3>
		<button type="button" onclick="location.href='/exhibition/list?sort=popular'" style="border: 0; color: #666; background: white;">더보기</button>
		<hr>
	</div> <!-- class="p-b-10" end -->
	
	<!-- 전시 top3 리스트 -->
	<div style="height: 649px; position:relative">
	
		<c:forEach items="${top3ExList }" var="i">
			<div class="exhibitionTop3List" style="width: 33%; height: 615px; padding: 15px; padding-bottom: 35px; display: inline-block;">
				<div class="block2">
					<!-- 전시회 사진 -->
					<div class="block2-pic hov-img0" style="border: 1px solid #ccc;">
						<a href="/exhibition/view?exNo=${i.exNo }">
							<img src="/upload/${i.exImgStoredName }" style="width: 381px; height:482px;">
						</a>
					</div> <!-- "block2-pic hov-img0" -->
					<!-- 전시회 정보(이름, 주소) -->
					<div class="block2-txt flex-w flex-t p-t-14">
						<div class="block2-txt-child1 flex-col-l">
							<a href="/exhibition/view?exNo=${i.exNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><b>${i.exTitle }</b></a>
							<span>${i.exAddress }</span>
						</div> <!-- "block2-txt-child1 flex-col-l" -->
					</div> <!-- "block2-txt flex-w flex-t p-t-14" -->
				</div> <!-- "block2" -->
			</div> <!-- "exhibitionTop3List" -->
		</c:forEach>
	
	</div>
	
	<div class="p-b-10">
		<h3 class="ltext-103 cl5" style="display: inline-block; margin-right: 10px;">최신 등록 전시</h3>
		<button type="button" onclick="location.href='/exhibition/list?sort=recent'" style="border: 0; color: #666; background: white;">더보기</button>
		<hr>
	</div> <!-- class="p-b-10" end -->
	
	<!-- 전시 TOP6 리스트 (최신순) -->
	<div style="position: relative;">
		<c:if test="${not empty search }">
			<h3>"${search }"의 검색 결과</h3>
			<hr>
		</c:if>
	
		<c:forEach items="${top6ExList }" var="i">
			<div class="exhibitionList" style="width: 33%; height: 615px; padding: 15px; padding-bottom: 35px; display: inline-block;">
				<div class="block2">
					<!-- 전시회 이미지 -->
					<div class="block2-pic hov-img0" style="border: 1px solid #ccc;">
						<a href="/exhibition/view?exNo=${i.exNo }"  class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
							<img src="/upload/${i.exImgStoredName }" style="width: 381px; height:482px;">
						</a>
					</div> <!-- "block2-pic hov-img0" -->
				</div> <!-- "block2" -->
				
				<div class="block2-txt flex-w flex-t p-t-14">
					<!-- 전시회 정보(이름, 주소) -->
					<div class="block2-txt-child1 flex-col-l">
						<a href="/exhibition/view?exNo=${i.exNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><b>${i.exTitle }</b></a>
						<span>${i.exAddress }</span>
					</div> <!-- "block2-txt-child1 flex-col-l" -->
				</div> <!-- "block2-txt flex-w flex-t p-t-14" -->
			</div> <!-- "exhibitionList" -->
		</c:forEach>

	</div>
<br><br><br><br><br>
</div> <!-- "container-fluid" -->

<!-- 푸터 -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />

