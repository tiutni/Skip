<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>

<style>
.detail {
	display: none;
}
    
.form-chek {
	display: inline-block; 
	line-height: 20px; 
	vertical-align: middle;
}

.form-check::before {
	content: "";
	display: inline-block;
	width: 10px; 
	height: 10px; 
	background: #ffffff; 
	border: 1px solid #000000; 
	margin-right: 8px;
}

.input-check {
	display: none;
}

.input-check:checked + .form-check::before {
	background: #749fbb;
}

.input-check:checked + .form-check {
	color: #749fbb;
}

#btnBack{
	margin: auto;
}

#btnPayment {
 	font-size: 30px; 
 	width: 330px; 
 	height: 55px;
 	margin-top: 15px;
 	border-radius: 2px;
	
}
</style>

<div class="container-fluid" style="width: 1280px; display: flex;">
	<div id="layoutSidenav_content" class="container px-4" style="width: 71%; float:left;">
		<h1 class="mt-4">예매 정보 확인</h1><br><br>		
		
		<div class="card mb-4">
			<div class="card-body">
				<div style="font-weight: bold; font-size: 20px; padding-bottom: 30px;">예매자 정보</div>
				<table>
					<tr><td>이름</td><td>&emsp;</td><td>${userName }</td></tr>
					<tr><td>이메일</td><td>&emsp;</td><td>${userEmail }</td></tr>
					<tr><td>연락처</td><td>&emsp;</td><td>${userPhone }</td></tr>
					<tr><td>주소</td><td>&emsp;</td><td>${userAddr }</td></tr>
				</table>
			</div>
		</div>
		
		<div class="card">
			<div class="card-body"> 
				<div style="font-weight: bold; font-size: 20px; padding-bottom: 30px;">약관 동의</div>
				<div id="item">
		        	<button class="over" id="open" onclick="showDetail()">개인정보 수집 및 이용 동의</button>
		        	<div class="detail" id="desc">
		            		개인정보 수집 및 이용 동의
							<br>1. 수집목적
							판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등
							<br>2. 수집 항목
							구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보
							수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소
							<br>3. 보유기간
							개인정보 수집 및 이용목적 달성 시 및 관련 법령에 따른 기간까지 보관
							<br>4. 동의 거부시 불이익
							본 개인정보 수집 및 이용 등에 동의하지 않을 권리가 있습니다. 다만, 필수항목에 동의를 하지 않을경우 거래가 제한될 수 있습니다.
		            	<br><button id="close" onclick="hideDetail()">상세 설명 닫기</button>    
		        	</div><br>
		        	<button class="over" id="open1" onclick="showDetail1()">개인정보 제 3자 제공 동의</button>
		        	<div class="detail" id="desc1">
		            		개인정보 제 3자 제공 동의
							SKIP의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, SKIP은 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 판매자 및 배송업체에 아래와 같이 공유하고 있습니다.
							1. SKIP은 귀하께서 판매자로부터 상품 및 서비스를 구매하고자 할 경우, 개인정보보호법 제 17조 (개인정보의 제공)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다.
							2. 공유하는 개인정보 항목 - 구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보 - 수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소
							3. 개인정보를 공유받는 자의 이용 목적 : 판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등
							4. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : 상품 구매/배송/반품 등 서비스 처리 완료 후 180일간 보관 후 파기
							5. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.
		            	<br><button id="close" onclick="hideDetail1()">상세 설명 닫기</button>    
					</div><br>
		        	<button class="over" id="open2" onclick="showDetail2()">전자결제대행 이용 동의 </button>
		        	<div class="detail" id="desc2">
		            		이 약관은 전자지급결제대행서비스 및 결제대금예치서비스를 제공하는 토스페이먼츠 주식회사(이하 '회사'라 합니다)와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.
		            	<br><button id="close" onclick="hideDetail2()">상세 설명 닫기</button>    
					</div>
				</div><br>
				
				<span class="form-inline">
					<input type="checkbox" class="input-check" id="check" onclick="btnActive()">
					<label for="check" class="form-check" >회원 본인은 구매 조건, 주문 내용 확인 및 결제에 동의합니다.</label>
				</span>
						
			</div>
		</div> 
			
			<br><br><br>
			<button id="btnBack" class="flex-c-m trans-04 pointer stext-110 m-lr-15-xl p-tb-5 p-lr-15 cl0 bg3 hov-btn3 m-b-15">
				취소
			</button>
			<br><br><br><br><br><br>
			
	</div>
			
	<!-- 사이드바(결제) -->
	<div style="float: left;">
		<div class="stickyWrap" style="width: 100%; height: 10px; position: sticky; top:90px; margin-left: 30px; margin-top: 105px;">
			<div class="select" style="width: 330px;">
							
				<fieldset style="border: 2px solid #ccc; border-radius: 2px; height: 370px; width: 330px;"><br>
					<div style="margin-left: 25px; font-size: 16px;">
					
						<!-- 예매 정보 -->
						<div><b>공연명</b></div>
						<div>${conTitle }</div><br>
						
						<div><b>관람일</b></div>
						<div>${date}</div><br>
						
						<div><b>회차</b></div>
						<div id="round">${round } 회차</div><br>
						
						<div><b>좌석</b></div>
						<div id="selectSeat">
							<c:forEach items="${selectedSeat}" var="i" varStatus="status">
								${i}
								<input type="hidden" id="${status.index }" value="${i }"/>
							</c:forEach>
						</div>
						
					<hr style="margin-bottom: 2px;">
					
					</div>
					
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
							${price }
							</span>
						</div>
					</div>
					
				</fieldset>
				
				<!-- 결제 버튼 -->
				<div style="margin-top: 4px;">
					<!-- 약관 동의 체크해야 활성화됨 -->
					<button id="target_btn"  disabled="disabled" onclick="requestPay()" class="flex-c-m stext-101 cl0 size-116 bg3 hov-btn3 p-lr-15 trans-04 pointer m-b-5">
						결제하기
					</button>
				</div>
				
			</div> <!-- select -->
		</div> <!-- .stickyWrap -->

	</div>
</div>

<script type="text/javascript">
	
var con = "${seatLength}";

var seat = [];

for(var i=0; i < con; i++) {

	seat.push(document.getElementById(i).value);

	console.log("seat:" + seat);

}
	
function requestPay(){
	
	var IMP = window.IMP;
	IMP.init('imp59933008'); // SKIP 가맹점 키 (아임포트 관리자 페이지 -> 내정보 -> 가맹점식별코드)

	IMP.request_pay({
			
		    pg : 'html5_inicis', 								// PG사 (이니시스(웹표준결제))
		    pay_method : 'card',								// 결제방식
		    merchant_uid : 'merchant_' + new Date().getTime(),	// 고유주문번호
		    name : '${conTitle}'+'${date}',						// 주문명
		    amount : '${price }', 								// 결제금액
		    buyer_email : '${userEmail }',						// 주문자 Email
		    buyer_name : '${userName }',						// 주문자명
		    buyer_tel : '${userPhone }',						// 주문자 연락처
		    buyer_addr : '${userAddr }',						// 주문자 주소
		   
		    
		}, function(rsp) { // callback함수
			console.log(rsp);
			
			var result = '';
		    if ( rsp.success ) { // 결제 성공 시 로직
		    	
		    	$.ajax({
		    		url: "/pay/complete"
		    		, method: "get"
		    		, headers : {"Content-Type" : "application/json"}
		    		, traditional : true
		    		, data : {
		    		 	userNo : '${userNo}',
		    		   	conNo : '${conNo}',
		    		   	date : '${date}',
		    		   	round : '${round}',
		    		   	price : '${price}',
		    		   	selectedSeat : seat,
		    		   	uid : rsp.imp_uid,
		    		   	applynum : rsp.apply_num
  		   	
		    		}
		    	});
		    	
		    	var msg = '결제가 완료되었습니다.';
//	 		    msg += ' , 고유ID : ' + rsp.imp_uid;
//	 		    msg += ' , 상점 거래ID : ' + rsp.merchant_uid;
//	 		    msg += ' , 결제 금액 : ' + rsp.paid_amount;
//	 		    msg += ' , 카드 승인번호 : ' + rsp.apply_num;
			    result = '0';
		       
		    } else { //결제 실패 시 로직
		        var msg = '결제에 실패하였습니다.';
// 		        msg += '에러내용 : ' + rsp.error_msg;
		        result = '1';
		        
		    }
		    
		    if(result == '0') {	    	
			    location.href='/pay/success';
			    
		    }
		    
		    alert(msg);
		    
		});
	
}

function showDetail(){
    document.querySelector("#desc").style.display = "block";
    document.querySelector("#open").style.display = "none";
}

function hideDetail(){
    document.querySelector("#desc").style.display = "none";
    document.querySelector("#open").style.display = "block";
}
function showDetail1(){
    document.querySelector("#desc1").style.display = "block";
    document.querySelector("#open1").style.display = "none";
}

function hideDetail1(){
    document.querySelector("#desc1").style.display = "none";
    document.querySelector("#open1").style.display = "block";
}
function showDetail2(){
    document.querySelector("#desc2").style.display = "block";
    document.querySelector("#open2").style.display = "none";
}

function hideDetail2(){
    document.querySelector("#desc2").style.display = "none";
    document.querySelector("#open2").style.display = "block";
}


$(document).ready(function() {
	
	$("#btnBack").click(function() {
		history.go(-1) });
})

function btnActive()  {
	
	console.log($("#target_btn").attr("disabled"))
	
	if($("#target_btn").attr("disabled") == "disabled" ){
		// 버튼 비활성화 상태일 경우
		$("#target_btn").attr("disabled", false); //활성화
		
	} else {
		// 버튼 활성화 상태일 경우
		$("#target_btn").attr("disabled", true); //비활성화
	}
	
};
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
