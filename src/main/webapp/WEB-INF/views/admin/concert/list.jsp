<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
function btnUnActivate(conNo){
    if(confirm("공연을 종료하시겠습니까?") == true){
        location.href="/admin/concert/unactivate?conNo="+ conNo;
    }else{
        return;
    }
}  

function btnActivate(conNo){
    if(confirm("공연을 개시하시겠습니까?") == true){
        location.href="/admin/concert/activate?conNo="+ conNo;
    }else{
        return;
    }
}

function btnUpdate(conNo){
    if(confirm("공연을 수정하시겠습니까?") == true){
        location.href="/admin/concert/update?conNo="+ conNo;
    }else{
        return;
    }
}

function btnRound(conNo){
	location.href="/admin/conRound/list?conNo="+ conNo;
}

function btnDelete(conNo){
    if(confirm("공연을 삭제하시겠습니까?") == true){
        location.href="/admin/concert/delete?conNo="+ conNo;
    }else{
        return;
    }
}

$(document).ready(function() {
	//글쓰기 버튼 클릭
	$("#btnWrite").click(function() {
		location.href = "/admin/concert/write"
	});
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/admin/concert/list?search="+$("#search").val();
	});
});
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th, td {
	text-align: center;
	vertical-align: middle;
	font-size: 1.5em;
	
}
</style>

<div id="layoutSidenav_content">
	<main>

		<!-- concert -->
		<div class="container-fluid px-4">
			<h1 class="mt-4">공연 관리</h1>
			
			<ol class="breadcrumb mb-4">
			    <li class="breadcrumb-item active">concert Management</li>
			</ol>

			<div class="card mb-4">
			    <div class="card-header">
			        <i class="fas fa-table me-1"></i>공연 목록
			    </div>
		
				<!-- 목록 -->
				<div class="card-body">
				
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th width="10%" style="text-align: center; vertical-align: middle;">번호</th>
								<th width="40%" style="text-align: center; vertical-align: middle;">제목</th>
								<th width="10%" style="text-align: center; vertical-align: middle;">작성자</th>
								<th width="10%" style="text-align: center; vertical-align: middle;">작성일</th>
								<th width="10%" style="text-align: center; vertical-align: middle;">회차</th>
								<th width="10%" style="text-align: center; vertical-align: middle;">수정</th>
								<th width="10%" style="text-align: center; vertical-align: middle;">상태</th>
								<th width="10%" style="text-align: center; vertical-align: middle;">삭제</th>
							</tr>
						</thead>
						
						<tbody>
						<c:forEach items="${list }" var="concert">
							<tr>
								<td style="vertical-align: middle;">${concert.conNo }</td>
								
								<td style="vertical-align: middle; text-align: left;">
									<c:choose>
										<c:when test="${ 1 == concert.conActivate }">
											<a href="/concert/view?conNo=${concert.conNo }">
												${concert.conTitle }
											</a>
										</c:when>
										<c:otherwise>
											${concert.conTitle }
										</c:otherwise>
									</c:choose>
								</td>
								<td style="vertical-align: middle;">${concert.adminId }</td>
								<td style="vertical-align: middle;"><fmt:formatDate value="${concert.conRegDate }" pattern="yy-MM-dd"/></td>
								<td style="vertical-align: middle;">
									<button onclick="btnRound(${concert.conNo})" id="btnRound" class="btn btn-primary">회차</button>
								</td>
								<td style="vertical-align: middle;">
									<button onclick="btnUpdate(${concert.conNo})" id="btnUpdate" class="btn btn-primary">수정</button>
								</td>
								<td style="vertical-align: middle;">
									<c:choose>
										<c:when test="${ 1 == concert.conActivate }">
											<button onclick="btnUnActivate(${concert.conNo})" id="btnUnActivate" class="btn btn-primary">개시</button>
										</c:when>
										<c:otherwise>
											<button onclick="btnActivate(${concert.conNo})" id="btnActivate" class="btn btn-secondary">종료</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td style="vertical-align: middle;">
									<button onclick="btnDelete(${concert.conNo})" id="btnDelete" class="btn btn-primary">삭제</button>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					<!-- 글쓰기 버튼 -->
					<div><button id="btnWrite" class="btn btn-primary pull-right">공연 생성</button></div>
					
					<!-- 페이징 -->
					<div class="clearfix"></div>
					
				</div>
				
				
				<c:import url="/WEB-INF/views/admin/concert/paging.jsp" />
	
			</div>
		</div>
	
	</main>

</div><!-- layoutSidenav_content -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />











