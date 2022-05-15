<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/admin/noti/write"
	})
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/admin/noti/list?search="+$("#search").val();
	});
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

#btn{
	display: flex;
    justify-content: space-around;
}
</style>


<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항 관리</h1>
                        <ol class="breadcrumb mb-4">
  
                            <li class="breadcrumb-item active">Notice Management</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Notice
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
									<c:forEach items="${list }" var="noti">
										<tr>
											<td>${noti.notiNo }</td>
											<td><a href="/admin/noti/view?notiNo=${noti.notiNo }">${noti.notiTitle }</td>
											<td>${noti.adminId }</td>
											<td><fmt:formatDate value="${noti.notiDate }" pattern="YY-MM-dd"/></td>
										</tr>
									</c:forEach>
									</tbody>

                                </table>
                                
                                <div id="btn">
								<button id="btnWrite" class="btn btn-primary">글쓰기</button>
								</div>
							
							</div>
                        </div>
                    </div>
                </main>
         </div>
