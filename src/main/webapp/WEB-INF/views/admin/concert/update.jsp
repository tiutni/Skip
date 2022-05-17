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
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
		
		$("form").submit();
	})
})
</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1);
	})

	
	if( ${empty exImg} ) {
		$("#newFile").show();
	} else {
		$("#originFile").show();
	}
	
	$("#deleteFile").click(function() {
		$("#originFile").toggleClass("through");
		$("#newFile").toggle();
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
.through {
	text-decoration: line-through;
}

#deleteFile {
	font-size: 1.5em;
	font-weight: bold;
	color: red;
}

#newFile, #originFile {
	display: none;
}
</style>

<div id="layoutSidenav_content">
	<main>
	
		<!-- Concert -->
		<div class="container-fluid px-4">
		<h1 class="mt-4">공연 관리</h1>
		
		<ol class="breadcrumb mb-4">
		    <li class="breadcrumb-item active">Concert Management</li>
		</ol>

		<div class="card mb-4">
		    <div class="card-header">
		        <i class="fas fa-table me-1"></i>공연 수정
		    </div>
			    
			<!-- 목록 -->
			<div class="card-body">
	
				<form action="/admin/concert/update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="conNo" value="${concert.conNo }">
				<div class="form-group">
					<label for="conAdminId">작성자</label>
					<input type="text" id="conAdminId" name="adminId" value="${id}" class="form-control" readonly="readonly">
				</div>
				<br>
				<div class="form-group">
					<label for="conTitle">제목</label>
					<input type="text" id="conTitle" name="conTitle" class="form-control">
				</div>
				<br>
				<div class="form-group">
					<div id="fileBox">
						<div id="originFile">
							<a href="/admin/concert/download?conImgNo=${conImg.conImgNo }">${conImg.conImgOriginName }</a>
							<span id="deleteFile">X</span>
						</div>
				
						<div id="newFile">
							<hr>
							<label for="file">새로운 첨부파일</label>
							<input type="file" id="file" name="file">
							<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
						</div>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="content">본문</label>
					<textarea rows="10" style="width: 100%;" id="content" name="conContent"></textarea>
				</div>
				<br>
				<div class="form-group">
					<label for="conAddress">위치</label>
					<input type="text" id="conAddress" name="conAddress" class="form-control" value="서울 종로구 세종대로 175">
				</div>
				<br>
				<div class="form-group">
					<label for="conStartDayString">공연 시작일</label>
					<input type="date" id="conStartDayString" name="conStartDayString" class="form-control" value="2022-05-16">
				</div>
				<br>
				<div class="form-group">
					<label for="conEndDayString">공연 종료일</label>
					<input type="date" id="conEndDayString" name="conEndDayString" class="form-control" value="2022-05-31">
				</div>
				<br>
				<div class="form-group">
					<label for="conReserveStartDayString">예약시작일</label>
					<input type="date" id="conReserveStartDayString" name="conReserveStartDayString" class="form-control" value="2022-05-16">
				</div>
				<br>
				<div class="form-group">
					<label for="conReserveEndDayString">예약종료일</label>
					<input type="date" id="conReserveEndDayString" name="conReserveEndDayString" class="form-control" value="2022-05-31">
				</div>
				<br>
				<div class="form-group">
					<label for="conEnterStartTime">입장시작시간</label>
					<input type="time" id="conEnterStartTime" name="conEnterStartTime" class="form-control" value="10:00:00">
				</div>
				<div class="form-group">
					<label for="conEnterEndTime">입장종료시간</label>
					<input type="time" id="conEnterEndTime" name="conEnterEndTime" class="form-control" value="18:00:00">
				</div>
				<br>
				<div class="form-group">
					<label for="conPrice">티켓당 금액</label>
					<input type="number" id="conPrice" name="conPrice" class="form-control" value="10000">
				</div>
				<br>
				
				<div class="text-center">
					<button class="btn btn-primary" id="btnUpdate">수정</button>
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