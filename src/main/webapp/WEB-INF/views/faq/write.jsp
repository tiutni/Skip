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
	oEditors.getById["faqContent"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function(){
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

a {
	text-decoration-line: none;
	
	color: white;
}

</style>

<div class="container">

<h1>FAQ 글쓰기</h1>
<hr>

<form action="/faq/write" method="post" enctype="multipart/form-data">

<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="write" value="${id }" class="form-control" readonly="readonly">
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="faqTitle" name="faqTitle" class="form-control">
</div>
<div class="form-group">
	<label for="faqContent">본문</label>
	<textarea rows="10" style="width: 100%;" id="faqContent" name="faqContent"></textarea>
</div>


	<div class="text-center">
	
		<button class="btn btn-primary" id="btnWrite">작성</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소">
		
	</div>
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "faqContent"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>



</div><!-- .container end -->