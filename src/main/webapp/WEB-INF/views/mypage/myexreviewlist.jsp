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
			<h3 class="ltext-103 cl5">
				MY Exhibition review
			</h3>
		</div>

<style type="text/css">
.grid_cont {
	font-size: medium;
	border: 1px solid #ccc;
	margin: 5px;
	
	display: grid;
}
.grid_cont {
    display: flex;
    justify-content: space-between;
}
</style>

<c:forEach items="${list }" var="exreview">
<div class="grid_cont">
	<div class="cont_row">
	<div class="cont">${exreview.CON_TITLE }</div>
	<div class="cont"><a href="/exhibition/view?conNo=${exreview.EX_NO }">${conreview.EX_REVIEW_CONTENT }</a></div>
	</div>
	
	<div class="cont_row">
	<div class="cont"><fmt:formatDate value="${exreview.EX_REVIEW_DATE }" pattern="yy-MM-dd "/></div>
	<div class="cont">
	<c:choose>
		<c:when test="${exreview.EX_REVIEW_STAR eq 5 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★★★★</span>
		</c:when>
		
		<c:when test="${exreview.EX_REVIEW_STAR eq 4 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★★★☆</span>
		</c:when>
		
		<c:when test="${exreview.EX_REVIEW_STAR eq 3 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★★☆☆</span>
		</c:when>
		
		<c:when test="${exreview.EX_REVIEW_STAR eq 2 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★☆☆☆</span>
		</c:when>
		
		<c:when test="${exreview.EX_REVIEW_STAR eq 1 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★☆☆☆☆</span>
		</c:when>
	</c:choose>
	</div>
	</div>
</div>
</c:forEach>


<!-- <table class="table table-striped table-hover"> -->
<!-- <tbody> -->
<%-- <c:forEach items="${list }" var="conreview"> --%>
<!-- 	<tr> -->
<%-- 		<td><fmt:formatDate value="${conreview.conReviewDate }" pattern="yy-MM-dd HH:mm:ss"/></td> --%>
<%-- 		<td><a href="/concert/view?conNo=${conreview.conNo }">${conreview.conReviewContent }</a></td> --%>
<%-- 		<td>${conreview.conReviewStar }</td> --%>
<!-- 		<td> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${conreview.conReviewStar eq 5 }"> --%>
<!-- 			<span style="font-size: 12px; color: rgb(255,201,14);">★★★★★</span> -->
<%-- 			</c:when> --%>
			
<%-- 			<c:when test="${conreview.conReviewStar eq 4 }"> --%>
<!-- 			<span style="font-size: 12px; color: rgb(255,201,14);">★★★★☆</span> -->
<%-- 			</c:when> --%>
			
<%-- 			<c:when test="${conreview.conReviewStar eq 3 }"> --%>
<!-- 			<span style="font-size: 12px; color: rgb(255,201,14);">★★★☆☆</span> -->
<%-- 			</c:when> --%>
			
<%-- 			<c:when test="${conreview.conReviewStar eq 2 }"> --%>
<!-- 			<span style="font-size: 12px; color: rgb(255,201,14);">★★☆☆☆</span> -->
<%-- 			</c:when> --%>
			
<%-- 			<c:when test="${conreview.conReviewStar eq 1 }"> --%>
<!-- 			<span style="font-size: 12px; color: rgb(255,201,14);">★☆☆☆☆</span> -->
<%-- 			</c:when> --%>
<%-- 		</c:choose> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<%-- </c:forEach> --%>
<!-- </tbody> -->
<!-- </table>		 -->







<c:import url="myconreviewpaging.jsp" />

	</div><!-- .container -->


</section>
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />



