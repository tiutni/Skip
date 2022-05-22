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

		<!-- ConRound -->
		<div class="container-fluid px-4">
			<h1 class="mt-4">공연 회차 관리</h1>
			
			<ol class="breadcrumb mb-4">
			    <li class="breadcrumb-item active">ConRound Management</li>
			</ol>

			<div class="card mb-4">
			    <div class="card-header">
			        <i class="fas fa-table me-1"></i>공연 회차 생성
			    </div>
		
				<!-- 목록 -->
				<div class="card-body">
		
					<form action="/admin/conRound/write" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="conNo">공연 번호</label>
						<input type="text" id="conNo" name="conNo" value="${conRoundConNo}" class="form-control" readonly="readonly">
					</div>
					<br>
					<div class="form-group">
						<label for="conRound">회차</label>
						<input type="text" id="conRound" name="conRound" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="conRoundStartTimeString">시작 시간</label>
						<input type="time" id="conRoundStartTimeString" name="conRoundStartTimeString" class="form-control" value="10:00:00">
					</div>
					
					<div class="form-group">
						<label for="conRoundEndTimeString">종료 시간</label>
						<input type="time" id="conRoundEndTimeString" name="conRoundEndTimeString" class="form-control" value="18:00:00">
					</div>
					<br>
					<div class="text-center">
						<button class="btn btn-primary" id="btnWrite">생성 완료</button>
						<input type="reset" id="cancel" class="btn btn-danger" value="취소">
					</div>
					</form>
					
				</div>
			</div>
		</div>

	</main>
</div><!-- layoutSidenav_content -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />