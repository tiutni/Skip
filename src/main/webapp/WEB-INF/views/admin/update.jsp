<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {

	$("#cancel").click(function() {
		history.go(-1) });

})

function test(){

	var p1 = document.getElementById('adminPw').value;
	var p2 = document.getElementById('CheckAdminPw').value;

	if(p1 == "" || p2 == ""){
	alert("비밀번호를 입력해주세요."); 
	return false;
	}

	if(p1 != p2){
	alert("비밀번호가 일치하지 않습니다");
	return false;
	
	} else {
	alert("비밀번호가 일치합니다")
	return true;
	}
	
} 
</script>

<div class="container">

<h1>관리자 생성</h1>
<hr>

<div>
<form action="/admin/update" method="post" class="form-horizontal">

<div class="form-group">
	<input type="hidden" id="adminId" name="adminId" value="${id }">
</div>

<div class="form-group">
	<label for ="adminPw">패스워드</label>
	<input type="password" id="adminPw" name="adminPw" placeholder="변경할 비밀번호" required />
</div>

<div class="form-group">
	<label for ="CheckAdminPw">패스워드 중복 체크</label>
	<input type="password" id="CheckAdminPw" name="CheckAdminPw" placeholder="비밀번호 확인" required />
	
	<input type="button" onclick="test()" value="확인" >
	
</div>

<div class="form-group">
	<div class="col-sm-offset-5">
		<button class="btn btn-primary">수정</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
</div>

</form>
</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />