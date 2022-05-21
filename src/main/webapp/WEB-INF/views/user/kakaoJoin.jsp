<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/loginHeader.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 닉네임 유효성 검사 및 중복 검사
	var userNickValidation = false;
	$("#userNick").blur(function checkNick() {
		
		var userNick = $("#userNick").val();
		var regularExpression = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/;
		
		if (!regularExpression.test(userNick)) {
			$("#userNickCheck").html("문자 또는 숫자로 입력하세요.");
			$("#userNickCheck").attr("class", "text-warning");
			userNickValidation = false;
		} else {
			$.ajax({
			url : "/user/join/userNickCheck?userNick=" + userNick
		   ,type : "GET"
		   ,dataType : "JSON"
		   ,data: userNick
		   ,contentType : "application/json; charset=UTF-8"
		   ,success : function(data) {
			   
			   if (data == 0) {
					$("#userNickCheck").html("사용 가능한 닉네임입니다.");
					$("#userNickCheck").attr("class", "text-success");
					userNickValidation = true;
				} else {
					$("#userNickCheck").html("이미 존재하는 닉네임입니다.");
					$("#userNickCheck").attr("class", "text-warning");
					userNickValidation = false;
					}	
				}		
			})
		}
		
		if($("#userNick").val().length == 0) {
			$("#userNickCheck").html("닉네임을 입력하세요.");
			$("#userNickCheck").attr("class", "text-warning");
			userNickValidation = false;
     	}
	})
	
	// 이메일 유효성 검사 및 중복 검사
	var userEmailValidation = false;
	$("#userEmail").blur(function checkEmail() {
		
		var userEmail = $("#userEmail").val();
		var regularExpression = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

		if (!regularExpression.test(userEmail)) {
			$("#userEmailCheck").html("이메일 형식이 올바르지 않습니다.");
			$("#userEmailCheck").attr("class", "text-warning");
			userEmailValidation = false;
		} else {
			$.ajax({
			url : "/user/join/userEmailCheck?userEmail=" + userEmail
		   ,type : "GET"
		   ,dataType : "JSON"
		   ,data: userEmail
		   ,contentType : "application/json; charset=UTF-8"
		   ,success : function(data) {
			   
			   if (data == 0) {
					$("#userEmailCheck").html("사용 가능한 이메일입니다.");
					$("#userEmailCheck").attr("class", "text-success");
					userEmailValidation = true;
				} else {
					$("#userEmailCheck").html("이미 존재하는 이메일입니다.");
					$("#userEmailCheck").attr("class", "text-warning");
					userEmailValidation = false;
					}	
				}		
			})
		}
		
		if($("#userEmail").val().length == 0) {
			$("#userEmailCheck").html("이메일을 입력하세요.");
			$("#userEmailCheck").attr("class", "text-warning");
			userEmailValidation = false;
	     }
	})
	
	// 이름 유효성 검사
	var userNameValidation = false;
	$("#userName").blur(function checkName() {
		
		var userName = $("#userName").val();
		var regularExpression = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		if (!regularExpression.test(userName)) {
			$("#userNameCheck").html("한글로 입력하세요.");
			$("#userNameCheck").attr("class", "text-warning");
			userNameValidation = false;
		} else {
			$("#userNameCheck").html("");
			userNameValidation = true;
		}
		
		if($("#userName").val().length == 0) {
			$("#userNameCheck").html("이름을 입력하세요.");
			$("#userNameCheck").attr("class", "text-warning");
			userNameValidation = false;
     	}
	})
	
	// 주민등록번호 유효성 검사 및 중복 검사
	var userRrnValidation = false;
	$("#userRrn").blur(function checkRrn() {
		
		var userRrn = $("#userRrn").val();
		var regularExpression = /^[0-9]{13}$/;

		if (!regularExpression.test(userRrn)) {
			$("#userRrnCheck").html("13자의 숫자 형태로 입력하세요.");
			$("#userRrnCheck").attr("class", "text-warning");
			userRrnValidation = false;
		} else {
			$.ajax({
			url : "/user/join/userRrnCheck?userRrn=" + userRrn
		   ,type : "GET"
		   ,dataType : "JSON"
		   ,data: userRrn
		   ,contentType : "application/json; charset=UTF-8"
		   ,success : function(data) {
			   
			   if (data == 0) {
					$("#userRrnCheck").html("사용 가능한 주민등록번호입니다.");
					$("#userRrnCheck").attr("class", "text-success");
					userRrnValidation = true;
				} else {
					$("#userRrnCheck").html("이미 등록된 주민등록번호입니다.");
					$("#userRrnCheck").attr("class", "text-warning");
					userRrnValidation = false;
					}	
				}		
			})
		}
		
		if($("#userRrn").val().length == 0) {
			$("#userRrnCheck").html("주민등록번호를 입력하세요.");
			$("#userRrnCheck").attr("class", "text-warning");
			userRrnValidation = false;
  		}
	})
		
	// 핸드폰 유효성 검사 및 중복 검사
	var userPhoneValidation = false;
	$("#userPhone").blur(function checkPhone() {
		
		var userPhone = $("#userPhone").val();
		var regularExpression = /^[0-9]{11}$/;

		if (!regularExpression.test(userPhone)) {
			$("#userPhoneCheck").html("11자의 숫자 형태로 입력하세요.");
			$("#userPhoneCheck").attr("class", "text-warning");
			userPhoneValidation = false;
		} else {
			$.ajax({
			url : "/user/join/userPhoneCheck?userPhone=" + userPhone
		   ,type : "GET"
		   ,dataType : "JSON"
		   ,data: userPhone
		   ,contentType : "application/json; charset=UTF-8"
		   ,success : function(data) {
			   
			   if (data == 0) {
					$("#userPhoneCheck").html("사용 가능한 핸드폰 번호입니다.");
					$("#userPhoneCheck").attr("class", "text-success");
					userPhoneValidation = true;
				} else {
					$("#userPhoneCheck").html("이미 등록된 핸드폰 번호입니다.");
					$("#userPhoneCheck").attr("class", "text-warning");
					userPhoneValidation = false;
					}	
				}		
			})
		}
		
		if($("#userPhone").val().length == 0) {
			$("#userPhoneCheck").html("핸드폰 번호를 입력하세요.");
			$("#userPhoneCheck").attr("class", "text-warning");
			userPhoneValidation = false;
		}
	});
	
	// 주소1 유효성 검사
	var userAddr1Validation = false;
	$("#userAddr1").blur(function checkAddr1() {
		
		var userAddr1 = $("#userAddr1").val();
		
		if(userAddr1.length == 0) {
			userAddr1Validation =  false;
     	}
	})
	
	// 주소2 유효성 검사
	var userAddr2Validation = false;
	$("#userAddr2").blur(function checkAddr2() {
		
		var userAddr2 = $("#userAddr2").val();
		
		if(userAddr2.length == 0) {
			$("#userAddrCheck").html("주소 입력을 확인을 입력하세요.");
			$("#userAddrCheck").attr("class", "text-warning");
			userAddr2Validation =  false;
     	}
	})
	
	// 카카오 주소 찾기
	document.getElementById("userAddrSearch").addEventListener("click", function(){
		new daum.Postcode({
			oncomplete: function(data) {
			document.getElementById("userAddr1").value = data.address;
			}
		}).open();
	});
	
	// onsubmit 조건
	$("#formBtn").click(function btnClick() {
		if (userNickValidation && userEmailValidation && userNameValidation && userRrnValidation && userPhoneValidation) {
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
								Join
							</h2>
						</div>
							
						<form action="/user/kakaoJoin" method="post" class="size-202" id="form" onsubmit="return false">
						
							<div>
								<input type="hidden" id="userId" name="userId" value="${userId}">
								<input type="hidden" id="userPw" name="userPw" value="${userPw}">
							</div>
							
							<div class="m-b-12">
								<label class="stext-110 cl0 m-b-2" for="userNick">닉네임</label>
								<div class="bor8 bg0">
									<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userNick" name="userNick" placeholder="닉네임 입력">
								</div>
								<div class="check" id="userNickCheck"></div>
							</div>
							
							<div class="m-b-12">
								<label class="stext-110 cl0 m-b-2" for="userEmail">이메일</label>
								<div class="bor8 bg0">
									<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userEmail" name="userEmail" placeholder="이메일 입력">
								</div>
								<div class="check" id="userEmailCheck"></div>
							</div>
							
							<div class="m-b-12">
								<label class="stext-110 cl0 m-b-2" for="userName">이름</label>
								<div class="bor8 bg0">
									<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userName" name="userName" placeholder="이름 입력">
								</div>
								<div class="check" id="userNameCheck"></div>
							</div>
							
							<div class="m-b-12">
								<label class="stext-110 cl0 m-b-2" for="userRrn">주민등록번호</label>
								<div class="bor8 bg0">
									<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userRrn" name="userRrn" placeholder="주민등록번호 입력">
								</div>
								<div class="check" id="userRrnCheck"></div>
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
								<div class="check" id="userPhoneCheck"></div>
							</div>
							
							<div>
								<label class="stext-110 cl0 m-b-2" for="userAddr">주소</label>
								<div class="flex-w w-full m-b-5" style="flex-flow: nowrap">
									<div class="bor8 bg0" style="width: 100%; margin-right: 5px">
										<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userAddr1" name="userAddr" placeholder="주소 입력" readonly="readonly">
									</div>
									<button type="button" class="flex-c-m stext-101 cl0 addr-btn bg1 hov-btn1 p-lr-15 trans-04 pointer" id="userAddrSearch" name="userAddrSearch" style="border-radius: 2px;">검색</button>
								</div>
								<div class="bor8 bg0">	
									<input type="text" class="stext-111 cl8 plh3 size-111 p-lr-15" id="userAddr2" name="userAddr" placeholder="상세 주소 입력">
								</div>
								<div class="check" id="userAddrCheck"></div>
							</div>
						
							<div class="p-t-19 p-b-43">	
								<button class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn3 p-lr-15 trans-04 pointer" id="formBtn" style="border-radius: 2px">카카오 회원 가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> <!-- Slider End -->
<c:import url="/WEB-INF/views/layout/loginFooter.jsp" />