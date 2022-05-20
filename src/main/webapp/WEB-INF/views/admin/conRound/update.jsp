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
		<!-- ConRound -->
		<div class="container-fluid px-4">
			<h1 class="mt-4">공연 회차 관리</h1>
			
			<ol class="breadcrumb mb-4">
			    <li class="breadcrumb-item active">ConRound Management</li>
			</ol>

			<div class="card mb-4">
			    <div class="card-header">
			        <i class="fas fa-table me-1"></i>공연 회차 수정
			    </div>
			    
				<!-- 목록 -->
				<div class="card-body">
					<form action="/admin/conRound/update" method="post" enctype="multipart/form-data">
					<input type="hidden" id="conRoundNo" name="conRoundNo" class="form-control" value="${updateConRound.conRoundNo}" readonly="readonly">
					<div class="form-group">
						<label for="conNo">공연 번호</label>
						<input type="text" id="conNo" name="conNo" class="form-control" value="${updateConRound.conNo}" readonly="readonly">
					</div>
					<br>
					<div class="form-group">
						<label for="conRound">회차</label>
						<input type="text" id="conRound" name="conRound" class="form-control" value="${updateConRound.conRound}">
					</div>
					<br>
					<div class="form-group">
						<label for="conRoundStartTimeString">시작 시간</label>
						<input type="time" id="conRoundStartTimeString" name="conRoundStartTimeString" class="form-control" value="<fmt:formatDate value='${updateConRound.conRoundStartTime }' pattern='hh:mm'/>">
					</div>
					<br>
					<div class="form-group">
						<label for="conRoundEndTimeString">종료 시간</label>
						<input type="time" id="conRoundEndTimeString" name="conRoundEndTimeString" class="form-control" value="<fmt:formatDate value='${updateConRound.conRoundEndTime }' pattern='hh:mm'/>">
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