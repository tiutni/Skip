<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
})
</script>

<div class="container">

<h1>관리자 메인 화면</h1>
<hr>

<div>

<c:choose>
<c:when test="${empty login }">
	<a href="/admin/join">관리자 계정 생성</a> | <a href="/admin/login">로그인</a>
</c:when>
<c:when test="${login eq true }">
	<a href="/admin/logout">로그아웃</a>
	<a href="/admin/update">정보수정</a>
</c:when>
</c:choose>

<hr>
<a href="/noti/list">공지사항</a>
<a href="/faq/list">자주 묻는 질문</a>
<a href="/qna/list">1대1 문의</a>

</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />