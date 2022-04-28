<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})
	
	$("#id").focus();
})
</script>

<div class="container">

<h1>회원 가입</h1>
<hr>

<div>
<form action="/user/join" method="post" class="form-horizontal">
<div class="form-group">
	<label for="userId" class="col-sm-4 control-label">아이디</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디 입력">
	</div>
</div>
<div class="form-group">
	<label for="userPw" class="col-sm-4 control-label">비밀번호</label>
	<div class="col-sm-5">
		<input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호 입력">
	</div>
</div>
<div class="form-group">
	<label for="userNick" class="col-sm-4 control-label">닉네임</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userNick" name="userNick" placeholder="닉네임 입력">
	</div>
</div>
<div class="form-group">
	<label for="userEmail" class="col-sm-4 control-label">이메일</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일 입력">
	</div>
</div>
<div class="form-group">
	<label for="userName" class="col-sm-4 control-label">이름</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userName" name="userName" placeholder="이름 입력">
	</div>
</div>
<div class="form-group">
	<label for="userRrn" class="col-sm-4 control-label">주민등록번호</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userRrn" name="userRrn" placeholder="주민등록번호 입력">
	</div>
</div>
<div class="form-group">
	<label for="userTelecom" class="col-sm-4 control-label">통신사</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userTelecom" name="userTelecom" placeholder="통신사 입력">
	</div>
</div>
<div class="form-group">
	<label for="userPhone" class="col-sm-4 control-label">휴대폰 번호</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="휴대폰 번호 입력">
	</div>
</div>

<div class="form-group">
	<div class="col-sm-offset-5">
		<button class="btn btn-primary">회원 가입</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
</div>

</form>
</div>

</div><!-- .container end -->