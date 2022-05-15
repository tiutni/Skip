<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["notiContent"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	// 등록 버튼
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
		
		$("form").submit();
	})
	
	// 취소 버튼
	$("#cancel").click(function() {
		history.go(-1)
	})
	
	// 첨부파일 보여주기
	if( ${empty notiFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	// 첨부파일 삭제
	$("#deleteFile").click(function() {
		$("#originFile").toggleClass("through")
		$("#newFile").toggle();
	})

})
</script>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "notiContent"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>



<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

a {
	text-decoration-line: none;
	color: white;
}

#btn{
	display: flex;
    justify-content: space-around;
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


<div class="container">

	<div id="layoutSidenav_content">
    	<main>
	        <div class="container-fluid px-4">
	            <h1 class="mt-4">공지사항 수정</h1>
	            
           		<ol class="breadcrumb mb-4">
                	<li class="breadcrumb-item active">Edit Notice details</li>
           		</ol>
	
				<form action="/admin/noti/update" method="post" enctype="multipart/form-data">

					<div class="form-group">
						<label for="write">작성자</label>
						<input type="text" id="write" value="${adminId }" class="form-control" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label for="title">제목</label>
						<input type="text" id="notiTitle" name="notiTitle" class="form-control">
					</div>
					<div class="form-group">
						<label for="notiContent">본문</label>
						<textarea rows="10" style="width: 100%;" id="notiContent" name="notiContent"></textarea>
					</div>
					<div class="form-group">
						<label for="notiFile">첨부파일</label>
						<input type="file" id="notiFile" name="notiFile">
					</div>
			
					<br><br>
					<div id="btn">
						<button class="btn btn-primary" id="btnWrite">등록</button>
						<input type="reset" id="cancel" class="btn btn-danger" value="취소">
						
					</div>
	
				</form>

			</div>
		</main>
	</div>
</div><!-- .container end -->





<!-- NOTICE 수정하기 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				Notice 수정
			</h3>
			<br><br><br>
		</div>

		
				
		<form action="/admin/noti/update" method="post" enctype="multipart/form-data">
		<%-- <input type="hidden" name="notiNo" value="${updateNoti.notiNo }"> --%>
		<input type="hidden" name="notiNo" value="${param.notiNo }">
		
		<div class="form-group">
			<label for="write">작성자</label>
			<input type="text" id="write" value="${adminId }" class="form-control" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" id="title" name="title" class="form-control" value="${updateNoti.notiTitle }">
		</div>
		<div class="form-group">
			<label for="content">본문</label>
			<textarea rows="10" style="width: 100%;" id="content" name="content">${updateNoti.notiContent }</textarea>
		</div>
		
		<div class="form-group">
		
			<div id="fileBox">
				<div id="originFile">
					<a href="admin/noti/download?fileNo=${notiFile.notiFileNo }">${notiFile.notiFileOriginName }</a>
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
		
		
		<br><br><br>
		<div class="text-center">
			<button class="btn btn-primary" id="btnUpdate">수정</button>
			<input type="reset" id="cancel" class="btn btn-danger" value="취소">
		</div>
		</form>

				


	</div> <!-- .container end -->

</section>









