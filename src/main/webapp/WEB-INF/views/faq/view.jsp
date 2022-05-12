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

<div class="container">

<h1>FAQ</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${viewFaq.faqNo }</td>
	<td class="info">작성자</td><td>${viewFaq.adminId }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewFaq.faqDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">글제목</td><td colspan="6">${viewFaq.faqTitle }</td>
</tr>
<tr>
	<td class="info" colspan="6">본문</td>
</tr>
<tr>
	<td colspan="6">${viewFaq.faqContent }</td>
</tr>
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />