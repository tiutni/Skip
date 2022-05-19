<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>SKIP 결제</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>


<script type="text/javascript">

function requestPay(){
	
	var IMP = window.IMP;
	IMP.init('imp59933008'); // SKIP 가맹점 키 (아임포트 관리자 페이지 -> 내정보 -> 가맹점식별코드)

	if(${conTitle != null} ){
	// 공연 결제일 경우
		IMP.request_pay({
			
		    pg : 'html5_inicis', 		// PG사 (이니시스(웹표준결제))
		    pay_method : 'card',		// 결제방식
		    merchant_uid : 'merchant_' + new Date().getTime(),	// 고유주문번호
		    name : '${conTitle}',	// 주문명
		    amount : '${price }', 				// 결제금액
		    buyer_email : '${userEmail }',	// 주문자 Email
		    buyer_name : '${userName }',	// 주문자명
		    buyer_tel : '${userPhone }',	// 주문자 연락처
		    buyer_addr : '${userAddr }',	// 주문자 주소
		    
		}, function(rsp) { // callback함수
			console.log(rsp);
			
		    if ( rsp.success ) { // 결제 성공 시 로직 (결제 승인 또는 가상계좌 발급에 성공한 경우)
		    	
		        var msg = '결제가 완료되었습니다.';
		        msg += ' , 고유ID : ' + rsp.imp_uid;
		        msg += ' , 상점 거래ID : ' + rsp.merchant_uid;
		        msg += ' , 결제 금액 : ' + rsp.paid_amount;
		        msg += ' , 카드 승인번호 : ' + rsp.apply_num;
		        alert(msg);
		        
		        // 결제검증 코드
		        // jQuery로 HTTP 요청
		        jQuery.ajax({
		            url: "/pay/complete", // 가맹점 서버
		            method: "POST",
		            headers: { "Content-Type": "application/json" },
		            data: {
		                imp_uid: rsp.imp_uid,			// 고유ID
		                merchant_uid: rsp.merchant_uid	// 상점 거래ID
		                paid_amount: rsp.pad_amount		// 결제 금액
		                apply_num: rsp.apply_num		// 카드 승인번호
		                //기타 필요한 데이터가 있으면 추가 전달
		            }
	            }).done(function (data) { // 응답 처리
	            	
	                // 가맹점 서버 결제 API 성공시 로직
	                
	                switch(data.status) {
			            case: "vbankIssued":
				              // 가상계좌 발급 시 로직
				              break;
			            case: "success":
				              // 결제 성공 시 로직
				              break;
			    	}
	            })
		        
		    } else { //결제 실패 시 로직
		        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		    }
		})
	
	} else {
	//전시 결제일 경우	
	}
}
// })

</script>

</head>
<body>

<button onclick="requestPay()">결제하기</button>

</body>
</html>