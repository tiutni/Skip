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
			<h2 class="ltext-103 cl5">
				MyPage
			</h2>
		</div>
		<hr>
		


	<h3>${userId}'s Concert Grade - ${cul.userLevel}</h3>
	<h3>${userId }'s Exhibition Grade - ${eul.userLevel}</h3>
	<hr>
	
	
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h6 class="ltext-103 cl5">	
	
	<a href="/"><button>Main</button></a><br>
	<a href="/mypage/myconorder"><button>My Concert Order</button></a><br>
	<a href="/mypage/myexorder"><button>My Exhibition Order</button></a><br>
	<a href="/mypage/myreviewlist"><button>My Concert Review</button></a><br>
	<a href="/mypage/myexreviewlist"><button>My Exhibition Review</button></a><br>
	<a href="/mypage/qnalist"><button>My QnA</button></a><br>
	<a href="/userinfo/update"><button>My Information</button></a><br>
	<a href="/userinfo/delete"><button>Withdrawal</button></a><br>
		</h6>
	</div>
	</div>	
</div><!-- .container end -->

</section>


<c:import url="/WEB-INF/views/layout/footer.jsp" />

