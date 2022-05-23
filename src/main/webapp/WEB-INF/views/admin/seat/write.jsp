<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})

	
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"))
		
		$("form").submit();
	})
})
</script>

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
		
					<form action="/admin/seat/write" method="post" enctype="multipart/form-data">
					<input type="hidden" id="conRoundNo" name="conRoundNo" class="form-control" value="${seatConRoundNo}" readonly="readonly">
					<br>
					<div class="form-group">
						<label for="seatLevel">등급</label>
<!-- 						<input type="text" id="seatLevel" name="seatLevel" class="form-control"> -->
							<select id="seatLevel" name="seatLevel" class="form-control">
								<option selected="selected" value="기본">기본</option>
								<option value="VIP">VIP</option>
							</select>
					</div>
					<br>
					<div class="form-group">
						<label for="seatPrice">금액</label>
						<input type="number" id="seatPrice" name="seatPrice" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="seatNo">번호</label>
						<input type="text" id="seatNo" name="seatNo" class="form-control">
					</div>
					<br>
	
					<br>
					<div class="text-center">
						<button class="btn btn-primary" id="btnWrite">생성</button>
						<input type="reset" id="cancel" class="btn btn-danger" value="취소">
					</div>
					</form>
					
				</div>
			</div>
		</div>

	</main>
</div><!-- layoutSidenav_content -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />