<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/userlayout/header.jsp" />

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

<div class="container">

<h1>나의 문의 현황</h1>
<hr>

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">NO</th>
		<th style="width: 10%;">회원 번호</th>
		<th style="width: 10%;">문의 제목</th>
		<th style="width: 10%;">문의 내용</th>
		<th style="width: 10%;">문의 날짜</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="qna">
	<tr>
		<td>${qna.qnaNo }</td>
		<td>${qna.userNo }</td>
		<td><a href="/mypage/qnaview?qnaNo=${qna.qnaNo }">${qna.qnaTitle }</a></td>
		<td>${qna.qnaContent }</td>
		<td><fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn btn-primary pull-right">글쓰기</button>
<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="paging.jsp" />



</div><!-- .container -->

<c:import url="/WEB-INF/views/userlayout/footer.jsp" />

