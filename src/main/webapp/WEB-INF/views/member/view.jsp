<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

function button_event(e){
    if(confirm("회원을 탈퇴시키겠습니까?") == true){
        location.href="/member/delete?userNo="+ e;
    }else{
        return;
    }
}   

$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/member/list"
	})
	
})
</script>

<div class="container">

<h1>회원 조회</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">회원번호</td><td>${viewMember.userNo }</td>
</tr>
<tr>
	<td class="info">아이디</td><td>${viewMember.userId }</td>
</tr>	
<tr>
	<td class="info">닉네임</td><td>${viewMember.userNick }</td>
</tr>	
<tr>	
	<td class="info">이메일</td><td>${viewMember.userEmail }</td>
</tr>
<tr>	
	<td class="info">이름</td><td>${viewMember.userName }</td>
</tr>	
<tr>	
	<td class="info">통신사</td><td>${viewMember.userTelecom }</td>
</tr>
<tr>	
	<td class="info">휴대폰번호</td><td>${viewMember.userPhone }</td>
</tr>
<tr>		
	<td class="info">회원가입일자</td><td><fmt:formatDate value="${viewMember.userRegdate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>		
	<td class="info">공연 회원등급 번호</td><td>${viewMember.conUserLevelNo }</td>
</tr>
<tr>		
	<td class="info">전시회 회원등급 번호</td><td>${viewMember.exUserLevelNo }</td>
</tr>
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	<button onclick="button_event(${user.userNo})" id="btnDelete" class="btn btn-danger">탈퇴</button>
</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />