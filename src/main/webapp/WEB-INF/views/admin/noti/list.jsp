<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />


<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/admin/noti/write"
	})
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/admin/noti/list?search="+$("#search").val();
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
					<button id="btnSearch" class="btn size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>

					<input class="mtext-107 cl2 size-114 plh2 p-r-15 form-control" type="text" id="search" value="${param.search }" name=" search-product" placeholder="Search">
				</div>	
			</div>
		</div>
		
		
		<div class="container">
		
		<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th style="width: 10%;">No</th>
				<th style="width: 60%;">제목</th>
				<th style="width: 15%;">작성자</th>
				<th style="width: 15%;">작성일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="noti">
			<tr>
				<td>${noti.notiNo }</td>
				<td><a href="/admin/noti/view?notiNo=${noti.notiNo }">${noti.notiTitle }</a></td>
				<td>${noti.adminId }</td>
				<td><fmt:formatDate value="${noti.notiDate }" pattern="YY-MM-dd"/></td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		
		<c:if test="${adminId eq viewNoti.adminId }">
			<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
		</c:if>	
			
		<span class="pull-right">total : ${paging.totalCount }</span>
		<div class="clearfix"></div>
		

	</div><!-- .container End -->

	<c:import url="/WEB-INF/views/admin/noti/paging.jsp" />
	
	</div> <!-- .container End -->

</section>

