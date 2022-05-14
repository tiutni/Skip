<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
.container {
	width: 100%;
	height: 300px;
	background: #ccc;
}

.body {
	width: 1100px;
	height: 830px;
	margin: 0 auto;
}

#search {
	width: 250px;
	height: 31.5px;
	border-radius: 3px;
}

#btnSearch {
	width: 35px;
	height: 32px;
	margin-left: -7px;
	padding: 0;
	border-radius: 3px;
}

a {
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

</style>

<meta charset="UTF-8">
<title>SKIP</title>
</head>
<body>

<div class="container">
<br><br><br>
<h1 style="text-align: center;">SKIP</h1>
<form action="/concert/list" method="get" style="text-align: center;">
<input type="text" id="search" name="search" placeholder="검색어를 입력하세요"/>
<button id="btnSearch">검색</button>
</form>
</div>

<div class="body">
<br>
<h3 style="margin-left: 30px;">현재 가장 인기있는 TOP3 공연</h3>
<c:forEach items="${topList }" var="i">
	<div style="width: 300px; height: 245px; display: inline-block; margin: 30px; text-align: center;">
		<div style="width: 300px; height: 210px;">
			<a href="/concert/view?conNo=${i.conNo }">
				<img src="/upload/${i.conImgStoredName }" style="height: 210px; width:200px;">
			</a>
		</div>
		<br>
		<a href="/concert/view?conNo=${i.conNo }"><span><b>${i.conTitle }</b></span></a><br>
<%-- 		<span style="font-size: 12px;">${i.exAddress }</span> --%>
	</div>
</c:forEach>
<hr>
<button onclick="location.href='/concert/list'" style="margin-left: 30px;">공연</button>
<button onclick="location.href='/exhibition/list'">전시회</button>
<br>
<div class="btnSort" style="margin-left: 30px; margin-top: 10px; display: inline-block;">
<form action="/concert/list" method="get">
<input type="hidden" name="sort" value="recent"/>
<button>최신순</button>
</form>
</div>
<div class="btnSort" style="display: inline-block;">
<form action="/concert/list" method="get">
<input type="hidden" name="sort" value="popular"/>
<button>인기순</button>
</form>
</div>

<hr>
<c:if test="${not empty search }">
<h3 style="margin-left: 30px;">"${search }"의 검색 결과</h3>
</c:if>
<c:forEach items="${conList }" var="i">
	<div style="width: 300px; height: 245px; display: inline-block; margin: 30px; text-align: center;">
		<div style="width: 300px; height: 210px;">
			<a href="/concert/view?conNo=${i.conNo }">
				<img src="/upload/${i.conImgStoredName }" style="height: 210px; width:200px;">
			</a>
		</div>
		<br>
		<a href="/concert/view?conNo=${i.conNo }"><span><b>${i.conTitle }</b></span></a><br>
<%-- 		<span style="font-size: 12px;">${i.conAddress }</span> --%>
	</div>
</c:forEach>
<br><br>
<c:import url="conpaging.jsp" />

</div>

</body>
</html>