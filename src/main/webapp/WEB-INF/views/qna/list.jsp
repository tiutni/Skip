<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script type="text/javascript">

$(document).ready(function(){
	
		$("#btnSearch").click(function() {
			location.href="/qna/list?search="+$("#search").val();
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

<h1>문의 글 리스트</h1>
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
		<td><a href="/qna/view?qnaNo=${qna.qnaNo }">${qna.qnaTitle }</td>
		<td>${qna.qnaContent }</td>
		<td><fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" value="${param.search }" placeholder="문의 제목 입력"/>
	<button id="btnSearch" class="btn">검색</button>
</div>

<c:import url="/WEB-INF/views/qna/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />

