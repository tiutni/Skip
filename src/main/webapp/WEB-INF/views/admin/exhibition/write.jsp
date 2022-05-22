<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

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

	<!-- Exhibition -->
		<div class="container-fluid px-4">
			<h1 class="mt-4">전시 관리</h1>
			
			<ol class="breadcrumb mb-4">
			    <li class="breadcrumb-item active">Exhibition Management</li>
			</ol>

			<div class="card mb-4">
			    <div class="card-header">
			        <i class="fas fa-table me-1"></i>전시 생성
			    </div>
		
				<!-- 목록 -->
				<div class="card-body">
		
					<form action="/admin/exhibition/write" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="exAdminId">작성자</label>
						<input type="text" id="exAdminId" name="adminId" value="${id}" class="form-control" readonly="readonly">
					</div>
					<br>
					<div class="form-group">
						<label for="exTitle">제목</label>
						<input type="text" id="exTitle" name="exTitle" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="file">전시 이미지</label>
						<input type="file" id="file" name="file">
					</div>
					<br>
					<div class="form-group">
						<label for="content">전시 내용</label>
						<textarea rows="10" style="width: 100%;" id="content" name="exContent"></textarea>
					</div>
					<br>
					<div class="form-group">
						<label for="exAddress">전시 위치</label>
						<input type="text" id="exAddress" name="exAddress" class="form-control" value="서울 종로구 세종대로 175">
					</div>
					<br>
					<div class="form-group">
						<label for="exStartDayString">전시 시작일</label>
						<input type="date" id="exStartDayString" name="exStartDayString" class="form-control" value="2022-05-16">
					</div>
					<br>
					<div class="form-group">
						<label for="exEndDayString">전시 종료일</label>
						<input type="date" id="exEndDayString" name="exEndDayString" class="form-control" value="2022-05-31">
					</div>
					<br>
					<div class="form-group">
						<label for="exReserveStartDayString">예약시작일</label>
						<input type="date" id="exReserveStartDayString" name="exReserveStartDayString" class="form-control" value="2022-05-16">
					</div>
					<br>
					<div class="form-group">
						<label for="exReserveEndDayString">예약종료일</label>
						<input type="date" id="exReserveEndDayString" name="exReserveEndDayString" class="form-control" value="2022-05-31">
					</div>
					<br>
					<div class="form-group">
						<label for="exEnterStartTimeString">입장시작시간</label>
						<input type="time" id="exEnterStartTimeString" name="exEnterStartTimeString" class="form-control" value="10:00:00">
					</div>
					
					<div class="form-group">
						<label for="exEnterEndTimeString">입장종료시간</label>
						<input type="time" id="exEnterEndTimeString" name="exEnterEndTimeString" class="form-control" value="18:00:00">
					</div>
					<br>
					<div class="form-group">
						<label for="exPrice">티켓당 금액</label>
						<input type="number" id="exPrice" name="exPrice" class="form-control" value="10000">
					</div>
					<br>
					
					<div class="text-center">
						<button class="btn btn-primary" id="btnWrite">생성 완료</button>
						<input type="reset" id="cancel" class="btn btn-danger" value="취소">
					</div>
					</form>
					
					<script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors
						, elPlaceHolder: "content"
						, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
						, fCreator: "createSEditor2"
					})
					</script>
					
				</div>
			</div>
		</div>

	</main>
</div><!-- layoutSidenav_content -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />