<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
function btnUpdate(conRoundNo){
    if(confirm("공연 회차를 수정하시겠습니까?") == true){
        location.href="/admin/conRound/update?conRoundNo="+ conRoundNo;
    }else{
        return;
    }
}

function btnSeat(conRoundNo){
	location.href="/admin/seat/list?conRoundNo="+ conRoundNo;
}

function btnDelete(conRoundNo){
    if(confirm("공연을 삭제하시겠습니까?") == true){
        location.href="/admin/conRound/delete?conRoundNo="+ conRoundNo;
    }else{
        return;
    }
}

function btnWrite(conNo){
	location.href = "/admin/conRound/write?conNo="+ conNo;
}

$(document).ready(function() {

	//공연 목록 보기 버튼 클릭
	$("#btnConcertList").click(function() {
		location.href = "/admin/concert/list"
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
}
</style>

<div id="layoutSidenav_content">
	<main>

		<!-- conRound -->
		<div class="container-fluid px-4">
			<h1 class="mt-4">공연 회차 관리</h1>
			
			<ol class="breadcrumb mb-4">
			    <li class="breadcrumb-item active">conRound Management</li>
			</ol>

			<div class="card mb-4">
			    <div class="card-header">
			        <i class="fas fa-table me-1"></i>공연 회차 목록
			    </div>
		
				<!-- 목록 -->
				<div class="card-body">
				
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th style="width: 5%; text-align: center; vertical-align: middle;">회차</th>
								<th style="width: 30%; text-align: center; vertical-align: middle;">시작 시간</th>
								<th style="width: 10%; text-align: center; vertical-align: middle;">종료 시간</th>
								<th style="width: 10%; text-align: center; vertical-align: middle;">좌석</th>
								<th style="width: 10%; text-align: center; vertical-align: middle;">수정</th>
								<th style="width: 10%; text-align: center; vertical-align: middle;">삭제</th>
							</tr>
						</thead>
						
						<tbody>
						<c:forEach items="${list }" var="conRound">
							<tr>
								<td style="vertical-align: middle;">${conRound.conRound }회차</td>
								<td style="vertical-align: middle;"><fmt:formatDate value="${conRound.conRoundStartTime }" pattern="hh:mm"/></td>
								<td style="vertical-align: middle;"><fmt:formatDate value="${conRound.conRoundEndTime }" pattern="hh:mm"/></td>
								<td style="vertical-align: middle;">
									<button onclick="btnSeat(${conRound.conRoundNo})" id="btnSeat" class="btn btn-primary">좌석</button>
								</td>
								<td style="vertical-align: middle;">
									<button onclick="btnUpdate(${conRound.conRoundNo})" id="btnUpdate" class="btn btn-primary">수정</button>
								</td>
								<td style="vertical-align: middle;">
									<button onclick="btnDelete(${conRound.conRoundNo})" id="btnDelete" class="btn btn-primary">삭제</button>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					<!-- 글쓰기 버튼 -->
					<div>
						<button id="btnConcertList" class="btn btn-primary pull-right">공연 목록 보기</button>
						<button onclick="btnWrite(${paging.conNo})" id="btnWrite" class="btn btn-primary pull-right">회차 추가</button>
					</div>
					
					<!-- 페이징 -->
					<div class="clearfix"></div>
					
				</div>
				
				
				<c:import url="/WEB-INF/views/admin/conRound/paging.jsp" />
	
			</div>
		</div>
	
	</main>

</div><!-- layoutSidenav_content -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />











