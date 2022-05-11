<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
$(document).ready(function() {
	
})
</script>

<div class="container">

<h1>마이페이지</h1>
<hr>


	<p>${userId }님의 공연등급: ${cul.userLevel}</p>
	<p>${userId }님의 전시등급: ${eul.userLevel}</p>
	
	<a href="/"><button>메인</button></a><br>
	<a href="/mypage/qnalist"><button>1:1 문의</button><br>
	<a href="/userinfo/update"><button>나의 정보</button><br>
	<a href="/user/logout"><button>로그아웃</button></a><br>
	<a href="/userinfo/delete"><button>회원탈퇴</button></a><br>

</div><!-- .container end -->

</html>