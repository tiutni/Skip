<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
function btnUpdate(seatSeq){
	location.href="/admin/seat/update?seatSeq="+ seatSeq;
}

function btnDelete(seatSeq){
    if(confirm("공연을 삭제하시겠습니까?") == true){
        location.href="/admin/seat/delete?seatSeq="+ seatSeq;
    }else{
        return;
    }
}

function btnWrite(conRoundNo){
	location.href = "/admin/seat/write?conRoundNo="+ conRoundNo;
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
	font-size: 1.5em;
}



</style>

<div id="layoutSidenav_content">
	<main>

		<!-- seat -->
		<div class="container-fluid px-4">
			<h1 class="mt-4">공연 좌석 관리</h1>
			
			<ol class="breadcrumb mb-4">
			    <li class="breadcrumb-item active">seat Management</li>
			</ol>

			<div class="card mb-4">
			    <div class="card-header">
			        <i class="fas fa-table me-1"></i>공연 좌석 목록
			    </div>
		
				<!-- 목록 -->
				<div class="card-body">
				
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th width="20%" style="text-align: center; vertical-align: middle;">번호</th>
								<th width="20%" style="text-align: center; vertical-align: middle;">등급</th>
								<th width="20%" style="text-align: center; vertical-align: middle;">금액</th>
								<th width="20%" style="text-align: center; vertical-align: middle;">수정</th>
								<th width="20%" style="text-align: center; vertical-align: middle;">삭제</th>
							</tr>
						</thead>
						
						<tbody>
						<c:forEach items="${list }" var="seat">
							<tr>
								<td style="vertical-align: middle;">${seat.seatNo }</td>
								<td style="vertical-align: middle;">${seat.seatLevel }</td>
								<td style="vertical-align: middle;">${seat.seatPrice }원</td>
								<td style="vertical-align: middle;">
									<button onclick="btnUpdate(${seat.seatSeq})" id="btnUpdate" class="btn btn-primary">수정</button>
								</td>
								<td style="vertical-align: middle;">
									<button onclick="btnDelete(${seat.seatSeq})" id="btnDelete" class="btn btn-primary">삭제</button>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					<!-- 글쓰기 버튼 -->
					<div>
						<button id="btnConcertList" class="btn btn-primary pull-right">공연 목록</button>
						<button onclick="btnWrite(${paging.conRoundNo})" id="btnWrite" class="btn btn-primary pull-right">좌석 생성</button>
					</div>
					
					<!-- 페이징 -->
					<div class="clearfix"></div>
					
				</div>
				
				
				<c:import url="/WEB-INF/views/admin/seat/paging.jsp" />
	
			</div>
		</div>
	
	</main>

</div><!-- layoutSidenav_content -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />











