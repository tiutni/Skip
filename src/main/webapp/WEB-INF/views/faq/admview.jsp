<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/faq/admlist"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/faq/update?faqNo=${viewFaq.faqNo}"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/faq/delete?faqNo=${viewFaq.faqNo}"
	})
	
})
</script>

<style>
   #btn{
		display: flex;
        justify-content: space-around;
	}
</style>


	<div id="layoutSidenav_content">
           <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">FAQ 상세 보기</h1>
                       		 <ol class="breadcrumb mb-4">
                            		<li class="breadcrumb-item active">View FAQ details</li>
                       		 </ol>
                        			<div class="card mb-4">
                           				 <div class="card-body">
                               				 FAQ 상세 보기 View FAQ details
                            			</div>
                        			</div>

							
							<table class="table table-bordered" >
							
								<tr>
									<td class="info">글번호</td><td>${viewFaq.faqNo }</td>
									<td class="info">작성자</td><td>${viewFaq.adminId }</td>
									<td class="info">작성일</td><td><fmt:formatDate value="${viewFaq.faqDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
								</tr>
								<tr>
									<td class="info">글제목</td><td colspan="6">${viewFaq.faqTitle }</td>
								</tr>
								<tr>
									<td class="info" colspan="6">본문</td>
								</tr>
								<tr>
									<td colspan="6">${viewFaq.faqContent }</td>
								</tr>
							</table>	
							
							<div class="text-center">
								<button id="btnList" class="btn btn-primary">목록</button>
								
									<c:if test="${id eq viewFaq.adminId }">
										<button id="btnUpdate" class="btn btn-success">수정</button>
										<button id="btnDelete" class="btn btn-danger">삭제</button>
									</c:if>
								
							</div>
							
						</div>
							
					</main>
				
				</div>

