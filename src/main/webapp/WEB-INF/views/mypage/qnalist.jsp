<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/mypage/qnawrite"
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


<!-- 나의문의 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				My QnA
			</h3>
		</div>

		


<div class="container">



<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">NO</th>
		<th style="width: 20%;">회원 번호</th>
		<th style="width: 30%;">문의 제목</th>
		<th style="width: 20%;">문의 날짜</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="qna">
	<tr>
		<td>${qna.qnaNo }</td>
		<td>${qna.userNo }</td>
		<td><a href="/mypage/qnaview?qnaNo=${qna.qnaNo }">${qna.qnaTitle }</a></td>
		<td><fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn btn-primary pull-right">문의하기</button>
<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

	</div><!-- .container -->


	<c:import url="paging.jsp" />



	</div><!-- .container -->
</section>
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />