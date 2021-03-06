<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/userinfo/update"
	})
$(document).ready(function() {
	
	$("#cancel").click(function() {
		history.go(-1)
	})
})	
	
	$(".cwa-tab > li").click(function() {
		$(location).attr("href", $(this).find("a").attr("href"))
	})
	
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

.cwa-tab {
	width: 80%;
	height: 50px;
	margin: 50px auto;
}
.cwa-tab > li {
    float: left;
    display: table;
    width: calc(100% / 7);
    height: 66px;
    position: relative;
    box-sizing: border-box;
}

.cwa-tab > li > a {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
    font-size: 15px;
    color: #8b8b8b;
    line-height: 20px;
    padding: 5px 8px;
    
}    
.cwa-tab > li::before {
    position: absolute;
    top: 0;
    left: -1px;
    width: calc(100% - 1px);
    height: calc(100% - 1px);
    border: 1px solid #e5e5e5;
    content: "";
}
</style>

<ul class="cwa-tab mgt50">
	<li class="">
	<a href="/mypage/myconorder"><button>My Concert Order</button></a><br>
	</li>
	<li class="">
	<a href="/mypage/myexorder"><button>My Exhibition Order</button></a><br>
	</li>
	<li class="">
	<a href="/mypage/myreviewlist"><button>My Concert Review</button></a><br>
	</li>
	<li class="">
	<a href="/mypage/myexreviewlist"><button>My Exhibition Review</button></a><br>
	</li>
	<li class="">
	<a href="/mypage/qnalist"><button>My QnA</button></a><br>
	</li>
	<li class="">
	<a href="/userinfo/update"><button>My Information</button></a><br>
	</li>
	<li class="">
	<a href="/userinfo/delete"><button>Withdrawal</button></a><br>
	</li>
</ul>

<script type="text/javascript">
$(document).ready(function() {

	//???????????? ????????? ??????
	var userPwValidation = false;
	$("#userPw").blur(function checkPw() {
		var userPw = $("#userPw").val();
		var regularExpression = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

		if (!regularExpression.test(userPw)) {
			$("#userPwCheck").html("?????? 8??? ???????????? ?????? ????????? ??????(??????), ??????, ?????? ????????? ????????? ???????????????.");
			$("#userPwCheck").attr("class", "text-warning");
			userPwValidation = false;
		} else {
			$("#userPwCheck").html("");
			userPwValidation = true;
		}
		
		if($("#userPw").val().length == 0) {
			$("#userPwCheck").html("??????????????? ???????????????");
			$("#userPwCheck").attr("class", "text-warning");
			userPwValidation = false;
     	}
	})

	
	//???????????? ?????? ????????? ??????
	var userPwDoubleValidation = false;
	$("#userPwDouble").blur(function checkPwRe() {
	
		var userPw = $("#userPw").val();
		var userPwDouble = $("#userPwDouble").val();
	
		if (userPw != userPwDouble) {
			$("#userPwDoubleCheck").html("?????? ?????? ?????????????????????");
			$("#userPwDoubleCheck").attr("class", "text-warning");
			userPwDoubleValidation = false;
		} else {
			$("#userPwDoubleCheck").html("");
			userPwDoubleValidation = true;
		}
	
		if(userPwDouble.length == 0) {
		$("#userPwCheck").html("???????????? ????????? ???????????????");
		$("#userPwCheck").attr("class", "text-warning");
		userPwDoubleValidation =  false;
 		}
	})


	// ????????? ????????? ?????? ??? ?????? ??????
	var userNickValidation = false;
	$("#userNick").blur(function checkNick() {
		
		var userNick = $("#userNick").val();
		var regularExpression = /^[???-???|???-???|a-z|A-Z|0-9|]+$/;
		
		if (!regularExpression.test(userNick)) {
			$("#userNickCheck").html("?????? ????????? ??????(??????, ??????) ?????? ????????? ????????? ???????????????.");
			$("#userNickCheck").attr("class", "text-warning");
			userNickValidation = false;
		} else {
			$.ajax({
			url : "/userinfo/update/userNickCheck?userNick=" + userNick
		   ,type : "GET"
		   ,dataType : "JSON"
		   ,data: userNick
		   ,contentType : "application/json; charset=UTF-8"
		   ,success : function(data) {
			   
			   if (data == 0) {
					$("#userNickCheck").html("?????? ????????? ??????????????????.");
					$("#userNickCheck").attr("class", "text-success");
					userNickValidation = true;
				} else {
					$("#userNickCheck").html("?????? ???????????? ??????????????????.");
					$("#userNickCheck").attr("class", "text-warning");
					userNickValidation = false;
					}	
				}		
			})
		}
		
		if($("#userNick").val().length == 0) {
			$("#userNickCheck").html("???????????? ???????????????");
			$("#userNickCheck").attr("class", "text-warning");
			userNickValidation = false;
     	}
	})
	
	
	// ????????? ????????? ?????? ??? ?????? ??????
	var userEmailValidation = false;
	$("#userEmail").blur(function checkEmail() {
		
		var userEmail = $("#userEmail").val();
		var regularExpression = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

		if (!regularExpression.test(userEmail)) {
			$("#userEmailCheck").html("????????? ????????? ???????????? ????????????.");
			$("#userEmailCheck").attr("class", "text-warning");
			userEmailValidation = false;
		} else {
			$.ajax({
			url : "/userinfo/update/userEmailCheck?userEmail=" + userEmail
		   ,type : "GET"
		   ,dataType : "JSON"
		   ,data: userEmail
		   ,contentType : "application/json; charset=UTF-8"
		   ,success : function(data) {
			   
			   if (data == 0) {
					$("#userEmailCheck").html("?????? ????????? ??????????????????.");
					$("#userEmailCheck").attr("class", "text-success");
					userEmailValidation = true;
				} else {
					$("#userEmailCheck").html("?????? ???????????? ??????????????????.");
					$("#userEmailCheck").attr("class", "text-warning");
					userEmailValidation = false;
					}	
				}		
			})
		}
		
		if($("#userEmail").val().length == 0) {
			$("#userEmailCheck").html("???????????? ???????????????");
			$("#userEmailCheck").attr("class", "text-warning");
			userEmailValidation = false;
	     }
	})

	// ?????? ????????? ??????
	var userNameValidation = false;
	$("#userName").blur(function checkName() {
		
		var userName = $("#userName").val();
		var regularExpression = /[???-???|???-???|???-???]/;

		if (!regularExpression.test(userName)) {
			$("#userNameCheck").html("????????? ???????????????.");
			$("#userNameCheck").attr("class", "text-warning");
			userNameValidation = false;
		} else {
			$("#userNameCheck").html("");
			userNameValidation = true;
		}
		
		if($("#userName").val().length == 0) {
			$("#userNameCheck").html("????????? ???????????????.");
			$("#userNameCheck").attr("class", "text-warning");
			userNameValidation = false;
     	}
	})	
	// ?????????????????? ????????? ?????? ??? ?????? ??????
	var userRrnValidation = false;
	$("#userRrn").blur(function checkRrn() {
		
		var userRrn = $("#userRrn").val();
		var regularExpression = /^[0-9]{13}$/;

		if (!regularExpression.test(userRrn)) {
			$("#userRrnCheck").html("13?????? ?????? ????????? ???????????????.");
			$("#userRrnCheck").attr("class", "text-warning");
			userRrnValidation = false;
		} else {
			$.ajax({
			url : "/userinfo/update/userRrnCheck?userRrn=" + userRrn
		   ,type : "GET"
		   ,dataType : "JSON"
		   ,data: userRrn
		   ,contentType : "application/json; charset=UTF-8"
		   ,success : function(data) {
			   
			   if (data == 0) {
					$("#userRrnCheck").html("?????? ????????? ???????????????????????????.");
					$("#userRrnCheck").attr("class", "text-success");
					userRrnValidation = true;
				} else {
					$("#userRrnCheck").html("?????? ????????? ???????????????????????????.");
					$("#userRrnCheck").attr("class", "text-warning");
					userRrnValidation = false;
					}	
				}		
			})
		}
		
		if($("#userRrn").val().length == 0) {
			$("#userRrnCheck").html("????????????????????? ???????????????");
			$("#userRrnCheck").attr("class", "text-warning");
			userRrnValidation = false;
  		}
	})
	
	// ????????? ????????? ?????? ??? ?????? ??????
	var userPhoneValidation = false;
	$("#userPhone").blur(function checkPhone() {
		
		var userPhone = $("#userPhone").val();
		var regularExpression = /^[0-9]{11}$/;

		if (!regularExpression.test(userPhone)) {
			$("#userPhoneCheck").html("11?????? ?????? ????????? ???????????????.");
			$("#userPhoneCheck").attr("class", "text-warning");
			userPhoneValidation = false;
		} else {
			$.ajax({
			url : "/userinfo/update/userPhoneCheck?userPhone=" + userPhone
		   ,type : "GET"
		   ,dataType : "JSON"
		   ,data: userPhone
		   ,contentType : "application/json; charset=UTF-8"
		   ,success : function(data) {
			   
			   if (data == 0) {
					$("#userPhoneCheck").html("?????? ????????? ????????? ???????????????.");
					$("#userPhoneCheck").attr("class", "text-success");
					userPhoneValidation = true;
				} else {
					$("#userPhoneCheck").html("?????? ????????? ????????? ???????????????.");
					$("#userPhoneCheck").attr("class", "text-warning");
					userPhoneValidation = false;
					}	
				}		
			})
		}
		
		if($("#userPhone").val().length == 0) {
			$("#userPhoneCheck").html("????????? ????????? ???????????????");
			$("#userPhoneCheck").attr("class", "text-warning");
			userPhoneValidation = false;
		}
	});
	
	
	// ??????1 ????????? ??????
	var userAddr1Validation = false;
	$("#userAddr1").blur(function checkAddr1() {
		
		var userAddr1 = $("#userAddr1").val();
		
		if(userAddr1.length == 0) {
			$("#userAddrCheck").html("??????1 ????????? ????????? ???????????????");
			$("#userAddrCheck").attr("class", "text-warning");
			userAddr1Validation =  false;
     	}
	})
	
	// ??????2 ????????? ??????
	var userAddr2Validation = false;
	$("#userAddr2").blur(function checkAddr2() {
		
		var userAddr2 = $("#userAddr2").val();
		
		if(userAddr2.length == 0) {
			$("#userAddrCheck").html("??????2 ????????? ????????? ???????????????");
			$("#userAddrCheck").attr("class", "text-warning");
			userAddr2Validation =  false;
     	}
	})
	
	// ????????? ?????? ??????
	document.getElementById("userAddrSearch").addEventListener("click", function(){
		new daum.Postcode({
			oncomplete: function(data) {
			document.getElementById("userAddr1").value = data.address;
			}
		}).open();
	});
	
	// onsubmit ??????
	$("#formBtn").submit(function btnClick() {
		console.log(userNickValidation)
		return false;
		if (userIdValidation && userPwValidation && userPwDoubleValidation && userNickValidation && userEmailValidation && userNameValidation && userRrnValidation && userPhoneValidation) {
			$("#form").attr("onsubmit","return true");
		} else {
			$("#form").attr("onsubmit","return false");
		}
	})	
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

form {
	width: 500px;
	margin: 0 auto;
}
</style>

<div class="container">
	<!-- ?????? ?????? ?????? -->
	<section class="bg0 p-t-23 p-b-140">
		<div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5">
					My Information Update
				</h3>
			</div>
	         <br><br><br>

		<form action="/userinfo/update" method="post" class="form-horizontal">
		<input type="hidden" name="userNo" value="${updateUser.userNo }">
		
		<div class="form-group">
			<label for="userId" class="control-label">?????????</label>
			<div class="">
				<input type="text" class="form-control" id="userId" value="${updateUser.userId }" name="userId" readonly="readonly">
			</div>
		</div>
		
		<div class="form-group">
			<label for="userPw" class="control-label">????????????</label>
			<div class="">
				<input type="password" class="form-control" id="userPw" value="${updateUser.userPw }" name="userPw" >
			</div>
			<div class="check" id="userPwCheck"></div>
		</div>
		
		<div class="form-group">
			<label for="userPwDouble" class="control-label">???????????? ??????</label>
			<div class="">
				<input type="password" class="form-control" id="userPwDouble" name="userPwDouble" value="${updateUser.userPw }">
			</div>
			<div class="check" id="userPwDoubleCheck"></div>
		</div>
		
		<div class="form-group">
			<label for="userNick" class="control-label">?????????</label>
			<div class="">
				<input type="text" class="form-control" id="userNick" value="${updateUser.userNick }" name="userNick" >
			<div class="check" id="userNickCheck"></div>
			
			</div>
		</div>
		
		<div class="form-group">
			<label for="userEmail" class="control-label">?????????</label>
			<div class="">
				<input type="text" class="form-control" id="userEmail"  value="${updateUser.userEmail }" name="userEmail"  >
				<div class="check" id="userEmailCheck"></div>
			
			</div>
		</div>
		
		<div class="form-group">
			<label for="userName" class="control-label">??????</label>
			<div class="">
				<input type="text" class="form-control" id="userName" value="${updateUser.userName }" name="userName" >
			</div>
			<div class="check" id="userNameCheck"></div>
			
		</div>
		
		<div class="form-group">
			<label for="userRrn" class="control-label">??????????????????</label>
			<div class="">
				<input type="text" class="form-control" id="userRrn"  value="${updateUser.userRrn }" name="userRrn" readonly="readonly" >
			</div>
			<div class="check" id="userRrnCheck"></div>
			
		</div>
		
		<div class="form-group">
			<label for="userPhone" class="control-label">????????? ??????</label>
			<div class="">
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
			<label for="userAddr" class="control-label">??????</label>
			<div class="">
				<input type="text" class="form-control" id="userAddr1" name="userAddr" value="${updateUser.userAddr }" >
				<button type="button" id="userAddrSearch" name="userAddrSearch">??????</button>
				<br>
				<input type="text" class="form-control" id="userAddr2" name="userAddr"  >
			</div>
			<div class="check" id="userAddrCheck"></div>
		</div>
		
		<br><br>
		
		<div class="form-group">
			<div class="col-sm-offset-5">
				<button id="formBtn" class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn3 p-lr-15 trans-04 pointer"  style="border-radius: 2px">???????????? ??????</button><br>
				<input type="reset" id="cancel" class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn3 p-lr-15 trans-04 pointer"  style="border-radius: 2px" value="??????" />
			</div>
		</div>
		
		</form>
		</div>

	</section>
</div><!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

