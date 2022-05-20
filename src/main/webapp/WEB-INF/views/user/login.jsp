<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/loginHeader.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 유효성 검사 및 중복 검사
	var userIdValidation = false;
	$("#userId").blur(function checkId() {
		
		var userId = $("#userId").val();
		
		if($("#userId").val().length == 0) {
			userIdValidation = false;
		} else {
			userIdValidation = true;
		}
	})
	
	// 비밀번호 유효성 검사
	var userPwValidation = false;
	$("#userPw").blur(function checkPw() {
		
		var userPw = $("#userPw").val();

		if($("#userPw").val().length == 0) {
			userPwValidation = false;
     	} else {
			userPwValidation = true;
		}
	})
	
	// onsubmit 조건
	$("#formBtn").click(function btnClick() {
		
		if (userIdValidation && userPwValidation) {
			$("#form").attr("onsubmit","return true");
		} else {
			$("#form").attr("onsubmit","return false");
		}
	})
})
</script>

<!-- Slider -->
<section class="section-slide">
	<div class="wrap-slick1">
		<div class="slick1">
			<div class="item-slick1" style="background-image: url(../../resources/images/banner_02.png);">
				<div class="container h-full">
					<div class="flex-col-m flex-c-m h-full p-t-100 p-b-30 respon5">
						<div class="layer-slick1">
							<span class="ltext-101 cl13 respon2">
								Don't Stand In Line
							</span>
						</div>
						
						<div class="layer-slick1">
							<h2 class="ltext-201 cl13 p-t-19 p-b-43 respon1">
								Login
							</h2>
						</div>
							
						<form action="/user/login" method="post" class="size-202" id="form" onsubmit="return false">
							<div class="bor8 bg0 m-b-12">
								<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userId" name="userId" placeholder="아이디 입력">
							</div>
				
				
							<div class="bor8 bg0 m-b-12">
								<input type="password" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userPw" name="userPw" placeholder="패스워드 입력">
							</div>
							
							<div>
								<button class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn3 p-lr-15 trans-04 pointer m-b-5" id="formBtn" style="border-radius: 2px">로그인</button>
								<button type="button" class="flex-c-m stext-101 size-116 hov-btn3 p-lr-15 trans-04 pointer m-b-2 kakao" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=20a036a9e9a4a55d7de23fa420405573&redirect_uri=http://localhost:8088/user/kakaoLogin&response_type=code';" style="border-radius: 2px">카카오 로그인</button>
							</div>
								
							<div class="flex-r cl0">									
								<a href="findId" class="cl0">아이디 찾기</a>
								<label style="display: inline">&nbsp;/&nbsp;</label>
								<a href="findPw" class="cl0">비밀번호 찾기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> <!-- Slider End -->
<c:import url="/WEB-INF/views/layout/loginFooter.jsp" />