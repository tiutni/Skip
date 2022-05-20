<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
		
		$("form").submit();
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
	
})
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
		<!-- Seat -->
		<div class="container-fluid px-4">
			<h1 class="mt-4">공연 좌석 관리</h1>
			
			<ol class="breadcrumb mb-4">
			    <li class="breadcrumb-item active">Seat Management</li>
			</ol>

			<div class="card mb-4">
			    <div class="card-header">
			        <i class="fas fa-table me-1"></i>공연 좌석 생성
			    </div>
		
				<!-- 목록 -->
				<div class="card-body">
		
					<form action="/admin/seat/update" method="post" enctype="multipart/form-data">
					<input type="hidden" id="conRoundNo" name="conRoundNo" class="form-control" value="${updateSeat.conRoundNo}" readonly="readonly">
					<input type="hidden" id="seatSeq" name="seatSeq" class="form-control" value="${updateSeat.seatSeq}" readonly="readonly">
					<br>
					<div class="form-group">
						<label for="seatLevel">등급</label>
						<input type="text" id="seatLevel" name="seatLevel" class="form-control" value="${updateSeat.seatLevel}">
					</div>
					<br>
					<div class="form-group">
						<label for="seatPrice">금액</label>
						<input type="number" id="seatPrice" name="seatPrice" class="form-control" value="${updateSeat.seatPrice}">
					</div>
					<br>
					<div class="form-group">
						<label for="seatNo">번호</label>
						<input type="text" id="seatNo" name="seatNo" class="form-control" value="${updateSeat.seatNo}">
					</div>
					<br>
					<div class="text-center">
						<button class="btn btn-primary" id="btnUpdate">수정</button>
						<input type="reset" id="cancel" class="btn btn-danger" value="취소">
					</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</div><!-- layoutSidenav_content -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />