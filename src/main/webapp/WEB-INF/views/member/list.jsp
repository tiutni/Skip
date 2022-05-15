<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<script type="text/javascript">


function button_event(e){
    if(confirm("회원을 탈퇴시키겠습니까?") == true){
        location.href="/member/delete?userNo="+ e;
    }else{
        return;
    }
}      
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table {
	text-align: center;
}

</style>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원 관리</h1>
                        <ol class="breadcrumb mb-4">
  
                            <li class="breadcrumb-item active">Member Management</li>
                        </ol>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Member
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>회원 아이디</th>
                                            <th>회원 닉네임</th>
                                            <th>전시 회원등급</th>
                                            <th>공연 회원등급</th>
                                            <th>회원 관리</th>
                                        </tr>
                                    </thead>

 									<tbody>
									<c:forEach items="${list }" var="user">
										<tr>
											<td>${user.userNo }</td>
											<td><a href="/member/view?userNo=${user.userNo }">${user.userId }</td>
											<td>${user.userNick }</td>
											<td>${user.exUserLevelNo }</td>
											<td>${user.conUserLevelNo }</td>
											<td><button onclick="button_event(${user.userNo})" id="btnDelete" class="btn btn-danger">탈퇴</button></td>
											</tr>
											</c:forEach>
											</tbody>

                                </table>
                            
							</div>
                        </div>
                    </div>
                </main>
         </div>
