<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/faq/write"
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


<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">FAQ 관리</h1>
                        <ol class="breadcrumb mb-4">
  
                            <li class="breadcrumb-item active">FAQ Management</li>
                        </ol>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                FAQ
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th width=10%>No</th>
                                            <th width=50%>제목</th>
                                            <th width=20%>작성자</th>
                                            <th width=20%>작성일</th>
                                        </tr>
                                    </thead>

 									<tbody>
										<c:forEach items="${list }" var="faq">
											<tr>
												<td>${faq.faqNo }</td>
												<td><a href="/faq/admview?faqNo=${faq.faqNo }">${faq.faqTitle }</td>
												<td>${faq.adminId }</td>
												<td><fmt:formatDate value="${faq.faqDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
											</tr>
										</c:forEach>
									</tbody>
                                </table>
                                
							</div>
								
                        </div>
                        	 </div>
								 <div class="text-center">
								<button id="btnWrite" class="btn btn-primary">글쓰기</button>
							 </div>
                </main>
         </div>
