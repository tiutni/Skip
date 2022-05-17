<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})
	
	$("#id").focus();
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>


<!-- 회원 정보 수정 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				My Information Update
			</h3>
		</div>
         <br><br><br>
		
			



<div class="container">
<form action="/userinfo/update" method="post" class="form-horizontal">
<input type="hidden" name="userNo" value="${updateUser.userNo }">

<div class="form-group">
	<label for="userId" class="col-sm-4 control-label">아이디</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userId" value="${updateUser.userId }" name="userId" readonly="readonly">
	</div>
</div>
<div class="form-group">
	<label for="userPw" class="col-sm-4 control-label">비밀번호</label>
	<div class="col-sm-5">
		<input type="password" class="form-control" id="userPw" value="${updateUser.userPw }" name="userPw" >
	</div>
</div>
<div class="form-group">
	<label for="userNick" class="col-sm-4 control-label">닉네임</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userNick" value="${updateUser.userNick }" name="userNick" >
	</div>
</div>
<div class="form-group">
	<label for="userEmail" class="col-sm-4 control-label">이메일</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userEmail"  value="${updateUser.userEmail }" name="userEmail"  >
	</div>
</div>
<div class="form-group">
	<label for="userName" class="col-sm-4 control-label">이름</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userName" value="${updateUser.userName }" name="userName" >
	</div>
</div>
<div class="form-group">
	<label for="userRrn" class="col-sm-4 control-label">주민등록번호</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userRrn"  value="${updateUser.userRrn }" name="userRrn" readonly="readonly" >
	</div>
</div>
<div class="form-group">
	<label for="userPhone" class="col-sm-4 control-label">휴대폰 번호</label>
	<div class="col-sm-5">
		<select id="userTelecom" name="userTelecom">
			<option value="SKT" selected>SKT</option>
			<option value="KT">KT</option>
			<option value="LG">LG</option>
		</select>
		<input type="text" class="form-control" id="userPhone" value="${updateUser.userPhone}" name="userPhone" >
	</div>
	<div class="check" id="userPhoneCheck"></div>
</div>
<div class="form-group">
	<label for="userAddr" class="col-sm-4 control-label">주소</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userAddr1" name="userAddr" value="${updateUser.userAddr }" >
		<button type="button" id="userAddrSearch" name="userAddrSearch">검색</button>
		<br>
		<input type="text" class="form-control" id="userAddr2" name="userAddr"  >
	</div>
	<div class="check" id="userAddrCheck"></div>
</div>

<br><br>

<div class="form-group">
	<div class="col-sm-offset-5">
		<button id="submit" class="btn btn-primary">회원정보 수정</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
</div>

</form>
</div>

</div><!-- .container end -->

</section>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

