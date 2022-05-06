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
<a href="/user/login">로그인</a>
<br> 
<a href="https://kauth.kakao.com/oauth/authorize?client_id=20a036a9e9a4a55d7de23fa420405573&redirect_uri=http://localhost:8088/user/kakaoLogin&response_type=code">카카오 로그인</a>
<br>
<a href="/user/join">회원가입</a>
<br>  
<a href="/user/logout">로그아웃</a>
<a href="https://kauth.kakao.com/oauth/logout?client_id=20a036a9e9a4a55d7de23fa420405573&logout_redirect_uri=http://localhost:8088/user/kakaoLogout">카카오 로그아웃</a>


<hr>
<a href="/board/list">목록</a>
<<<<<<< HEAD
<a href="/mypage/main">마이페이지</a>
=======
<a href="/user/mypage">마이페이지</a>
<a href="/noti/list">공지사항</a>
>>>>>>> branch 'master' of https://github.com/GarlicDish/Skip.git

<h2>${userNo}</h2>
<h2>${userId}</h2>

</div>

</div><!-- .container end -->













