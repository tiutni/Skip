<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {

	$('#checkAll').click(function () {    
		   $(':checkbox.checkbox').prop('checked', this.checked);
	});
	
});

$(document).ready(function() {
	
	$('#checkAll').click(function () {  
			$("#btnShow").show();
		   
	});
});

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

$(document).ready(function() {
	$("#btnGo").click(function() {
		location.href = "/" /* 결제 주소창 */
	})
	
	$("#btnBack").click(function() {
		history.go(-1) });
})
</script>

<style>
.detail {
            display: none;
        }
</style>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
		<h1 class="mt-4">약관 동의</h1><br>
			<div class="card mb-4">
				<div class="card-body">
					<p class="mb-0">
						<input type="checkbox" id="checkAll"><label for="checkAll" > <br>이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신(선택)에 모두 동의합니다.</label>
					</p>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-body">
					<p class="mb-0">
						<input type="checkbox" class="checkbox"><label for="checkbox" > <br>[필수] 만 14세 이상 </label>
					</p>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-body">
					<p class="mb-0">
						<input type="checkbox" class="checkbox"><label for="checkbox"> <br>[필수] 이용약관 동의보기 </label>
						<div id="item">
				        	<button class="over" id="open" onclick="showDetail()">상세 설명 보기</button>
				        	<div class="detail" id="desc">
				            		본 이용약관은 SKIP에서 제공하는 모든 서비스(이하 "서비스")를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
									PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.
				            <button id="close" onclick="hideDetail()">상세 설명 닫기</button>    
				        </div>
						</div>
					</p>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-body">
					<p class="mb-0">
						<input type="checkbox" class="checkbox"><label for="checkbox"> <br>[필수] 개인정보 처리방침 동의 </label>
						<div id="item">
				        <button class="over" id="open1" onclick="showDetail1()">상세 설명 보기</button>
				        <div class="detail" id="desc1">
						           	SKIP은 개인정보를 수집∙이용하고 있습니다. 
						            개인정보가 필요한 시점에 최소한의 정보만을 수집하며, 고지한 범위 내에서만 사용합니다. 
						            또한 사전 동의 없이 고지한 범위를 초과하여 이용하거나 외부에 공개하지 않습니다.
				            <button id="close" onclick="hideDetail1()">상세 설명 닫기</button>   
				        </div>
						</div>
					</p>
				</div>
			</div>
		</div>
	</main>            
</div>            

<div class="text-center">
		<button id="btnGo" class="btn btn-primary">결제</button>
		<button id="btnBack" class="btn btn-danger">취소</button>
</div>
<br>

<c:import url="/WEB-INF/views/layout/footer.jsp" />



