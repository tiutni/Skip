<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/loginHeader.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 유효성 검사
	var userIdValidation = false;
	$("#userId").blur(function checkId() {
		
		var userId = $("#userId").val();
		
		if($("#userId").val().length == 0) {
			userIdValidation = false;
		} else {
			userIdValidation = true;
		}
	})
	
	// 이름 유효성 검사
	var userNameValidation = false;
	$("#userName").blur(function checkName() {
		
		var userName = $("#userName").val();

		if($("#userName").val().length == 0) {
			userNameValidation = false;
     	} else {
			userNameValidation = true;
		}
	})
	
	// 핸드폰 유효성 검사
	var userPhoneValidation = false;
	$("#userPhone").blur(function checkPhone() {
		
		var userPhone = $("#userPhone").val();
		
		if($("#userPhone").val().length == 0) {
			userPhoneValidation = false;
		} else {
			userPhoneValidation = true;
		}
	});
	
	// onsubmit 조건
	$("#formBtn").click(function btnClick() {
		
		if (userIdValidation && userNameValidation && userPhoneValidation) {
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
							<h2 class="ltext-201 cl13 p-t-19 p-b-43 respon1">
								Find Skip Pw
							</h2>
						</div>
							
						<form action="/user/findPw" method="post" class="size-202" id="form" onsubmit="return false">
						
							<label class="stext-110 cl0 m-b-2" for="userId">아이디</label>
							<div class="bor8 bg0 m-b-12">
								<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userId" name="userId" placeholder="아이디 입력">
							</div>
						
							<label class="stext-110 cl0 m-b-2" for="userName">이름</label>
							<div class="bor8 bg0 m-b-12">
								<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userName" name="userName" placeholder="이름 입력">
							</div>
				
							<div class="m-b-12">
								<label class="stext-110 cl0 m-b-2" for="userPhone">휴대폰 번호</label>
								<div class="flex-w w-full" style="flex-flow: nowrap;">
									<select class="stext-111 cl8 plh3 p-lr-15 bor8 telecom" id="userTelecom" name="userTelecom">
										<option value="SKT" selected>SKT</option>
										<option value="KT">KT</option>
										<option value="LG">LG</option>
									</select>
									<div class="bor8 bg0" style="width: 100%;">
										<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userPhone" name="userPhone" placeholder="휴대폰 번호 입력">
									</div>
								</div>
							</div>
								
							<div>	
								<button class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn3 p-lr-15 trans-04 pointer" id="formBtn" style="border-radius: 2px">비밀번호 찾기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> <!-- Slider End -->
<c:import url="/WEB-INF/views/layout/loginFooter.jsp" />