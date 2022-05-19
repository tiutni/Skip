<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
})
</script>

<!-- 회원탈퇴 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				회원탈퇴
			</h3>
		</div>

		

<form action="/userinfo/delete" method="post" class="form-horizontal">

<div class="form-group">
	<label for="pw" class="col-sm-4 control-label"></label>
	<div class="col-sm-5">
		<input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요">
	</div>
</div>


<div class="text-center"">
	<div class="col-sm-offset-5">
		<button id="submit" class="btn btn-primary">회원 탈퇴</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
</div>


</form>
</div>

	


	

	</div><!-- .container end -->

</section>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
