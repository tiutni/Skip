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

	IMP.request_pay({
		
	    pg : 'html5_inicis', 		// PG사 (이니시스(웹표준결제))
	    pay_method : 'card',		// 결제방식
	    merchant_uid : 'merchant_' + new Date().getTime(),	// 고유주문번호
	    name : '주문명:결제테스트',	// 주문명
	    amount : 1000, 				// 결제금액
	    buyer_email : '${user.userEmail }',	// 주문자 Email
	    buyer_name : '${user.userName }',	// 주문자명
	    buyer_tel : '${user.userPhone}',	// 주문자 연락처
	    buyer_addr : '${user.userAddr}',	// 주문자 주소
// 	    buyer_postcode : '12345'			// 주문자 우편번호
	    
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
// 	    if(result=='0'){
// 	    	location.href = $.getContextPath+"/pay/success";
// 	    }
	    alert(msg);
	});

// })
}
</script>

</head>
<body>

<button onclick="requestPay()">결제하기</button>

</body>
</html>