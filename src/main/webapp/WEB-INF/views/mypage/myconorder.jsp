<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/mypage/myconorder"
	})
	
	
})

</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

</style>


<!-- 나의주문 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				MY Concert Order
			</h3>
		</div>

	

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 15%;">공연 티켓번호</th>
		<th style="width: 15%;">주문 번호</th>
		<th style="width: 15%;">공연 좌석</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${conlist }" var="conorder">
	<tr>
		<td>${conorder.conOrderTicketNo }</td>
		<td>${conorder.orderNo }</td>
		<td>${conorder.seatSeq }</td>
	</tr>
</c:forEach>
</tbody>
</table>		

<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="myconorderpaging.jsp" />

	</div><!-- .container -->


</section>
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />

