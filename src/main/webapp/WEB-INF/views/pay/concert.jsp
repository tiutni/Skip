<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>

</head>
<body>
<h1>공연 결제</h1> <%-- 나중에 지울 예정 --%>

<script type="text/javascript">
	$(document).ready(function() {
			
		$("#btn-payment").click(function() {
			const c = confirm("결제하시겠습니까?")
			if (!c) return false;
				
		 	var IMP = window.IMP;
			IMP.init('imp04863076'); //가맹점 코드
		
			IMP.request_pay({
			    pg : 'html5_inicis', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
			    pay_method : 'card', //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
			    merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
			    name : '주문명:결제테스트', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성
			    amount : 100, //결제금액 - 필수항목
			    buyer_email : '${user.userEmail}', //주문자Email - 선택항목
			    buyer_name : '${user.userName }', //주문자명 - 선택항목
			    buyer_tel : '${user.userPhone }', //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생
			    buyer_addr : '서울특별시 강남구 삼성동', //주문자주소 - 선택항목
			    buyer_postcode : '${addrZipCode}', //주문자우편번호 - 선택항목
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete' //모바일결제후 이동페이지 - 선택항목, 모바일에서만 동작
			}, function(rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
			    if ( rsp.success ) { // 결제 성공 로직
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        // 결제 완료 처리 로직
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
						type: 'POST',
						dataType: 'json',
						data: {
							imp_uid : rsp.imp_uid
							//기타 필요한 데이터가 있으면 추가 전달
							}
					}).done(function(data) {
						//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if ( everythings_fine ) {
							var msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
							
							alert(msg);
			    		} else {
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    		}
			    	});
			        
			    } else { // 결제 실패 로직
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
			    
		});
	})
		
	</script>
<hr>

<button id="btn-payment">결제</button>

<form>
<table>
<tr>
<td>좌석</td>
<td><select><option>선택</option></select></td> <%-- ajax 넣기 --%>
</tr>
<tr>
<td>날짜</td>
<td><select><option>선택</option></select></td> <%-- ajax 넣기 --%>
</tr>
<tr>
<td>회차</td>
<td><select><option>선택</option></select></td> <%-- ajax 넣기 --%>
</tr>
<tr>
<td>쿠폰 선택</td>
<td><select><option>없음</option></select></td> <%-- ajax 넣기 --%>
</tr>
</table>
<div>
<button>다음</button>
<button>취소</button>
</div>
</form>
</body>
</html>