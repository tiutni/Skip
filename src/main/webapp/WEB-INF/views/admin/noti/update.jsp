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
		$("#notiNewFile").show()
	} else {
		$("#notiOriginFile").show()
	}
	
	// 첨부파일 삭제
	$("#notiDeleteFile").click(function() {
		$("#notiOriginFile").toggleClass("through")
		$("#notiNewFile").toggle();
	})

})
</script>



<style type="text/css">

a {
	text-decoration-line: none;
/* 	color: white; */
}

#btn{
	display: flex;
    justify-content: space-around;
}

.through {
	text-decoration: line-through;
}

#notiDeleteFile {
	font-size: 1.5em;
	font-weight: bold;
	color: red;
}

/* #notiNewFile, #notiOriginFile { */
/* 	display: none; */
/* } */

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

					<input type="hidden" name="notiNo" value="${param.notiNo }">
					
					<div class="form-group">
						<label for="write">작성자</label>
						<input type="text" id="write" value="${id }" class="form-control" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label for="notiTitle">제목</label>
						<input type="text" id="notiTitle" name="notiTitle" class="form-control" value="${updateNoti.notiTitle }">
					</div>
					<div class="form-group">
						<label for="notiContent">본문</label>
						<textarea rows="10" style="width: 100%;" id="notiContent" name="notiContent">${updateNoti.notiContent }</textarea>
					</div>
					<div class="form-group">
						<div id="fileBox">
							<div id="notiOriginFile">
								<a href="/noti/download?notiFileNo=${notiFile.notiFileNo }">${notiFile.notiFileOriginName }</a>
								<span id="notiDeleteFile">X</span>
							</div>
					
							<div id="notiNewFile">
								<hr>
								<label for="notiFile">새로운 첨부파일</label>
								<input type="file" id="notiFile" name="notiFile">
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

			</div>
		</main>
	</div>
	
	
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "notiContent"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>
	
	
</div><!-- .container end -->











