<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/noti/list"
	})
})
</script>

<style type="text/css">
td.info {
	width: 10%;
	text-align: center;
}
td:not(.info) {
	width: 40%;
}

#btnList{
	margin: auto;
}

</style>



<!-- NOTICE 상세보기 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				Notice
			</h3>
			<br><br><br>
		</div>

		
		
		<table class="table table-bordered">
		<tr>
			<td class="info">글번호</td><td>${viewNoti.notiNo }</td>
		</tr>
		<tr>
			<td class="info">아이디</td><td>${viewNoti.adminId }</td>
		</tr>
		<tr>
			<td class="info">작성일</td><td><fmt:formatDate value="${viewNoti.notiDate }" pattern="yy-MM-dd"/></td>
		</tr>
		<tr>
			<td class="info">제목</td><td colspan="3">${viewNoti.notiTitle }</td>
		</tr>
		<tr>
			<td class="info" colspan="4">본문</td>
		</tr>
		<tr>
			<td colspan="4">${viewNoti.notiContent }</td>
		</tr>
		</table>
		
		<a href="/noti/download?notiFileNo=${notiFile.notiFileNo }">${notiFile.notiFileOriginName }</a>
		
		<br><br><br>
		<button id="btnList" class="flex-c-m trans-04 pointer stext-110 m-lr-15-xl p-tb-5 p-lr-15 cl0 bg3 hov-btn3 m-b-15">목록</button>
		

	</div> <!-- .container end -->

</section>


<c:import url="/WEB-INF/views/layout/footer.jsp" />







