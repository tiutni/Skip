<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/mypage/myreviewlist"
	})
	
	
})

</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}


</style>

<!-- 나의리뷰 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h1 class="ltext-103 cl5">
				MY Concert review
			</h1>
		</div>
<br><br><br>

<style type="text/css">
.grid_cont {
	font-size: large;
	border: 2px solid #ccc;
	border-color: #FFF5EE;
	background-color: #F5F5F5;
	margin: 5px;
	border-radius: 10px;
	display: grid;
}
.grid_cont {
    display: flex;
    justify-content: space-between;
}
</style>

<c:forEach items="${list }" var="conreview">
<div class="grid_cont">
	<div class="cont_row">
	<div class="cont">${conreview.CON_TITLE }</div>
	<div class="cont"><a href="/concert/view?conNo=${conreview.CON_NO }">${conreview.CON_REVIEW_CONTENT }</a></div>
	</div>
	
	<div class="cont_row">
	<div class="cont"><fmt:formatDate value="${conreview.CON_REVIEW_DATE }" pattern="yy-MM-dd "/></div>
	<div class="cont">
	<c:choose>
		<c:when test="${conreview.CON_REVIEW_STAR eq 5 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★★★★</span>
		</c:when>
		
		<c:when test="${conreview.CON_REVIEW_STAR eq 4 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★★★☆</span>
		</c:when>
		
		<c:when test="${conreview.CON_REVIEW_STAR eq 3 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★★☆☆</span>
		</c:when>
		
		<c:when test="${conreview.CON_REVIEW_STAR eq 2 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★☆☆☆</span>
		</c:when>
		
		<c:when test="${conreview.CON_REVIEW_STAR eq 1 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★☆☆☆☆</span>
		</c:when>
	</c:choose>
	</div>
	</div>
</div>
</c:forEach>




<c:import url="myconreviewpaging.jsp" />

	</div><!-- .container -->


</section>
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />



