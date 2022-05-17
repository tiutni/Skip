<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/faq/list"
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

<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				FAQ
			</h3>
			<br><br><br>
		</div>

		<table class="table table-bordered">
		<tr>
			<td class="info">글번호</td><td>${viewFaq.faqNo }</td>
		</tr>
		<tr>
			<td class="info">작성자</td><td>${viewFaq.adminId }</td>
		</tr>
		<tr>
			<td class="info">작성일</td><td><fmt:formatDate value="${viewFaq.faqDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td class="info">글제목</td><td colspan="3">${viewFaq.faqTitle }</td>
		</tr>
		<tr>
			<td class="info" colspan="4">본문</td>
		</tr>
		<tr>
			<td colspan="6">${viewFaq.faqContent }</td>
		</tr>
		</table>
		
		<div class="text-center">
			<button id="btnList" class="btn btn-primary">목록</button>
		</div>

</div><!-- .container end -->

</section>

<c:import url="/WEB-INF/views/layout/footer.jsp" />