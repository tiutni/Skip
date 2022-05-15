<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/qna/list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/qna/update?qnaNo=${viewQna.qnaNo}"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/qna/delete?qnaNo=${viewQna.qnaNo}"
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

<h1>문의글 상세보기</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${viewQna.qnaNo }</td>
</tr>
<tr>	
	<td class="info">유저번호</td><td>${viewQna.qnaNo }</td>
</tr>
<tr>
	<td class="info">문의날짜</td><td><fmt:formatDate value="${viewQna.qnaDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
</tr>
	
<tr>
	<td class="info">문의제목</td><td>${viewQna.qnaTitle }</td>
</tr>
<tr>
	<td class="info">문의내용</td><td>${viewQna.qnaContent }</td>
</tr>
<tr>
	<td class="info">첨부파일</td><td><a href="/qna/download?qnaFileNo=${qnaFile.qnaFileNo }">${qnaFile.qnaFileOriginName }</a>
	</td>
</tr>
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<c:if test="${userNo eq viewQna.userNo }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>


</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
