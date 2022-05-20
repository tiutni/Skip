<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 본문 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				TICKETS OVERVIEW
			</h3>
		</div>

		<div class="flex-w flex-sb-m p-b-52">
			<!-- 카테고리 -->
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button class="stext-106 cl6 hov1 bor3 m-r-32 m-tb-5" onclick="location.href='/concert/list?sort=recent'">
					Concerts
				</button>

				<button class="stext-106 cl6 hov1 bor3 m-r-32 m-tb-5" onclick="location.href='/exhibition/list?sort=recent'">
					Exhibitions
				</button>
			</div> <!-- 카테고리 End -->

			<!-- 검색 아이콘 -->
			<div class="flex-w flex-c-m m-tb-10">
				<!-- 최신순 검색 -->
				<form action="/concert/list" method="get">
					<input type="hidden" name="sort" value="recent"/>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">최신순</button>
				</form>
					
				<!-- 인기순 검색 -->
				<form action="/concert/list" method="get">
					<input type="hidden" name="sort" value="popular"/>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5">인기순</button>
				</form>
			
				<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
					<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
					<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					Search
				</div>
			</div> <!-- 검색 아이콘 End -->
			
			<!-- Search product -->
			<!-- 검색 기능(위에 jQuery만 수정하시면 됩니다) -->
			<div class="dis-none panel-search w-full p-t-10 p-b-15">
				<div class="bor8 dis-flex p-l-15">
					<button id="btnSearch" class="btn size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>

					<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" id="search" value="${param.search }" name="search" placeholder="Search">
				</div>	
			</div> <!-- 검색 기능 End -->
		</div>

		<h3 class="ltext-103 cl5">
			Exhibitions
		</h3>
		<br>
		
		<c:if test="${not empty search }">
			<h5>
				"${search }"의 검색 결과
			</h5>
			<br>
		</c:if>

		<div class="row isotope-grid">
			<c:forEach items="${exList }" var="i">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<a href="/exhibition/view?exNo=${i.exNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
								<img src="/upload/${i.exImgStoredName }">
							</a>
						</div>
	
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="flex-col-l ">
								<a href="/exhibition/view?exNo=${i.exNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"></a>
	
								<span class="stext-105 cl3">
									<a href="/exhibition/view?exNo=${i.exNo }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"><b>${i.exTitle }</b></a>
									<br>
									<span>${i.exAddress }</span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 페이징 버튼 생성 -->
		<c:import url="expaging.jsp" />
	</div>
</section> <!-- 본문 End -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />