<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>마이페이지</h1>
<hr>


	<p>User님의 공연등급: ${cul.user_level}</p>
	<p>User님의 전시등급: ${eul.user_level}</p>
	
	
	<a href="/skip/me"><button>나의 정보</button><br>
	<a href="/skip/logout"><button>로그아웃</button></a><br>
	<a href="/skip/main"><button>메인</button></a>




</body>
</html>