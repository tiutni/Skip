<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/admin/exhibition/list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/admin/exhibition/update?exNo=${viewExhibition.exNo}"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/admin/exhibition/delete?exNo=${viewExhibition.exNo}"
	})
})
</script>

<style type="text/css">
td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}
</style>

<div class="container">

	<!-- Exhibition -->
	<article class="bg0 p-t-23 p-b-140">

		<!-- 페이지 제목 -->
		<br>
		<div class="p-b-10">
			<h3 class="ltext-103 cl5" style="text-align: center;">
				<a onclick="location.href='/admin/exhibition/list'">Exhibition</a>
			</h3>
		</div>
		<br><hr>
		
		<!-- 내용 -->
		<table class="table table-bordered">
		<tr>
			<td class="info">글번호</td><td>${viewExhibition.exNo }</td>
		</tr>
		<tr>
			<td class="info">아이디</td><td>${viewExhibition.adminId }</td>
		</tr>
		<!-- <tr> -->
		<%-- 	<td class="info">작성일</td><td><fmt:formatDate value="${viewExhibition.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td> --%>
		<!-- </tr> -->
		<tr>
			<td class="info">제목</td><td colspan="3">${viewExhibition.exTitle }</td>
		</tr>
		<tr>
			<td class="info" colspan="4">본문</td>
		</tr>
		<tr>
			<td colspan="4">${viewExhibition.exContent }</td>
		</tr>
		</table>
		
		<a href="/admin/exhibition/download?fileNo=${exImg.exImgNo }">${exImg.exImgOriginName }</a>
		
		<div class="text-center">
			<button id="btnList" class="btn btn-default">목록</button>
			
			<c:if test="${id eq viewExhibition.adminId }">
				<button id="btnUpdate" class="btn btn-primary">수정</button>
				<button id="btnDelete" class="btn btn-danger">삭제</button>
			</c:if>
		</div>
		
	</article><!-- .Exhibition -->

</div><!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />















