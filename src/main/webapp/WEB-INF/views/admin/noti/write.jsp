<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="../../resources/se2/js/service/HuskyEZCreator.js"></script>

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

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "content"
	, sSkinURI: "../../resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>



<!-- NOTICE 작성하기 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				Notice 작성
			</h3>
			<br><br><br>
		</div>

		
		
		
		<form action="/admin/noti/write" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="write">작성자</label>
			<input type="text" id="write" value="${adminId }" class="form-control" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" id="title" name="title" class="form-control">
		</div>
		<div class="form-group">
			<label for="content">본문</label>
			<textarea rows="10" style="width: 100%;" id="content" name="content"></textarea>
		</div>
		
		<div class="form-group">
			<label for="file">첨부파일</label>
			<input type="file" id="file" name="file">
		</div>
		
		<br><br><br>
		<div class="text-center">
			<button class="btn btn-primary" id="btnWrite">작성</button>
			<input type="reset" id="cancel" class="btn btn-danger" value="취소">
		</div>
		</form>
		

				


	</div> <!-- .container end -->

</section>







