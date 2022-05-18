<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	$("#btnSearch").click(function() {
		$("#searchForm").submit();
		
	})

})

</script>

<meta charset="UTF-8">
<title>SKIP</title>
</head>
<body>

<br><br><br><br>
<div class="container-fluid" style="width: 1170px;">

	<div class="p-b-10">
		<h3>현재 가장 인기있는 TOP3 전시회</h3>
		<hr>
	</div> <!-- class="p-b-10" -->

	<!-- 전시 top3 리스트 -->
	<div style="height: 649px; position:relative">
		<c:forEach items="${topList }" var="i">
		<div class="exhibitionTop3List" style="width: 33%; height: 610px; padding: 15px; padding-bottom: 35px; display: inline-block;">
			<div class="block2">
				<!-- 전시회 사진 -->
				<div class="block2-pic hov-img0" style="border: 1px solid #ccc;">
					<a href="/exhibition/view?exNo=${i.exNo }">
						<img src="/upload/${i.exImgStoredName }" style="width: 347px; height:482px;">
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

		<!-- 공연/전시회 이동 버튼 -->
		<div class="flex-w flex-sb-m">
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button onclick="location.href='/concert/list'" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">Concerts</button>
				<button onclick="location.href='/exhibition/list'" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1">Exhibitions</button>	
			</div><!-- "flex-w flex-l-m filter-tope-group m-tb-10" -->
			
			<!-- 검색 버튼 -->
			<div class="flex-w flex-c-m m-tb-10">
				<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
					<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
					<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					 Search 
				</div> <!-- "flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search" -->
			</div><!-- "flex-w flex-c-m m-tb-10" -->
			
			<!-- 검색 폼 -->
			<div class="dis-none panel-search w-full p-t-10 p-b-15">
				<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04" id="btnSearch" style="margin: 0;">
							<i class="zmdi zmdi-search">
							</i>
						</button>
					<form action="/exhibition/list" id="searchForm" method="get" style="text-align: center;">
						<input class="mtext-107 cl2 plh2 p-r-15" type="text" id="search" name="search" placeholder="검색어를 입력하세요" style=" height:60px; width: 1085px;"/>
					</form>
				</div> <!-- "bor8 dis-flex p-l-15" -->
			</div> <!-- "dis-none panel-search w-full p-t-10 p-b-15" -->
		
		</div> <!-- "flex-w flex-sb-m p-b-52" -->

	</div>

	<!-- 줄맞추기용 div -->
	<div class="flex-w flex-sb-m p-b-5">
		<div class="flex-w flex-l-m filter-tope-group m-tb-10">
		</div>	
	</div>
	
	<!-- 최신순/인기순 정렬 버튼 -->
	<div class="flex-w flex-sb-m p-b-52">
		<div class="flex-w flex-l-m filter-tope-group m-tb-10">
			<!-- 최신순 검색 버튼 -->
			<form action="/exhibition/list" method="get">
				<input type="hidden" name="sort" value="recent"/>
				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">최신순</button>
			</form>
			
			<!-- 인기순 검색 버튼 -->
			<form action="/exhibition/list" method="get">
				<input type="hidden" name="sort" value="popular"/>
				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">인기순</button>
			</form>
		</div> <!-- "flex-w flex-l-m filter-tope-group m-tb-10" -->
	</div><!-- class="flex-w flex-sb-m p-b-52"  -->

	<!-- 전시회 목록 -->
	<div style="position: relative;">
		<c:if test="${not empty search }">
			<h3>"${search }"의 검색 결과</h3>
			<hr>
		</c:if>
	
		<c:forEach items="${exList }" var="i">
			<div class="exhibitionList" style="width: 24.7%; height: 500px; padding: 15px; padding-bottom: 35px; display: inline-block;">
				<div class="block2">
					<!-- 전시회 이미지 -->
					<div class="block2-pic hov-img0" style="border: 1px solid #ccc;">
						<a href="/exhibition/view?exNo=${i.exNo }"  class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
							<img src="/upload/${i.exImgStoredName }" style="width: 249px; height: 350px;">
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
	
		<!-- 페이징 버튼 생성 -->
		<c:import url="expaging.jsp"></c:import>
	
	</div>
<br><br><br><br>
</div> <!-- "container-fluid" -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

