<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/admin/noti/list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/admin/noti/update?notiNo=${viewNoti.notiNo}"
	})
	
})

function button_event(e){
    if(confirm("회원을 탈퇴시키겠습니까?") == true){
        location.href="/admin/noti/delete?notiNo="+ e;
    }else{
        return;
    }
}   
</script>

<style type="text/css">

table, th {
	text-align: center;
}

#btn{
	display: flex;
    justify-content: space-around;
}
</style>


<div class="container">

	<div id="layoutSidenav_content">
           <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항 상세 보기</h1>
                       		 <ol class="breadcrumb mb-4">
                            		<li class="breadcrumb-item active">View Notice details</li>
                       		 </ol>
							
							<table class="table table-bordered" >
							
							<tr>
								<td class="info">글번호</td><td>${viewNoti.notiNo }</td>
							</tr>
							<tr>
								<td class="info">작성자</td><td>${viewNoti.adminId }</td>
							</tr>	
							<tr>
								<td class="info">작성일</td><td><fmt:formatDate value="${viewNoti.notiDate }" pattern="yy-MM-dd"/></td>
							</tr>	
							<tr>	
								<td class="info">제목</td><td colspan="3">${viewNoti.notiTitle }</td>
							</tr>
							<tr>	
								<td class="info" colspan="4">본문</td></td>
							</tr>	
							<tr>	
								<td colspan="4">${viewNoti.notiContent }</td>
							</tr>
							</table><br><br>	
							
							<div id="btn">
								<button id="btnList" class="btn btn-primary">목록</button>
								<button id="btnUpdate" class="btn btn-secondary">수정</button>
								<button onclick="button_event(${noti.notiNo})" id="btnDelete" class="btn btn-danger">삭제</button>
							</div>
							
						</div>
							
					</main>
				
				</div>

</div><!-- .container end -->




