<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/noti/write"
	})
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/noti/list?search="+$("#search").val();
	});
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>



<!-- NOTICE -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				Notice
			</h3>
		</div>

		<div class="flex-w flex-sb-m p-b-52">

			<div class="flex-w flex-c-m m-tb-10">
				<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
					<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
					<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					Search
				</div>
			</div>
			
			<!-- Search product -->
			<div class="dis-none panel-search w-full p-t-10 p-b-15">
				<div class="bor8 dis-flex p-l-15">
					<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>

					<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
				</div>	
			</div>

		</div>
		
		
		<div class="container">
		
		<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th style="width: 10%;">No</th>
				<th style="width: 50%;">제목</th>
				<th style="width: 20%;">작성자</th>
				<th style="width: 20%;">작성일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="noti">
			<tr>
				<td>${noti.notiNo }</td>
				<td><a href="/noti/view?notiNo=${noti.notiNo }">${noti.notiTitle }</a></td>
				<td>${noti.adminId }</td>
				<td><fmt:formatDate value="${noti.notiDate }" pattern="YY-MM-dd"/></td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		
		<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
		<span class="pull-right">total : ${paging.totalCount }</span>
		<div class="clearfix"></div>
		
		<div class="form-inline text-center">
			<input class="form-control" type="text" id="search" value="${param.search }" />
			<button id="btnSearch" class="btn">검색</button>
		</div>

<c:import url="/WEB-INF/views/noti/paging.jsp" />

</div><!-- .container -->

<!-- 		<div class="row isotope-grid"> -->
<!-- 			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women"> -->
<!-- 				Block2 -->
<!-- 				<div class="block2"> -->
<!-- 					<div class="block2-pic hov-img0"> -->
<!-- 						<img src="../../resources/images/product-01.jpg" alt="IMG-PRODUCT"> -->

<!-- 						<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1"> -->
<!-- 							Quick View -->
<!-- 						</a> -->
<!-- 					</div> -->

<!-- 					<div class="block2-txt flex-w flex-t p-t-14"> -->
<!-- 						<div class="block2-txt-child1 flex-col-l "> -->
<!-- 							<a href="../../resources/product-detail.jsp" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> -->
<!-- 								Esprit Ruffle Shirt -->
<!-- 							</a> -->

<!-- 							<span class="stext-105 cl3"> -->
<!-- 								$16.64 -->
<!-- 							</span> -->
<!-- 						</div> -->

<!-- 						<div class="block2-txt-child2 flex-r p-t-3"> -->
<!-- 							<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2"> -->
<!-- 								<img class="icon-heart1 dis-block trans-04" src="../../resources/images/icons/icon-heart-01.png" alt="ICON"> -->
<!-- 								<img class="icon-heart2 dis-block trans-04 ab-t-l" src="../../resources/images/icons/icon-heart-02.png" alt="ICON"> -->
<!-- 							</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->


		</div>

</section>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
