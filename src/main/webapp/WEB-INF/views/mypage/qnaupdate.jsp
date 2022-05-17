<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
		
		$("form").submit();
	})
})

$(document).ready(function() {
		if( ${empty qnaFile} ){
			$("#qnaNewFile").show()
		} else {
			$("#qnaOriginFile").show()
		}
		
		$("#qnaDeleteFile").click(function(){
			$("#qnaOriginFile").toggleClass("through")
			$("#qnaNewFile").toggle();
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
.through {
	text-decoration:line-through;
}
#deleteQnaFile {
	font-size: 1.5em;
	font-weight: bold;
	color: red;
}
#qnaNewFile, #qnaOriginFile {
	display: none; 
}
</style>

<div class="container">

<h1>Meine Anfrage</h1>
<hr>

<form action="/mypage/qnaupdate" method="post" enctype="multipart/form-data">
<input type ="hidden" name="qnaNo" value="${param.qnaNo }">


<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="write" value="${userNo }" class="form-control" readonly="readonly"> <!-- userId를 가져온다 -->
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="qnaTitle" name="qnaTitle" class="form-control" value="${updateQna.qnaTitle }">
</div>
<div class="form-group">
	<label for="qnaContent">본문</label>
	<textarea rows="10" style="width: 100%;" id="qnaContent" name="qnaContent" >${updateQna.qnaContent }</textarea>
</div>

<div class="form-group">

	<div id="fileBox">
		<div id="qnaOriginFile">
			<a href="/qna/download?qnaFileNo=${qnaFile.qnaFileNo }">${qnaFile.qnaFileOriginName }</a>
			<span id="qnaDeleteFile">X</span>
		</div>		
		
		<div id="qnaNewFile">
			<hr>
			<label for="file">새로운 첨부파일</label>
			<input type="file" id="file" name="file">
			<small>새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
		</div>		
	</div>
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>

</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "qnaContent"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>



</div><!-- .container end -->

