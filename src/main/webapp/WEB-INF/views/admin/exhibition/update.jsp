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
	
		<!-- Exhibition -->
		<div class="container-fluid px-4">
		<h1 class="mt-4">전시 관리</h1>
		
		<ol class="breadcrumb mb-4">
		    <li class="breadcrumb-item active">Exhibition Management</li>
		</ol>

		<div class="card mb-4">
		    <div class="card-header">
		        <i class="fas fa-table me-1"></i>전시 수정
		    </div>
			    
			<!-- 목록 -->
			<div class="card-body">
	
				<form action="/admin/exhibition/update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="exNo" value="${param.exNo }">
				<div class="form-group">
					<label for="exAdminId">작성자</label>
					<input type="text" id="exAdminId" name="adminId" value="${id}" class="form-control" readonly="readonly">
				</div>
				<br>
				<div class="form-group">
					<label for="exTitle">제목</label>
					<input type="text" id="exTitle" name="exTitle" class="form-control" value="${updateExhibition.exTitle }">
				</div>
				<br>
				<div class="form-group">
					<div id="fileBox">
						<div id="originFile">
							<a href="/admin/exhibition/download?exImgNo=${exImg.exImgNo }">${exImg.exImgOriginName }</a>
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
					<textarea rows="10" style="width: 100%;" id="content" name="exContent">${updateExhibition.exContent }</textarea>
				</div>
				<br>
				<div class="form-group">
					<label for="exAddress">위치</label>
					<input type="text" id="exAddress" name="exAddress" class="form-control" value="${updateExhibition.exAddress }">
				</div>
				<br>
				<div class="form-group">
					<label for="exStartDayString">전시 시작일</label>
					<input type="date" id="exStartDayString" name="exStartDayString" class="form-control" value="<fmt:formatDate value='${updateExhibition.exStartDay }' pattern='yyyy-MM-dd'/>">
				</div>
				<br>
				<div class="form-group">
					<label for="exEndDayString">전시 종료일</label>
					<input type="date" id="exEndDayString" name="exEndDayString" class="form-control" value="<fmt:formatDate value='${updateExhibition.exEndDay }' pattern='yyyy-MM-dd'/>">
				</div>
				<br>
				<div class="form-group">
					<label for="exReserveStartDayString">예약시작일</label>
					<input type="date" id="exReserveStartDayString" name="exReserveStartDayString" class="form-control" value="<fmt:formatDate value='${updateExhibition.exReserveStartDay }' pattern='yyyy-MM-dd'/>">
				</div>
				<br>
				<div class="form-group">
					<label for="exReserveEndDayString">예약종료일</label>
					<input type="date" id="exReserveEndDayString" name="exReserveEndDayString" class="form-control" value="<fmt:formatDate value='${updateExhibition.exReserveEndDay }' pattern='yyyy-MM-dd'/>">
				</div>
				<br>
				<div class="form-group">
					<label for="exEnterStartTimeString">입장시작시간</label>
					<input type="time" id="exEnterStartTimeString" name="exEnterStartTimeString" class="form-control" value="<fmt:formatDate value='${updateExhibition.exEnterStartTime }' pattern='hh:mm'/>">
				</div>
				<div class="form-group">
					<label for="exEnterEndTimeString">입장종료시간</label>
					<input type="time" id="exEnterEndTimeString" name="exEnterEndTimeString" class="form-control" value="<fmt:formatDate value='${updateExhibition.exEnterEndTime }' pattern='hh:mm'/>">
				</div>
				<br>
				<div class="form-group">
					<label for="exPrice">티켓당 금액</label>
					<input type="number" id="exPrice" name="exPrice" class="form-control" value="${updateExhibition.exPrice }">
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
																																																																	