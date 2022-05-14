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

$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/member/list"
	})
	
})
</script>

<style>
   #btn{
		display: flex;
        justify-content: space-around;
	}
</style>


<div class="container">

	<div id="layoutSidenav_content">
           <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원 상세 보기</h1>
                       		 <ol class="breadcrumb mb-4">
                            		<li class="breadcrumb-item active">View Member details</li>
                       		 </ol>
                        			<div class="card mb-4">
                           				 <div class="card-body">
                               				 회원 상세 보기 View Member details
                            			</div>
                        			</div>

							
							<table class="table table-bordered" >
							
							<tr>
								<td class="info">회원번호</td><td>${viewMember.userNo }</td>
							</tr>
							<tr>
								<td class="info">아이디</td><td>${viewMember.userId }</td>
							</tr>	
							<tr>
								<td class="info">닉네임</td><td>${viewMember.userNick }</td>
							</tr>	
							<tr>	
								<td class="info">이메일</td><td>${viewMember.userEmail }</td>
							</tr>
							<tr>	
								<td class="info">이름</td><td>${viewMember.userName }</td>
							</tr>	
							<tr>	
								<td class="info">통신사</td><td>${viewMember.userTelecom }</td>
							</tr>
							<tr>	
								<td class="info">휴대폰번호</td><td>${viewMember.userPhone }</td>
							</tr>
							<tr>		
								<td class="info">회원가입일자</td><td><fmt:formatDate value="${viewMember.userRegdate }" pattern="yy-MM-dd HH:mm:ss"/></td>
							</tr>
							<tr>		
								<td class="info">공연 회원등급 번호</td><td>${viewMember.conUserLevelNo }</td>
							</tr>
							<tr>		
								<td class="info">전시회 회원등급 번호</td><td>${viewMember.exUserLevelNo }</td>
							</tr>
							</table>	
							
							
							<div id="btn"><button id="btnList" class="btn btn-primary">목록</button><button onclick="button_event(${user.userNo})" id="btnDelete" class="btn btn-danger">탈퇴</button></div>
							
							
						</div>
							
					</main>
				
				</div>

</div><!-- .container end -->

