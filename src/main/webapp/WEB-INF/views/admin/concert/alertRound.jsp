<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	alert( "회차가 생성되지 않았습니다. 회차 생성 페이지로 이동합니다.");
	alert( ${msg} );
	document.location.href = ${url};
</script>

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />