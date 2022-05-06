<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {

	$("#cancel").click(function() {
		history.go(-1) });
	
	$("#id").focus();
	
})
</script>

<div class="container">

<h1>관리자 생성</h1>
<hr>

<div>
<form action="/admin/join" method="post" class="form-horizontal">
<div class="form-group">
	<label for="adminId" class="col-sm-4 control-label">관리자 아이디</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="adminId" name="adminId" placeholder="아이디 입력" required>
	<div class="check_font" id="id_check"></div>
	</div>
</div>
<div class="form-group">
	<label for="adminPw" class="col-sm-4 control-label">비밀번호</label>
	<div class="col-sm-5">
		<input type="password" class="form-control" id="adminPw" name="adminPw" placeholder="비밀번호 입력" required>
	</div>
</div>
<div class="form-group">
	<label for="adminAuth" class="col-sm-4 control-label">관리자가입인증번호</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="adminAuth" name="adminAuth" placeholder="관리자가입인증번호 입력" required>
	</div>
</div>
<div class="form-group">
	<div class="col-sm-offset-5">
		<button class="btn btn-primary">관리자 생성</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
</div>

</form>
</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />