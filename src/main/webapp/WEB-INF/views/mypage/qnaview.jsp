<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/mypage/qnalist"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/board/update?boardNo=${viewQna.qnaNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/board/delete?boardNo=${viewQna.qnaNo }"
	})
})

</script>

<style type="text/css">
td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}
</style>



<!-- 나의문의 상세보기 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				Meine Anfrage
			</h3>
			<br><br><br>
		</div>


<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${viewQna.qnaNo }</td>
</tr>
<tr>
	<td class="info">회원번호</td><td>${viewQna.userNo }</td>
</tr>
<tr>	
	<td class="info">문의 날짜</td><td><fmt:formatDate value="${viewQna.qnaDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">문의제목</td><td colspan="3">${viewQna.qnaTitle }</td>
</tr>
<tr>
	<td class="info" colspan="4">문의내용</td>
</tr>
<tr>
	<td colspan="4">${viewQna.qnaContent }</td>
</tr>
</table>

<a href="/qna/download?fileNo=${qnaFile.qnaFileNo }">${qnaFile.qnaFileOriginName }</a>

<br><br><br>
<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<c:if test="${userNo eq viewQna.userNo }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

</div><!-- .container end -->

</section>

<c:import url="/WEB-INF/views/layout/footer.jsp" />










