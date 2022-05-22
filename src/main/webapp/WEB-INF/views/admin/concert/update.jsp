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

	
	if( ${empty conImg} ) {
		$("#newFileConImg").show();
	} else {
		$("#originFileConImg").show();
	}
	
	$("#deleteFileConImg").click(function() {
		$("#originFileConImg").toggleClass("through");
		$("#newFileConImg").toggle();
	})
	
	
	if( ${empty conSeatImg} ) {
		$("#newFileConSeatImg").show();
	} else {
		$("#originFileConSeatImg").show();
	}
	
	$("#deleteFileConSeatImg").click(function() {
		$("#originFileConSeatImg").toggleClass("through");
		$("#newFileConSeatImg").toggle();
	})
})
</script>

<style type="text/css">
#deleteFileConImg, #deleteFileConSeatImg {
	font-size: 1.5em;
	font-weight: bold;
	color: red;
}

#newFileConImg, #originFileConImg, #newFileConSeatImg, #originFileConSeatImg {
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
					<input type="text" id="conTitle" name="conTitle" class="form-control" value="${updateConcert.conTitle }">
				</div>
				<br>
				<div class="form-group">
					<div id="fileBox">
						<div id="originFileConImg">
							<a href="/admin/concert/con_img/download?conImgNo=${conImg.conImgNo }">${conImg.conImgOriginName }</a>
							<span id="deleteFileConImg">X</span>
						</div>
				
						<div id="newFileConImg">
							<hr>
							<label for="fileConImg">새로운 공연이미지</label>
							<input type="file" id="fileConImg" name="fileConImg">
							<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
						</div>
					</div>
				</div>
				<br>
				<div class="form-group">
					<div id="fileBox">
						<div id="originFileConSeatImg">
							<a href="/admin/concert/con_seatimg/download?conSeatImgNo=${conSeatImg.conSeatImgNo }">${conSeatImg.conSeatImgOriginName }</a>
							<span id="deleteFileConSeatImg">X</span>
						</div>
				
						<div id="newFileConSeatImg">
							<hr>
							<label for="fileConSeatImg">새로운 좌석배치도</label>
							<input type="file" id="fileConSeatImg" name="fileConSeatImg">
							<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
						</div>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="content">공연 내용</label>
					<textarea rows="10" style="width: 100%;" id="content" name="conContent">${updateConcert.conContent }</textarea>
				</div>
				<br>
				<div class="form-group">
					<label for="conAddress">공연 장소</label>
					<input type="text" id="conAddress" name="conAddress" class="form-control" value="${updateConcert.conAddress }">
				</div>
				<br>
				<div class="form-group">
					<label for="conStartDayString">공연 시작일</label>
					<input type="date" id="conStartDayString" name="conStartDayString" class="form-control" value="<fmt:formatDate value='${updateConcert.conStartDay }' pattern='yyyy-MM-dd'/>">
				</div>
				<br>
				<div class="form-group">
					<label for="conEndDayString">공연 종료일</label>
					<input type="date" id="conEndDayString" name="conEndDayString" class="form-control" value="<fmt:formatDate value='${updateConcert.conEndDay }' pattern='yyyy-MM-dd'/>">
				</div>
				<br>
				<div class="form-group">
					<label for="conReserveStartdayVIPString">VIP예약시작일</label>
					<input type="date" id="conReserveStartdayVIPString" name="conReserveStartdayVIPString" class="form-control" value="<fmt:formatDate value='${updateConcert.conReserveStartdayVIP }' pattern='yyyy-MM-dd'/>">
				</div>
				<br>
				<div class="form-group">
					<label for="conReserveStartDayString">예약시작일</label>
					<input type="date" id="conReserveStartDayString" name="conReserveStartDayString" class="form-control" value="<fmt:formatDate value='${updateConcert.conReserveStartDay }' pattern='yyyy-MM-dd'/>">
				</div>
				<br>
				<div class="form-group">
					<label for="conReserveEndDayString">예약종료일</label>
					<input type="date" id="conReserveEndDayString" name="conReserveEndDayString" class="form-control" value="<fmt:formatDate value='${updateConcert.conReserveEndDay }' pattern='yyyy-MM-dd'/>">
				</div>
				<br>
				
				<div class="text-center">
					<button class="btn btn-primary" id="btnUpdate">수정 완료</button>
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