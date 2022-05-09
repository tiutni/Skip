<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script type="text/javascript">

function button_event(e){
    if(confirm("회원을 탈퇴시키겠습니까?") == true){
        location.href="/member/delete?userNo="+ e;
    }else{
        return;
    }
}      

$(document).ready(function(){
	
		
		$("#btnSearch").click(function() {
			location.href="/member/list?search="+$("#search").val();
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

<div class="container">

<h1>회원 리스트</h1>
<hr>

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">NO</th>
		<th style="width: 10%;">회원 아이디</th>
		<th style="width: 10%;">회원 닉네임</th>
		<th style="width: 10%;">전시 회원등급</th>
		<th style="width: 10%;">공연 회원등급</th>
		<th style="width: 10%;">회원 관리</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="user">
	<tr>
		<td>${user.userNo }</td>
		<td>${user.userId }</td>
		<td>${user.userNick }</td>
		<td>${user.exUserLevelNo }</td>
		<td>${user.conUserLevelNo }</td>
		<td><button onclick="button_event(${user.userNo})" id="btnDelete" class="btn btn-danger">탈퇴</button></td>
	</tr>
</c:forEach>
</tbody>
</table>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" value="${param.search }" placeholder="회원 아이디 입력"/>
	<button id="btnSearch" class="btn">검색</button>
</div>

<c:import url="/WEB-INF/views/member/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />

