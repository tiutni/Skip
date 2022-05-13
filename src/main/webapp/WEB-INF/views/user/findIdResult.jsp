<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${userId ne null}">
<h1>${userId}</h1>
</c:if>

<c:if test="${empty userId}">
<h1>존재하지 않는 아이디입니다</h1>
</c:if>

<hr>
<a href="/user/login">로그인</a>
<a href="/">메인으로</a>
</body>
</html>