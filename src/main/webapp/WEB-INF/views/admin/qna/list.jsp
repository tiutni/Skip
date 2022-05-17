<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	if(qnaMent.getqnaMentContent() == null || "".equals(qnaMent.getqnaMentContent())){
		qnaMent.setqnaMentContent("관리자의 답변을 기다리는 중입니다");
	}
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
                        <h1 class="mt-4">QnA 관리</h1>
                        <ol class="breadcrumb mb-4">
  
                            <li class="breadcrumb-item active">QnA Management</li>
                        </ol>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                QnA
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th width=10%>No</th>
                                            <th width=20%>회원 번호</th>
                                            <th width=20%>문의 날짜</th>
                                            <th width=40%>문의 제목</th>
                                            <th width=40%>문의 내용</th>
                                            <th width=40%>답변 내용</th>
                                        </tr>
                                    </thead>

 									<tbody>
										<c:forEach items="${list }" var="qna">
											<tr>
												<td>${qna.qnaNo }</td>
												<td>${qna.userNo }</td>
												<td><fmt:formatDate value="${qna.qnaDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
												<td><a href="/admin/qna/view?qnaNo=${qna.qnaNo }">${qna.qnaTitle }</td>
												<td>${qna.qnaContent }</td>
												<td>${qnaMent.qnaMentContent }</td>
												
											</tr>
										</c:forEach>
									</tbody>
                                </table>
                                
							</div>
								
                        </div>
                        	 </div>
								 
                </main>
         </div>
