<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

</style>

<div class="container">

<h1>FAQ</h1>
<hr>

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 50%;">제목</th>
		<th style="width: 10%;">작성자</th>
		<th style="width: 10%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="faq">
	<tr>
		<td>${faq.faqNo }</td>
		<td><a href="/faq/view?faqNo=${faq.faqNo }">${faq.faqTitle }</td>
		<td>${faq.adminId }</td>
		<td><fmt:formatDate value="${faq.faqDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<c:import url="/WEB-INF/views/faq/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











