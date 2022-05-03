<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>전시 결제</h1> <%-- 나중에 지울 예정 --%>
<hr>
<form>
<table>
<tr>
<tr>
<td>날짜</td>
<td><select><option>선택</option></select></td> <%-- ajax 넣기 --%>
</tr>
<tr>
<td>쿠폰 선택</td>
<td><select><option>없음</option></select></td> <%-- ajax 넣기 --%>
</tr>
</table>
<div>
<button>다음</button>
<button>취소</button>
</div>
</form>
</body>
</html>