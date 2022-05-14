<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			$("#userNickCheck").html("하나 이상의 문자(한글, 영문) 또는 숫자를 포함해 입력하세요.");
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
			$("#userNickCheck").html("닉네임을 입력하세요");
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
			$("#userEmailCheck").html("이메일을 입력하세요");
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
			$("#userNameCheck").html("하나 이상의 문자(한글)를 포함해 입력하세요.");
			$("#userNameCheck").attr("class", "text-warning");
			userNameValidation = false;
		} else {
			$("#userNameCheck").html("");
			userNameValidation = true;
		}
		
		if($("#userName").val().length == 0) {
			$("#userNameCheck").html("이름을 입력하세요");
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
			$("#userRrnCheck").html("주민등록번호를 입력하세요");
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
			$("#userPhoneCheck").html("핸드폰 번호를 입력하세요");
			$("#userPhoneCheck").attr("class", "text-warning");
			userPhoneValidation = false;
		}
	});
	
	// 주소1 유효성 검사
	var userAddr1Validation = false;
	$("#userAddr1").blur(function checkAddr1() {
		
		var userAddr1 = $("#userAddr1").val();
		
		if(userAddr1.length == 0) {
			$("#userAddrCheck").html("주소1 입력을 확인을 입력하세요");
			$("#userAddrCheck").attr("class", "text-warning");
			userAddr1Validation =  false;
     	}
	})
	
	// 주소2 유효성 검사
	var userAddr2Validation = false;
	$("#userAddr2").blur(function checkAddr2() {
		
		var userAddr2 = $("#userAddr2").val();
		
		if(userAddr2.length == 0) {
			$("#userAddrCheck").html("주소2 입력을 확인을 입력하세요");
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
	
	// 취소
	$("#cancel").click(function() {
		history.go(-1)
	})
})
</script>

<div class="container">

<h1>Kakao 회원 가입</h1>
<hr>

<div>
<form action="/user/kakaoJoin" method="post">
	<input type="hidden" id="userId" name="userId" value="${userId}">
	<input type="hidden" id="userPw" name="userPw" value="${userPw}">
<div>
	<label for="userNick">닉네임</label>
	<div>
		<input type="text" id="userNick" name="userNick" placeholder="닉네임 입력">
	</div>
	<div class="check" id="userNickCheck"></div>
</div>
<div>
	<label for="userEmail">이메일</label>
	<div>
		<input type="text" id="userEmail" name="userEmail" placeholder="이메일 입력">
	</div>
	<div class="check" id="userEmailCheck"></div>
</div>
<div>
	<label for="userName">이름</label>
	<div>
		<input type="text" id="userName" name="userName" placeholder="이름 입력">
	</div>
	<div class="check" id="userNameCheck"></div>
</div>
<div>
	<label for="userRrn">주민등록번호</label>
	<div>
		<input type="text" id="userRrn" name="userRrn" placeholder="주민등록번호 입력">
	</div>
	<div class="check" id="userRrnCheck"></div>
</div>
<div>
	<label for="userPhone">휴대폰 번호</label>
	<div>
		<select id="userTelecom" name="userTelecom">
			<option value="SKT" selected>SKT</option>
			<option value="KT">KT</option>
			<option value="LG">LG</option>
		</select>
		<input type="text" id="userPhone" name="userPhone" placeholder="휴대폰 번호 입력">
	</div>
	<div class="check" id="userPhoneCheck"></div>
</div>
<div>
	<label for="userAddr">주소</label>
	<div>
		<input type="text" id="userAddr1" name="userAddr" readonly="readonly">
		<button type="button" id="userAddrSearch" name="userAddrSearch">검색</button>
		<br>
		<input type="text" id="userAddr2" name="userAddr" placeholder="상세 주소 입력">
	</div>
	<div class="check" id="userAddrCheck"></div>
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