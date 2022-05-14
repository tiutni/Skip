<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
})
</script>


<!-- 마이페이지 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				MyPage
			</h3>
		</div>

		


	<p>${userId }님의 공연등급: ${cul.userLevel}</p>
	<p>${userId }님의 전시등급: ${eul.userLevel}</p>
	
	<a href="/"><button>메인</button></a><br>
	<a href="/mypage/myorder"><button>나의 예약</button><br>
	<a href="/mypage/myreview"><button>내가 남긴 리뷰</button><br>
	<a href="/mypage/qnalist"><button>나의 1:1 문의</button><br>
	<a href="/userinfo/update"><button>나의 정보</button><br>
	<a href="/user/logout"><button>로그아웃</button></a><br>
	<a href="/userinfo/delete"><button>회원탈퇴</button></a><br>

</div><!-- .container end -->

</section>


<c:import url="/WEB-INF/views/layout/footer.jsp" />

