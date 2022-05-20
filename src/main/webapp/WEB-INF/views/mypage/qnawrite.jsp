<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["qnaContent"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})

// $(document).ready(function() {
	
	$("#btnWrite").click(function() {
		
		submitContents($("#btnWrite"))
		
		$("form").submit();
	})
	
})

$(document).ready(function() {
	
	$("#cancel").click(function() {
		history.go(-1)
	})
})

</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

</style>


<!-- 1:1문의 작성하기 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				QnA Write
			</h3>
			<br><br><br>
		</div>

<br>

<form action="/mypage/qnawrite" method="post" enctype="multipart/form-data">

<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="write" value="${userNo }" class="form-control" readonly="readonly"> <!-- userId를 가져온다 -->
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="qnaTitle" name="qnaTitle" class="form-control">
</div>
<div class="form-group">
	<label for="qnaContent">문의내용</label>
	<textarea rows="10" style="width: 100%;" id="qnaContent" name="qnaContent"></textarea>
</div>

<div class="form-group">
	<label for="file">첨부파일</label>
	<input type="file" id="file" name="file">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>
<br>

</form>
</div><!-- .container end -->
	
	<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors
		, elPlaceHolder: "qnaContent"
		, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
		, fCreator: "createSEditor2"
	})
	
	</script>
</section>
<c:import url="/WEB-INF/views/layout/footer.jsp" />