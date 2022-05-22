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
		
		location.href = "/mypage/qnaupdate?qnaNo=${viewQna.qnaNo }"
	})
	
	$("#btnDelete").click(function() {
		if(confirm("QnA 게시글을 삭제하시겠습니까?") == true){
			
		location.href = "/mypage/qnadelete?qnaNo=${viewQna.qnaNo }"
		
		}else{
    	
		return;
		
		}
	})
})

$(document).ready(function(){
	
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


<!-- 나의문의 상세보기 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				My Qna
			</h3>
			<br><br><br>
		</div>

<br>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${viewQna.qnaNo }</td>
</tr>
<tr>	
	<td class="info">회원번호</td><td>${viewQna.userNo }</td>
</tr>
<tr>
	<td class="info">문의날짜</td><td><fmt:formatDate value="${viewQna.qnaDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
</tr>
	
<tr>
	<td class="info">문의제목</td><td>${viewQna.qnaTitle }</td>
</tr>
<tr>
	<td class="info">문의내용</td><td>${viewQna.qnaContent }</td>
</tr>
<tr>
	<td class="info">첨부파일</td><td><a href="/mypage/download?qnaFileNo=${qnaFile.qnaFileNo }">${qnaFile.qnaFileOriginName }</a>
	</td>
</tr>
<tr>
	<td class="info">답변내용</td><td><c:forEach items="${QnAMentList }" var="qnament">${qnament.qnaMentContent }</c:forEach></td>
</tr>
<tr>
	<td class="info">답변날짜</td><td><c:forEach items="${QnAMentList }" var="qnament"><fmt:formatDate value="${qnament.qnaMentDate }" pattern="yy-MM-dd HH:mm:ss"/></c:forEach></td>
</tr>
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
	
	<c:if test="${userNo eq viewQna.userNo }">
		<button id="btnUpdate" class="btn btn-success">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
	
</div>
<br>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
