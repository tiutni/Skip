<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnHome").click(function() {
		location.href = "/mypage/myconorder";
	});
})
</script>

<style>

div{
	text-align: center;
}

#btnHome{
	margin: auto;
}

</style>

<div id="layoutSidenav_content">
   	<div class="container-fluid px-4" id="center">
        	<br><br>
        	<h1 class="mt-4">결제 완료</h1> 
        	<br>
        	<h1 class="mt-4">Payment completed</h1>
        				
        	<br><br>
        
       	<hr style="margin-bottom: 3px;">
        <br><br>         	
           주문/결제가 정상적으로 완료되었습니다. 
		<br><br>
		주문에 대한 상세정보는 <b>마이페이지 > 주문내역</b>에서 확인하실 수 있습니다.
		<br><br><br><br><br><br>
   	</div>
   
	<button id="btnHome" class="flex-c-m trans-04 pointer stext-110 m-lr-15-xl p-tb-5 p-lr-15 cl0 bg3 hov-btn3 m-b-15" >
		주문내역으로
	</button>
	<br><br><br><br><br><br>
    	
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />