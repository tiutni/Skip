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
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
	
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

	<div id="layoutSidenav_content">
    	<main>
	        <div class="container-fluid px-4">
	            <h1 class="mt-4">FAQ 수정</h1>
	            
           		<ol class="breadcrumb mb-4">
                	<li class="breadcrumb-item active">Edit FAQ details</li>
           		</ol>
	

<form action="/admin/faq/update" method="post" enctype="multipart/form-data">

<input type="hidden" name="faqNo" value="${param.faqNo }">

<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="write" value="${id }" class="form-control" readonly="readonly">
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="faqTitle" name="faqTitle" class="form-control" value="${updateFaq.faqTitle }">
</div>
<div class="form-group">
	<label for="faqContent">본문</label>
	<textarea rows="10" style="width: 100%;" id="faqContent" name="faqContent">"${updateFaq.faqContent }"</textarea>
</div>

		<br>	
				<div class="text-center">
				
					<button class="btn btn-primary" id="btnUpdate">수정</button>
					<input type="reset" id="cancel" class="btn btn-danger" value="취소">
					
					</div>
				</form>
			
			</div>
		</main>
	</div>
</div><!-- .container end -->

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
