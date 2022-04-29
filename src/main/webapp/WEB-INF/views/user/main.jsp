<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function() {
	
})
</script>

<div class="container">

<h1>메인 화면</h1>
<hr>

<div>

<c:choose>
<c:when test="${empty login }">
	<a href="/user/join">회원가입</a> | <a href="/user/login">로그인</a>
</c:when>
<c:when test="${login eq true }">
	<a href="/user/logout">로그아웃</a>
</c:when>
</c:choose>

<hr>
<a href="/board/list">목록</a>
<a href="/user/mypage">마이페이지</a>

<h2>${userNo }</h2>
<h2>${userId }</h2>

</div>

</div><!-- .container end -->













