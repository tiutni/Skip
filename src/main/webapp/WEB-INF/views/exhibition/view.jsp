<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69d98aed6f309cb0b085f3f1226178f2&libraries=services"></script>

<script type="text/javascript">let exLocation = "${viewExhibition.exAddress }"</script>

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
		
		if( isUserNo == "" ) {
			console.log("${userNo}");
			alert("로그인 후 이용가능합니다.");
			location.href='/user/login';
			return false;
			
		}
		
		$("#payForm").submit();
	
	});
	
	// 리뷰 작성 버튼
	$("#btnSubmit").click(function() {
		$("#reviewForm").submit();
		
	});
	
	// 위시리스트 목록에 있는지 구분
	if(${isWish}) {
		$("#btnWish").html('<img src="/resources/se2/img/wish.png" style="width: 25px; height: 25px;">');
		
	} else {
		$("#btnWish").html('<img src="/resources/se2/img/unwish.png" style="width: 25px; height: 25px;">');
		
	}
	
	// 위시리스트 버튼 클릭시 발생 하는 이벤트 ajax
	$("#btnWish").click(function() {
		
		var isUserNo = "${userNo}";
		
		console.log("#btnWish clicked");
		
		if( isUserNo == "" ) {
			console.log("${userNo}");
			alert("로그인 후 이용가능합니다.");
			location.href='/user/login';
			return;
			
		}
		
		$.ajax({
			url: "/exhibition/wish"
			, type: "get"
			, data: {
				exNo : "${viewExhibition.exNo}"
			}
			, dataType: "json"
			, success: function(data) {
				if(data) {
					alert("위시리스트에서 삭제되었습니다");
					$("#btnWish").html('<img src="/resources/se2/img/unwish.png" style="width: 25px; height: 25px;">');
					document.location.reload();
					
				} else if(!data) {
					alert("위시리스트에 추가되었습니다");
					$("#btnWish").html('<img src="/resources/se2/img/wish.png" style="width: 25px; height: 25px;">');
					document.location.reload();
					
				}
				
			}
			, error: function(err) {
					console.log("실패")
					
			}
			
		});

		
	});
	
});

// 티켓 매수 및 결제 가격 계산 함수
function count_ticket(type) {
	const resultElement = document.getElementById("ticket");
	
	const resultPrice = document.getElementById("totalprice");
	
	var totalprice = resultPrice.innerText;
	
	var number = resultElement.innerText;
	
	var price = "${viewExhibition.exPrice}";
	
	if(type == "plus") {
		number = parseInt(number) + 1;
		
	} else if(type == "minus") {
		number = parseInt(number) - 1;
		
	}
	
	if(number < 0) {
		alert("0보다 작은값은 입력할 수 없습니다");
		number = 0;
	}
	
	resultElement.innerText = number;
	
	resultPrice.innerText = number * price;

	document.getElementById("valueOfcount").value = number;
	
	document.getElementById("valueOfprice").value = number * price;
	
}
</script>

<style type="text/css">
.review {
	width: 1000px;
	height: 90px;
	margin-left: 50px;
	margin-right: 50px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.btnCount {
	width:20px;
	height: 20px;
	border: 0;
	background: #ccc;
	font-size: 16px;
}

#btnWish {
	border: 0;
	width: 35px;
	hieght: 35px;
	background: white;
}

#popup .popup_content {
	width: 450px;
	height: 390px;
	background: #ccc;
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
	position:absolute;
	width:100%;
	height:100%;
	z-index:1;
}

#btnPayment {
	font-size: 30px;
	width: 200px;
	height: 46px;
	border: 1px solid skyblue;
	border-radius: 5px;
	background: skyblue;
	color: white;
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
	height: 150px;
	resize: none;
	border-radius: 5px;	 
}

#btnCancel {
	width: 100px;
	height: 35px;
	border-radius: 3px;
	margin-right: 5px;
	font-size: 15px;
}

#btnSubmit {
	width: 100px;
	height: 35px;
	border-radius: 3px;
	margin-left: 5px;
	font-size: 15px;
}

#btnWrite {
	font-size: 15px;
	width: 80px;
	height: 25px;
	border: 1px solid skyblue;
	border-radius: 3px;
	color: white;
	background: skyblue;
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
<meta charset="UTF-8">
<title>${viewExhibition.exTitle }</title>
</head>
<body>

<div class="container-fluid" style="width: 1100px;">
<br><br>
<div style="font-size: 25px; margin-left: 80px; display: inline-block;"><b>${viewExhibition.exTitle }</b></div>
<button type="button" id="btnWish"></button>

<hr><br>

<div class="picture" style="width: 600px; height: 650px; float: left; margin-left: 50px;">
	<img src="/upload/${viewExhibition.exImgStoredName }" style="width: 500px; height:640px;">
</div>

<div id="map" style="width: 330px; height: 300px; float: right; margin-right: 80px;"></div>

<div class="select" style="width: 330px; height: 290px; float: right; margin-right: 80px; margin-top: 30px;">
<form action="/pay" method="post" id="payForm">
<input type="hidden" name="userNo" value="${userNo }" />
<input type="hidden" name="exNo" value="${viewExhibition.exNo }" />
<fieldset style="border: 2px solid #ccc; border-radius: 10px;">
<br>
<span style="font-size: 23px; margin-left:75px; margin-top: 10px;"><b>인원 및 날짜 선택</b></span><br>
<br>
<label style="margin-left: 74px; font-size: 16px;"><b>관람일</b></label>
<br>
<input style="margin-left: 70px;" type="date" id="calendar" name="date" max="<fmt:formatDate value='${viewExhibition.exReserveEndDay }' pattern='yyyy-MM-dd' />" /><br>
<br>
<label style="margin-left: 74px; font-size: 16px;"><b>인원</b></label>
<br>
<input type="hidden" id="valueOfcount" name="count" />
<span style="margin-left: 70px;"><b>매수</b></span>
<span>
	<button type="button" onclick="count_ticket('minus')" class="btnCount" style="margin-right: 5px;"><b>-</b></button>
	<span id="ticket">0</span><button type="button" onclick="count_ticket('plus')" class="btnCount" style="margin-left: 5px;"><b>+</b></button>
</span>
<br>
<input type="hidden" id="valueOfprice" name="price" />
<span style="margin-left: 70px;"><b>총 결제 금액</b></span>
<span id="totalprice">0</span>
<br>
<c:if test="${viewExhibition.exActivate eq 1}">
<button id="btnPayment" style="margin-left: 66px; margin-top: 13px; margin-bottom: 20px;">결제하기</button>
</c:if>
</fieldset>
</form>
</div>

<div class="information" style="width: 910px; height: 250px; float: left; margin-left: 50px; margin-top: 80px; margin-top: 40px;">
<span><b>정보</b></span><br><br>
<span>${viewExhibition.exContent }</span>
<br><br>
<span class="location"><b>장소</b></span>
<span>${viewExhibition.exAddress }</span>
<br><br>
<span><b>기간</b></span>
<span><fmt:formatDate value="${viewExhibition.exStartDay }" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${viewExhibition.exEndDay }" pattern="yyyy.MM.dd" /></span>
<br><br>
<span><b>입장권</b></span>
<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${viewExhibition.exPrice }"/>원</span>
</div>



<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br>
<br><br>
<hr>

<br>
<h1 style="margin-left: 50px;">리뷰 Review (${cntReview })</h1>
<span style="margin-left: 50px; font-size: 25px;"><b>평점</b></span><span style="margin-left: 5px; font-size: 23px;">${exStar }</span>
<c:if test="${not empty userNo and isTicketing and isReview}">
<button id="btnWrite" style="margin-left: 10px;"><b>작성하기</b></button>
</c:if>
<br>

<div id="popup" style="text-align: center;">
<div class="popup_content">
<h1 style="margin-bottom: 0;">리뷰 작성</h1>
<form action="/exhibition/reviewwrite" id="reviewForm" method="post">
<input type="hidden" id="exNo" name="exNo" value="${viewExhibition.exNo }"/>
<fieldset>
<input type="radio" name="reviewStar" value="5" id="rate1"/><label for="rate1">★</label>
<input type="radio" name="reviewStar" value="4" id="rate2"/><label for="rate2">★</label>
<input type="radio" name="reviewStar" value="3" id="rate3"/><label for="rate3">★</label>
<input type="radio" name="reviewStar" value="2" id="rate4"/><label for="rate4">★</label>
<input type="radio" name="reviewStar" value="1" id="rate5" checked="checked"/><label for="rate5">★</label>
</fieldset>
<textarea id="reviewContent" name="reviewContent" placeholder="내용을 입력하세요"></textarea><br><br>
<button type="button" id="btnCancel">취소</button>
<button type="button" id="btnSubmit">등록</button>
<br><br>
</form>
</div>

<div class="popup_layer"></div>

</div>
<br>
<c:if test="${empty reviewList }">
<div style="margin: 50px; margin-top:10px;">
<span>등록된 리뷰가 없습니다</span>
</div>
</c:if>

<c:if test="${not empty reviewList }">
<c:forEach items="${reviewList }" var="i">
<div class="review">
<span style="font-size: 12px; margin-left: 10px; margin-top: 10px;">${i.userNick }</span>
<c:choose>
	<c:when test="${i.exReviewStar eq 5 }">
	<span style="font-size: 12px; color: rgb(255,201,14);">★★★★★</span>
	</c:when>
	
	<c:when test="${i.exReviewStar eq 4 }">
	<span style="font-size: 12px; color: rgb(255,201,14);">★★★★☆</span>
	</c:when>
	
	<c:when test="${i.exReviewStar eq 3 }">
	<span style="font-size: 12px; color: rgb(255,201,14);">★★★☆☆</span>
	</c:when>
	
	<c:when test="${i.exReviewStar eq 2 }">
	<span style="font-size: 12px; color: rgb(255,201,14);">★★☆☆☆</span>
	</c:when>
	
	<c:when test="${i.exReviewStar eq 1 }">
	<span style="font-size: 12px; color: rgb(255,201,14);">★☆☆☆☆</span>
	</c:when>
</c:choose>
<span style="font-size: 10px; color: #ccc; margin-left: 10px;">
	<fmt:formatDate value="${i.exReviewDate }" pattern="yyyy-MM-dd" />
</span>
<br>
<span style="margin-left: 10px; font-size: 13px;">${i.exReviewContent }</span>
<br><br>
<c:if test="${userNo eq i.userNo }">
<form id="reviewdelete" action="/exhibition/reviewdelete" method="get">
<input type="hidden" name="exReviewNo" value="${i.exReviewNo }" />
<input type="hidden" name="exNo" value="${viewExhibition.exNo }" />
<button type="button" id="btnReviewDelete">삭제</button>
</form>
</c:if>
</div><br>
</c:forEach>
</c:if>

<c:import url="exreviewpaging.jsp"></c:import>

<script type="text/javascript">
	//예약 최소 날짜를 오늘로 설정함
	document.getElementById('calendar').min = new Date().toISOString().substring(0, 10);;
	
	//달력에 표시되는 기본 날짜는 오늘로 설정함
	document.getElementById('calendar').value = new Date().toISOString().substring(0, 10);;
</script>

<script type="text/javascript">
	document.getElementById("btnWrite").onclick = function() {
	    document.getElementById("popup").style.display="block";
	}
	
	document.getElementById("btnCancel").onclick = function() {
	    document.getElementById("popup").style.display="none";
	}
</script>

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
geocoder.addressSearch(exLocation, function(result, status) {

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
		
	}
		
});
</script>

</div> <%--container --%>

</body>
</html>