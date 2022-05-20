<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>

div{
	text-align: center;
}

</style>

<div id="layoutSidenav_content">
	<main>
    	<div class="container-fluid px-4" id="center">
         	<br><br>
         	<h1 class="mt-4">결제 완료</h1> 
         	<br>
         	<h1 class="mt-4">Payment completed</h1>
         				
         	<br><br><br><br>
         
        	<div class="card mb-4 card-body" >
	                    	
	            주문/결제가 정상적으로 완료되었습니다. 
				<br>
				주문에 대한 상세정보는 메일에서 확인하실 수 있습니다.
				<br><br><br><br><br><br>
		                          
         	 </div>
    	</div>
 	</main>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />