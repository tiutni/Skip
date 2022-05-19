<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69d98aed6f309cb0b085f3f1226178f2&libraries=services"></script>

<script type="text/javascript">let conLocation = "${viewConcert.conAddress }"</script>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	// 리뷰 삭제 버튼
	$("#btnReviewDelete").click(function() {
		if(confirm("리뷰를 삭제하시겠습니까?") == true) {
			$("#reviewdelete").submit();
			
		} else {
			return false;
			
		}

	});
	
	// 결제 버튼
	$("#btnPayment").click(function() {
		
		var isUserNo = "${userNo}";
		
		var isPrice = $("#valueOfprice").val();
		
		if( isUserNo == "" ) {
			console.log("${userNo}");
			alert("로그인 후 이용가능합니다.");
			location.href='/user/login';
			return false;
			
		};
		
		if ( isPrice == 0 ) {
			alert("회차 및 좌석을 선택해주세요.")
			return false;
			
		};

		$("#payForm").submit();
	
	});
	
	// 리뷰 작성 버튼
	$("#btnSubmit").click(function() {
		$("#reviewForm").submit();
		
	});
	
	// 위시리스트 목록에 있는지 구분
	if(${isWish}) {
		$("#btnWish").html('<img src="/resources/se2/img/wish.png" style="width: 20px; height: 20px;">');
		
	} else {
		$("#btnWish").html('<img src="/resources/se2/img/unwish.png" style="width: 20px; height: 20px;">');
		
	}
	
	// 위시리스트 버튼 클릭시 발생 하는 이벤트 ajax
	$("#btnWish").click(function() {
		
		var isUserNo = "${userNo}";
		
		console.log("#btnWish clicked");
		
		if( isUserNo == "" ) {
			console.log("${userNo}");
			alert("로그인 후 이용가능합니다.");
			location.href='/user/login';
			return false;
			
		}
		
		$.ajax({
			url: "/concert/wish"
			, type: "get"
			, data: {
				conNo : "${viewConcert.conNo}"
			}
			, dataType: "json"
			, success: function(data) {
				if(data) {
					alert("위시리스트에서 삭제되었습니다");
					$("#btnWish").html('<img src="/resources/se2/img/unwish.png" style="width: 20px; height: 20px;">');
					document.location.reload();
					
				} else if(!data) {
					alert("위시리스트에 추가되었습니다");
					$("#btnWish").html('<img src="/resources/se2/img/wish.png" style="width: 20px; height: 20px;">');
					document.location.reload();
					
				}
			}
			, error: function(err) {
					console.log("실패")
					
			}
				
		});
		
		
	});
	
	//회차 목록 변경시 이벤트
	$("#round").change(function() {

		$("#selectSeat").empty();

		$("#totalprice").empty();

		document.getElementById('seat').innerHTML = ('<option hidden>좌석 선택</option>');
		
		var conRound = $("#round").val();
		
		var date = $("#calendar").val();
		
		$.ajax({
			url: "/concert/seat"
			, type: "get"
			, data: {
				conNo : "${viewConcert.conNo}"
				, conRound : conRound
				, date : date
			}
			, dataType: "json"
			, success: function(data) {
				console.log("성공");
				
				for(var i=0 in data) {
					console.log(data[i].seatNo);
					document.getElementById('seat').innerHTML += ('<option id="' + data[i].seatNo +'"value="' + data[i].seatPrice + '">' + data[i].seatNo + '</option>');
					document.getElementById('selectSeat').innerHTML += ('<input type="hidden" class="totalPay" value="' + data[i].seatPrice + '">');

				}
				
				resultPrice.innerText = 0;
				
			}
			, error: function(err) {
				console.log("실패");
					
			}
			
		});
		
		number = 0;
		
	});
	
	const resultPrice = document.getElementById("totalprice");

	var number;
	
	console.log("number : " + number);
	
	// 좌석 변경시 발생하는 이벤트 ajax
	$("#seat").change(function() {
		
		document.getElementById('selectSeat').innerHTML += (
				'<div class="seatbox" style="display: inline-block;"><span class="' + $("#seat option:checked").attr('id') +'">' 
					+ $("#seat option:checked").attr('id') + 
				'</span><button class="remove" type="button" style="width: 14px; height: 16px; margin-right: 5px; margin-left: 3px; border: 1px solid #ef3f43; border-radius: 3px; background: #ef3f43; color: white; font-size: 6px; position: relative; top: -2px;"><b>x</b></button>'
				+'<input type="hidden" name="selectedSeat" value="' + $("#seat option:checked").attr('id') +'" /></div>'
				);

		
		//넘버 변수 안에 선택한 좌석의 값(금액) 더해주기
		number += parseInt($("#seat option:checked").val());
		
		console.log("number : " + number);
	
		//선택한 값 중복선택 불가능
		$("#seat option:checked").prop('disabled', true);

		//x버튼 클릭 시 선택 좌석 제외하기
		$(".remove").click(function() {
	 		
			var seatId = $(this).siblings('span').attr('class');
			
			var tmp = document.getElementById(seatId);
			
	 		console.log(document.getElementById($(this).siblings('span').attr('class')));

	 		tmp.disabled = false;

	 		//선택한 좌석에 해당하는 금액 빼기
			number -= document.getElementById(seatId).value;

			resultPrice.innerText = number;
			
	 		console.log(number);
		
			$(this).parent().remove();

		});
		
		resultPrice.innerText = number;
		
		document.getElementById("valueOfprice").value = number;
		
	});
	
});
</script>

<style type="text/css">

.information {
	width: 545px;
	height: 400px;
	margin-left: 35px;
}

.information > li {
	font-size: 1.6rem;
	margin-bottom: 10px;
}


.review {
	width: 95.5%;
	height: 90px;
	margin-left: 20px;
	margin-right: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

#btnWish {
	border: 0;
	width: 25px;
	hieght: 25px;
	background: white;
}

#mapWrap {
	display: none;
	position:absolute;
	width: 500px;
	height: 495px;
	z-index: 1;
	border: 1px solid #ccc;
	border-radius: 5px;
	background: white;
}

#mapContent {
	width: 100%;
	height: 100%;
	border-radius: 5px;	 
}

#map {
	width: 450px;
	height: 400px;
	border: 1px solid #ccc;
	margin: 25px;
	margin-top: 5px;
}

#seatWrap {
	display: none;
	position:absolute;
	width: 500px;
	height: 741px;
	z-index: 1;
	border: 1px solid #ccc;
	border-radius: 5px;
	background: white;
	
}

#seatContent {
	width: 100%;
	height: 100%;
	border-radius: 5px;	 
}

#popup .popup_content {
	width: 450px;
	height: 390px;
	background: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	position: absolute;
	top: -314px;
	left: 350px;
}

#popup .popup_layer {
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background:rgba(0, 0, 0, 0.5);
	z-index:-1;
}

#popup {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
 	z-index:1;
}

#menuTable {
	height: 50px;
	font-size: 20px;
}

#menuTable td {
	text-align: center;
	width: 100px;
	padding: 10px;
}

.infoWrap > ul > li {
	margin-bottom: 10px;
}

#btnPayment {
 	font-size: 30px; 
 	width: 330px; 
 	height: 55px;
 	margin-top: 15px;
 	border-radius: 2px;
	
}

#reviewForm fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#reviewForm fieldset legend {
	text-align: right;
}

#reviewForm input[type=radio] {
	display: none;
}

#reviewForm label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#reviewForm label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewForm label:hover ~ label {
	text-shadow: 0 0 0 reba(250, 208, 0, 0.99);
}

#reviewForm input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContent {
	width: 400px;
	height: 175px;
	resize: none;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-left: 24px;
	padding: 5px;
}

#reviewContent :hover {
	outline: 0;
}

#btnCancel {
	width: 100px;
	height: 35px;
	border-radius: 3px;
	margin-right: 5px;
	font-size: 15px;
	display: inline-block;
}

#btnSubmit {
	width: 100px;
	height: 35px;
	border-radius: 3px;
	margin-left: 5px;
	font-size: 15px;
	display: inline-block;
}

#btnWrite {
 	font-size: 12px;
 	width: 80px;
 	height: 25px;
 	display: inline-block;
 	position: relative;
 	left: 611px;
}

#btnReviewDelete {
	border: 0;
	background: white;
	color: black;
	font-size: 10px;
	float: right;
	margin-right: 10px;
}

</style>

<br><br>
<div class="container-fluid" style="width: 1280px; display: flex;">
	<div class="info" style="width: 71%; float:left;">

		<!-- 공연 제목 -->
		<div class="conTitle" style="display: inline-block;">
			<h3 class="ltext-103 cl5">${viewConcert.conTitle }</h3>
		</div> <!-- conTitle -->
		
		<!-- 별점 -->
		<div class="starPoint" style="margin-top: 10px; margin-bottom: 5px;">
			<c:choose>
				<c:when test="${conStar <= 5.0 and conStar > 4.0 }">
					<span style="font-size: 18px; color: rgb(255,201,14);">★★★★★</span>
				</c:when>
					
				<c:when test="${conStar <= 4.0 and conStar > 3.0 }">
					<span style="font-size: 18px; color: rgb(255,201,14);">★★★★☆</span>
				</c:when>
					
				<c:when test="${conStar <= 3.0 and conStar > 2.0 }">
					<span style="font-size: 18px; color: rgb(255,201,14);">★★★☆☆</span>
				</c:when>
					
				<c:when test="${conStar <= 2.0 and conStar > 1.0 }">
					<span style="font-size: 18px; color: rgb(255,201,14);">★★☆☆☆</span>
				</c:when>
					
				<c:when test="${conStar <= 1.0 and conStar > 0.0 }">
					<span style="font-size: 18px; color: rgb(255,201,14);">★☆☆☆☆</span>
				</c:when>
				
				<c:when test="${conStar eq 0.0}">
					<span style="font-size: 18px; color: rgb(255,201,14);">☆☆☆☆☆</span>
				</c:when>
			</c:choose>
			<span style="font-size: 13px;">${conStar }</span>
			
			<!-- 위시리스트 -->
			<div class="wishList" style="margin-left: 157px; display: inline-block;">
				<button type="button" id="btnWish"></button>
			</div> <!-- wishList -->
			
		</div> <!-- starPoint -->

		<div class="conInfo">
			<div style="height:500px;">
				<!-- 공연 사진 -->
				<div class="picture" style="width: 300px; height: 400px; float: left; border:1px solid #eee;">
					<img src="/upload/${viewConcert.conImgStoredName }" style="width: 300px; height:400px;">
				</div> <!-- picture -->
				
				
				<!-- 공연 정보 -->
				<ul class="information" style="display: inline-block;">
					<!-- 공연장 위치 -->
					<li>
						<!-- 카카오 지도 -->
						<div id="mapWrap">
							<div id="mapContent">
								<div id="mapAddress" style="margin-top: 5px; margin-left: 10px;">
									<span style="font-size: 18px;"><b>공연장 위치</b></span>
									<button id="closeMap" style="float: right; margin-right: 8px; font-size: 18px;">X</button>
								</div> <!-- .mapAddress -->
								<hr style="margin-top: 5px; margin-bottom: 5px;">
								<div class="kakaoMap">
									<span style="margin-left: 10px; font-size: 16px;">
										주소 : ${viewConcert.conAddress}
									</span>
									<div id="map"></div>
								</div> <!-- .kakaoMap -->
							</div> <!-- mapContent -->
						</div> <!-- mapWrap -->
						
						<span style="margin-right: 35px; font-size: 16px;">
							<b>장소</b>
						</span>
						<div style="display: inline-block; font-size: 16px;">
							<button id="openMap">
								${viewConcert.conAddress } ▶
							</button>
						</div>
					</li>
					
					<!-- 공연 기간 -->
					<li>
						<span style="margin-right: 35px; font-size: 16px;">
							<b>기간</b>
						</span>
						<div style="display: inline-block; font-size: 16px;">
							<fmt:formatDate value="${viewConcert.conStartDay }" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${viewConcert.conEndDay }" pattern="yyyy.MM.dd" />
						</div>
					</li>
					
					<!-- 좌석 가격 -->
					<li>
						<ul>
							<li style="margin-bottom: 5px; font-size: 16px;">
								<!-- 공연 좌석별 가격 -->
								<span style="margin-right: 35px; font-size: 16px;">
									<b>가격</b>
								</span>
								<button id="openSeatWrap" style="font-size: 16px;"><b>좌석 배치도 확인하기 ▶</b></button>
								<div id="seatWrap">
									<div id="seatContent">
										<div id="mapAddress" style="margin-top: 5px; margin-left: 10px;">
											<span style="font-size: 18px;"><b>좌석 배치도</b></span>
											<button id="closeSeatWrap" style="float: right; margin-right: 8px; font-size: 18px;">X</button>
										</div> <!-- .mapAddress -->
										<hr style="margin-top: 5px; margin-bottom: 5px;">
										<div id="seatMap">
											<img src="/upload/${conSeatImg.conSeatImgStoredName }" style="width: 100%; height: 94%;">
										</div>
									</div> <!-- seatContent -->
								</div> <!-- #seatWrap -->
							</li>
							
							<li>
								<!-- 기본 좌석 금액 -->
								<span style="margin-left: 72px; font-size: 16px;">
									<span style="margin-right: 6px;">
										<b>기본 좌석</b>
									</span>
									<span style="font-size: 16px;">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${basicSeatPrice }"/>원
									</span>
								</span>
							</li>
							
							<li style="margin-bottom: 10px;">
								<!-- VIP 좌석 금액 -->
								<span style="margin-left: 73px; font-size: 16px;">
									<span style="margin-right: 6px;">
										<b>VIP 좌석</b>
									</span>
									<span style="font-size: 16px;">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${vipSeatPrice }"/>원
									</span>
								</span>
							</li>
						</ul>
					</li>
					
					<!-- 공연 내용 -->
					<li>
						<span style="margin-bottom: 10px; font-size: 16px;">
							<b>정보</b>
						</span>
						<div style="margin-left: 70px; font-size: 16px;">
							${viewConcert.conContent }
						</div>	
					</li>
			
				</ul> <!-- #information -->	
		</div> <!-- #conInfo -->
		
		<!-- 메뉴 테이블 -->
		<div>
			<div>
				<table id="menuTable">
				<tr>
					<td>
						<button id="btnInfo">상품정보</button>
					</td>
					<td>
						<button id="btnReview">후기</button>
					</td>
					<td>
						<button id="btnAnswer" onclick="location.href='/qna/list'">문의하기</button>
					</td>
				</tr>
				</table>
			</div>
		
		</div>
		
		<hr style="margin-top: 5px;">
		<br>
		
		<c:import url="../layout/payterms.jsp" />
		
		<br><hr style="margin-bottom: 10px;"><br>
		<!-- 리뷰 -->
		<div class="reviewWrap">
			<div>
				<h1 style="margin-left: 20px; display: inline-block;">Review (${cntReview })</h1>
				<c:if test="${not empty userNo and isTicketing and isReview}">
					<button id="btnWrite" class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn3 p-lr-15 trans-04 pointer m-b-5">
						<b>작성하기</b>
					</button>
				</c:if>
			</div>
			<!-- 리뷰 작성 폼 -->
			<div id="popup" style="text-align: center;">
				<div class="popup_content">
					<h1 style="margin-bottom: 0;">리뷰 작성</h1>
					<form action="/concert/reviewwrite" id="reviewForm" method="post">
						<input type="hidden" id="conNo" name="conNo" value="${viewConcert.conNo }"/>
						<!-- 별점 선택 -->
						<fieldset>
							<input type="radio" name="reviewStar" value="5" id="rate1"/><label for="rate1">★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2"/><label for="rate2">★</label>
							<input type="radio" name="reviewStar" value="3" id="rate3"/><label for="rate3">★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4"/><label for="rate4">★</label>
							<input type="radio" name="reviewStar" value="1" id="rate5" checked="checked"/><label for="rate5">★</label>
						</fieldset>
						<textarea id="reviewContent" name="reviewContent" placeholder="내용을 입력하세요"></textarea><br><br>
						<button type="button" id="btnCancel" class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn2 p-lr-15 trans-04 pointer m-b-5">취소</button>
						<button type="button" id="btnSubmit" class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn3 p-lr-15 trans-04 pointer m-b-5">등록</button>
					</form>
				</div> <!-- .popup_content -->
				
				<div class="popup_layer"></div>
			</div> <!-- #popup -->
			
			<br>
			<c:if test="${empty reviewList }">
				<div style="margin: 50px; margin-top:10px;">
					<span>등록된 리뷰가 없습니다</span>
				</div>
			</c:if>
			
			<c:if test="${not empty reviewList }">
				<c:forEach items="${reviewList }" var="i">
					<div class="review">
						<div class="reviewTop" style="margin-top: 5px;">
							<span style="font-size: 12px; margin-left: 10px; margin-top: 10px;">${i.userNick }</span>
						
							<c:choose>
								<c:when test="${i.conReviewStar eq 5 }">
									<span style="font-size: 12px; color: rgb(255,201,14);">
										★★★★★
									</span>
								</c:when>
								
								<c:when test="${i.conReviewStar eq 4 }">
									<span style="font-size: 12px; color: rgb(255,201,14);">
										★★★★☆
									</span>
								</c:when>
								
								<c:when test="${i.conReviewStar eq 3 }">
									<span style="font-size: 12px; color: rgb(255,201,14);">
										★★★☆☆
									</span>
								</c:when>
								
								<c:when test="${i.conReviewStar eq 2 }">
									<span style="font-size: 12px; color: rgb(255,201,14);">
										★★☆☆☆
									</span>
								</c:when>
								
								<c:when test="${i.conReviewStar eq 1 }">
									<span style="font-size: 12px; color: rgb(255,201,14);">
										★☆☆☆☆
									</span>
								</c:when>
							</c:choose>
							
							<span style="font-size: 10px; color: #ccc; margin-left: 10px;">
								<fmt:formatDate value="${i.conReviewDate }" pattern="yyyy-MM-dd" />
							</span>
						</div>
						
						<span style="margin-left: 10px; font-size: 13px;">
							${i.conReviewContent }
						</span>
						<br><br>
			
						<c:if test="${userNo eq i.userNo }">
							<form id="reviewdelete" action="/concert/reviewdelete" method="get">
								<input type="hidden" name="conReviewNo" value="${i.conReviewNo }" />
								<input type="hidden" name="conNo" value="${viewConcert.conNo }" />
								<button type="button" id="btnReviewDelete">삭제</button>
							</form>
						</c:if>
					</div><br>
				</c:forEach>
			</c:if>
		</div>
		<br><br><br>


			<c:import url="conreviewpaging.jsp" />

		
		</div>
	</div>

	<!-- 사이드바(결제) -->
	<div style="float: left;">
		<div class="stickyWrap" style="width: 100%; height: 10px; position: sticky; top:90px; margin-left: 30px; margin-top: 85px;">
			<div class="select" style="width: 330px;">
				<form action="/pay/con" method="post" id="payForm">
					<!-- 유저 번호 전송 -->
					<input type="hidden" name="userNo" value="${userNo }" />
							
					<!-- 공연 게시글 번호 전송 -->
					<input type="hidden" name="conNo" value="${viewConcert.conNo }" />
							
					<fieldset style="border: 2px solid #ccc; border-radius: 2px; height: 348px; width: 330px;">
						<br>
						<!-- 날짜 및 회차,좌석 선택 -->
						<!-- 날짜선택 -->
						<label style="margin-left: 25px; font-size: 16px;"><b>관람일</b></label>
						<input style="margin-left: 25px;" type="date" id="calendar" name="date" max="<fmt:formatDate value='${viewConcert.conReserveEndDay }' pattern='yyyy-MM-dd' />" /><br>
						<hr style="margin-top: 0px; margin-bottom: 25px;">
						<!-- 회차 및 좌석 선택 -->
						<span style="margin-left: 25px;"><b>회차</b></span>
						<br>
						<select id="round" name="round" style="margin-left: 25px; width:30%; padding: 0; margin-bottom: 10px; height:30px;" class="stext-111 cl8 plh3 p-lr-15 bor8">
							<option value="0">선택없음</option>
							<c:forEach items="${conRoundList}" var="i">
								<option class="option" value="${i.conRound }"><fmt:formatDate value="${i.conRoundStartTime }" pattern="HH:mm" /></option>
							</c:forEach>
						</select>

						<br>

						<!-- 선택된 좌석 -->
						<span style="margin-left: 25px;"><b>좌석</b></span>
						<br>
						<select id="seat" name="seat" class="stext-111 cl8 plh3 p-lr-15 bor8" style="margin-left: 25px; width:30%; padding: 0; margin-bottom: 5px; height: 30px;"></select>
						<div id="selectSeat" style="margin-left: 25px; height: 10px;"></div>
	
						<hr style="margin-bottom: 3px;">
						
						<!-- 총 결제 금액 -->
						<div style="height: 64.3px;">
							<div style="display:inline-block;">		
								<input type="hidden" id="valueOfprice" name="price" />
								<span style="margin-left: 25px; font-style: italic;">
									<b>총 결제 금액</b>
								</span>
							</div>
							<div style="display:inline-block; margin-left: 40px; text-align: right; width: 150px; line-height: 2;">
								<span id="totalprice" style="color: #ef3f43; font-size: 32px; font-style: italic;">
								0
								</span>
							</div>
						</div>
					</fieldset>
					
					<!-- 예매 버튼 -->
					<div>
						<!-- 활성화된 공연만 예매가능 -->
						<c:if test="${viewConcert.conActivate eq 1}">
							<button id="btnPayment" class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn3 p-lr-15 trans-04 pointer m-b-5">
								예매하기
							</button>
						</c:if>
					</div>
				</form>
			</div> <!-- select -->
		</div> <!-- .stickyWrap -->
	</div>

<%-- 카카오 지도 api --%>
<script type="text/javascript">
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(conLocation, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
		
		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);
		
	};
    
    $("#openMap").click(function() {
    	map.relayout();
    	
    	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);
    
    });
    
		
});
</script>

<%-- 달력 날짜 설정 --%>
<script type="text/javascript">
	//예약 최소 날짜를 오늘로 설정함
	document.getElementById('calendar').min = new Date().toISOString().substring(0, 10);;

	//달력에 표시되는 기본 날짜는 오늘로 설정함
	document.getElementById('calendar').value = new Date().toISOString().substring(0, 10);;
</script>

<script type="text/javascript">
	document.getElementById("btnReview").onclick = function() {
		document.querySelector('.reviewWrap').scrollIntoView(true);
	}

</script>

<script type="text/javascript">
	document.getElementById("btnInfo").onclick = function() {
		document.querySelector('#menuTable').scrollIntoView(true);
	}

</script>

<!-- 리뷰 작성 모달 -->
<script type="text/javascript">
	document.getElementById("btnWrite").onclick = function() {
	    document.getElementById("popup").style.display="block";
	}
	
	document.getElementById("btnCancel").onclick = function() {
	    document.getElementById("popup").style.display="none";
	}
</script>

<!-- 공연 좌석 배치도 모달 -->
<script type="text/javascript">
	document.getElementById("openSeatWrap").onclick = function() {
	    document.getElementById("seatWrap").style.display="block";
	}
	
	document.getElementById("closeSeatWrap").onclick = function() {
	    document.getElementById("seatWrap").style.display="none";
	}
</script>

<!-- 공연장 위치 지도 모달 -->
<script type="text/javascript">
	document.getElementById("openMap").onclick = function() {
	    document.getElementById("mapWrap").style.display="block";
	}
	
	document.getElementById("closeMap").onclick = function() {
	    document.getElementById("mapWrap").style.display="none";
	}
</script>

<br><br><br><br><br>

</div> <!-- "container-fluid" -->
<hr>

<!-- 푸터 -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />


