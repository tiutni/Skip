<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>


<script type="text/javascript">

// var conTitle = '${conTitle}';
// var exTitle = '${exTitle}';
// var userNo = '${userNo}';
// var conNo = '${conNo}';
// var exNo = '${exNo}';
// var date = '${date}';
// var round = '${round}';
// for(int i=0; i<selectedSeat)
// var selectedSeat = '${selectedSeat}';

function requestPay(){
	
	console.log("requestPay() 시작!!!!!!!!!!!!!!!!")
// 	console.log('conTitle')
	
	var IMP = window.IMP;
	IMP.init('imp59933008'); // SKIP 가맹점 키 (아임포트 관리자 페이지 -> 내정보 -> 가맹점식별코드)



// 	if('${conTitle}'){
	//공연 결제일 경우
	
		IMP.request_pay({
			
		    pg : 'html5_inicis', 								// PG사 (이니시스(웹표준결제))
		    pay_method : 'card',								// 결제방식
		    merchant_uid : 'merchant_' + new Date().getTime(),	// 고유주문번호
		    name : '${conTitle}'+'${date}',									// 주문명
		    amount : '${price }', 								// 결제금액
		    buyer_email : '${userEmail }',						// 주문자 Email
		    buyer_name : '${userName }',						// 주문자명
		    buyer_tel : '${userPhone }',						// 주문자 연락처
		    buyer_addr : '${userAddr }',						// 주문자 주소
		    
		}, function(rsp) { // callback함수
			console.log(rsp);
			
			var result = '';
		    if ( rsp.success ) { // 결제 성공 시 로직
		        var msg = '결제가 완료되었습니다.';
		        msg += ' , 고유ID : ' + rsp.imp_uid;
		        msg += ' , 상점 거래ID : ' + rsp.merchant_uid;
		        msg += ' , 결제 금액 : ' + rsp.paid_amount;
		        msg += ' , 카드 승인번호 : ' + rsp.apply_num;
		        result = '0';
		        
		    } else { //결제 실패 시 로직
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        result = '1';
		        
		    }
		    if(result=='0'){
// 		    	location.href = "/pay/complete";

				jQuery.ajax({
		            url: "/pay/complete" , // 가맹점 서버
		            method: "POST",
// 		            headers: { "Content-Type": "application/json" },
		            data: {
		                imp_uid: rsp.imp_uid,				// 고유ID
		                merchant_uid: rsp.merchant_uid,		// 상점 거래ID
		                paid_amount: rsp.paid_amount,		// 결제 금액
		                apply_num: rsp.apply_num,			// 카드 승인번호
		                
// 		                conNo: conNo,
// 		                date: date,
// 		                round: round,
// 		                selectedSeat: selectedSeat
		                //기타 필요한 데이터가 있으면 추가 전달
		            }
	            }.done(function (data) { // 응답 처리
	                // 가맹점 서버 결제 API 성공시 로직
					console.log(data);
	            
					// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
		        	if(rsp.paid_amount == data.response.amount){
			        	alert("결제 및 결제검증완료");
			        	location.href = "/pay/complete";
		        	} else {
		        		alert("결제 실패");
		        	}
	            })
				
				);
		    }
		    alert(msg);
		});
	
// 	} else if ( exTitle != null ) {
// 		//전시 결제일 경우	
	
		IMP.request_pay({
			
		    pg : 'html5_inicis', 								// PG사 (이니시스(웹표준결제))
		    pay_method : 'card',								// 결제방식
		    merchant_uid : 'merchant_' + new Date().getTime(),	// 고유주문번호
		    name : '${exTitle}'+'${date}',									// 주문명
		    amount : '${price }', 								// 결제금액
		    buyer_email : '${userEmail }',						// 주문자 Email
		    buyer_name : '${userName }',						// 주문자명
		    buyer_tel : '${userPhone }',						// 주문자 연락처
		    buyer_addr : '${userAddr }',						// 주문자 주소
		    
		}, function(rsp) { // callback함수
			console.log(rsp);
			
			var result = '';
		    if ( rsp.success ) { // 결제 성공 시 로직
		        var msg = '결제가 완료되었습니다.';
		        msg += ' , 고유ID : ' + rsp.imp_uid;
		        msg += ' , 상점 거래ID : ' + rsp.merchant_uid;
		        msg += ' , 결제 금액 : ' + rsp.paid_amount;
		        msg += ' , 카드 승인번호 : ' + rsp.apply_num;
		        result = '0';
		        
		    } else { //결제 실패 시 로직
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        result = '1';
		        
		    }
		    if(result=='0'){
// 		    	location.href = "/pay/complete";

				jQuery.ajax({
		            url: "/pay/complete" , // 가맹점 서버
		            method: "POST",
// 		            headers: { "Content-Type": "application/json" },
		            data: {
		                imp_uid: rsp.imp_uid,				// 고유ID
		                merchant_uid: rsp.merchant_uid,		// 상점 거래ID
		                paid_amount: rsp.paid_amount,		// 결제 금액
		                apply_num: rsp.apply_num,			// 카드 승인번호
		                
// 		                conNo: conNo,
// 		                date: date,
// 		                round: round,
// 		                selectedSeat: selectedSeat
		                //기타 필요한 데이터가 있으면 추가 전달
		            }
	            }.done(function (data) { // 응답 처리
	                // 가맹점 서버 결제 API 성공시 로직
					console.log(data);
	            
					// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
		        	if(rsp.paid_amount == data.response.amount){
			        	alert("결제 및 결제검증완료");
			        	location.href = "/pay/complete";
		        	} else {
		        		alert("결제 실패");
		        	}
	            })
				
				);
		    }
		    alert(msg);
		});	
// 	}
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
		$("#target_btn").attr("class", 'btn btn-primary'); 
		
	} else {
		// 버튼 활성화 상태일 경우
		
		$("#target_btn").attr("disabled", true); //비활성화
		$("#target_btn").attr("class", 'btn btn-secondary'); 
	}
	
};
</script>

<style>
.detail {
            display: none;
        }
</style>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
		<h1 class="mt-4">Agreement</h1><br>
			<div class="card mb-4">
				<div class="card-body">
					<p class="mb-0">
						<input type="checkbox" id="check" onclick="btnActive()"><label for="check" > <br>주문자 동의<br>회원 본인은 구매 조건, 주문 내용 확인 및 결제에 동의합니다</label><br>
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
				        </div>
				        	<br>
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
						</div>
							<br>
				        	<button class="over" id="open2" onclick="showDetail2()">전자결제대행 이용 동의 </button>
				        	<div class="detail" id="desc2">
				            		이 약관은 전자지급결제대행서비스 및 결제대금예치서비스를 제공하는 토스페이먼츠 주식회사(이하 '회사'라 합니다)와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.
				            <br><button id="close" onclick="hideDetail2()">상세 설명 닫기</button>    
						</div>
				</div>
			</div>
		</div>



			<div class="card mb-4">
				<div class="card-body">
					<p class="mb-0">
					
						주문자 정보
				<br><br>이름 : ${userName }
					<br>이메일 : ${userEmail }
					<br>연락처 : ${userPhone }
					<br>주소 : ${userAddr }
				        	
					</p>
				</div>
			</div>
			
			
		<c:if test="${not empty conTitle }">
			<div class="card mb-4">
				<div class="card-body">
					<p class="mb-0">
					
						공연 정보
				<br><br>공연 명 : ${conTitle }
					<br>관람일 : ${date }
					<br>회차 : ${round }
					
					<c:forEach items="${selectedSeat}" var="i">
					<br>좌석번호 : ${i}
					</c:forEach>
					
					<br>총 결제 금액 : ${price }
					
					</p>
				</div>
			</div>
		</c:if>
		
		
		<c:if test="${not empty exTitle }">
			<div class="card mb-4">
				<div class="card-body">
					<p class="mb-0">
					
						전시 정보
				<br><br>전시회 명 : ${exTitle}
					<br>관람일 : ${date}
					<br>매수 : ${count}
					<br>총 결제 금액 : ${price}
				        	
					</p>
				</div>
			</div>
		</c:if>
		
		</div>
	</main>            
</div> 

<div class="text-center">
		<button id="target_btn" class="btn btn-secondary" disabled="disabled" onclick="requestPay()">결제</button>
		<button id="btnBack" class="btn btn-danger" >취소</button>
</div>
<br>

<c:import url="/WEB-INF/views/layout/footer.jsp" />



