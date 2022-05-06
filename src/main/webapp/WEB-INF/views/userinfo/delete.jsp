<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
$(document).ready(function() {
	
})
</script>

<div class="container">

<h1>회원 탈퇴 </h1>
<h1>Auf Wiedersehen! </h1>

<hr>

<form action="/userinfo/delete" method="post" class="form-horizontal">

<div class="form-group">
	<label for="pw" class="col-sm-4 control-label">비밀번호를 입력하세요.</label>
	<div class="col-sm-5">
		<input type="password" class="form-control" id="userPw" name="userPw" placeholder="Bitte Passwort">
	</div>
</div>


<div class="form-group">
	<div class="col-sm-offset-5">
		<button id="submit" class="btn btn-primary">회원 탈퇴</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
</div>


</form>
</div>



	



</div><!-- .container end -->

</html>