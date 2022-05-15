<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/qna/admlist"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/qna/admdelete?qnaNo=${viewQna.qnaNo}"
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
                        <h1 class="mt-4">QNA 상세 보기</h1>
                       		 <ol class="breadcrumb mb-4">
                            		<li class="breadcrumb-item active">View QNA details</li>
                       		 </ol>
                        			<div class="card mb-4">
                           				 <div class="card-body">
                               				 QNA 상세 보기 View QNA details
                            			</div>
                        			</div>

							
							<table class="table table-bordered" >
							
								<tr>
									<td class="info">글 번호</td><td>${viewQna.qnaNo }</td>
								<tr>
								<tr>
									<td class="info">유저 번호</td><td>${viewQna.userNo }</td>
								</tr>
								<tr>
									<td class="info">문의 날짜</td><td><fmt:formatDate value="${viewQna.qnaDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
								</tr>
								<tr>
									<td class="info">문의 제목</td><td colspan="6">${viewQna.qnaTitle }</td>
								</tr>
								<tr>
									<td class="info" colspan="6">문의 내용</td>
								</tr>
								<tr>
									<td colspan="6">${viewQna.qnaContent }</td>
								</tr>
								<tr>
									<td class="info">첨부파일</td><td><a href="/qna/download?qnaFileNo=${qnaFile.qnaFileNo }">${qnaFile.qnaFileOriginName }</a></td>
								</tr>
								
							</table>	
							
							<div class="text-center">
									<button id="btnList" class="btn btn-primary">목록</button>
									<button id="btnDelete" class="btn btn-danger">삭제</button>
								
							</div>
							
							
						</div>
							
					</main>
				
				</div>

