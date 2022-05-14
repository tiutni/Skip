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
			        <i class="fas fa-table me-1"></i>전시 글쓰기
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
						<label for="file">첨부파일</label>
						<input type="file" id="file" name="file">
					</div>
					<br>
					<div class="form-group">
						<label for="content">본문</label>
						<textarea rows="10" style="width: 100%;" id="content" name="exContent"></textarea>
					</div>
					<br>
					<div class="form-group">
						<label for="exAddress">위치</label>
						<input type="text" id="exAddress" name="exAddress" class="form-control">
					</div>
					<br>
					
					
					<input style="margin-left: 70px;" type="date" id="calendar" name="date" 
					min="<fmt:formatDate value='${viewExhibition.exReserveStartDay }' pattern='yyyy-MM-dd' />" 
					max="<fmt:formatDate value='${viewExhibition.exReserveEndDay }' pattern='yyyy-MM-dd' />" /><br>
					
					
					<div class="form-group">
						<label for="exReserveStartDay">시작일</label>
						<input type="date" id="calendar" name="exReserveStartDay" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="exReserveEndDay">종료일</label>
						<input type="text" id="exReserveEndDay" name="exReserveEndDay" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="title">휴무일</label>
						<input type="text" id="exAddress" name="exAddress" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="exReserveStartDay">예약시작일</label>
						<input type="text" id="exReserveStartDay" name="exReserveStartDay" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="exReserveEndDay">예약종료일</label>
						<input type="text" id="exReserveEndDay" name="exReserveEndDay" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="exEnterStartTime">입장시작시간</label>
						<input type="text" id="exEnterStartTime" name="exEnterStartTime" class="form-control">
					</div>
					
					<div class="form-group">
						<label for="exEnterEndTime">입장종료시간</label>
						<input type="text" id="exEnterEndTime" name="exEnterEndTime" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="exEnterInterval">입장시간간격</label>
						<input type="text" id="exEnterInterval" name="exEnterInterval" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="exTicketNum">하루당 판매할 총티켓수</label>
						<input type="text" id="exTicketNum" name="exTicketNum" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="exPrice">티켓당 금액</label>
						<input type="text" id="exPrice" name="exPrice" class="form-control">
					</div>
					<br>
					
					<div class="text-center">
						<button class="btn btn-primary" id="btnWrite">작성</button>
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





















