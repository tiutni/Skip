<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	// 위시리스트 갯수
	$.ajax({
		type : "GET",
		url : "/wish/count",
		dataType : "JSON",
		contentType : "application/json; charset=utf8",
		data : {},
		success : function(data){
// 			alert("wishCount ajax success"); // ajax 테스트
			
			if(data != null){ // 위시리스트 있으면 갯수 표시
				console.log(wishCount);
				document.getElementById("wishCount").innerHTML="<div class='icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart' data-notify=' " + data + "'><i class='zmdi zmdi-favorite-outline'></i></div>";
			} else { // 위시리스트 없으면 0 표시
				console.log( wishCount );
				document.getElementById("wishCount").innerHTML="<div class='icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart' data-notify=' " + 0 + "'><i class='zmdi zmdi-favorite-outline'></i></div>";
			}
		},
		error: function (){
			console.log("wishCount ajax error"); 
		}
	});
	
	//--------------------------------------------------------------------------
	
	// 위시리스트 목록
	$("#wishCount").click(function(){

		$.ajax({
			type : "GET",
			url : "/wish/list",
			dataType : "html",
			success : function(data){
	 			console.log("wishList ajax success"); // ajax 테스트
				
				$("#wishList").html(data);
			},
			error: function (){
				console.log("wishList ajax error"); 
			}
		});
	})
	
});


function deleteWish(wishNo){
    if(confirm("위시리스트에서 삭제하시겠습니까?") == true){
        location.href="/wish/delete?wishNo="+ wishNo;
    }else{
        return;
    }
}   

</script>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>SKIP</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="../../resources/image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	
	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						Don't Stand In Line. Just SKIP.
					</div>

					<div class="right-top-bar flex-w h-full">
						<c:if test="${empty userNo || empty userId}">
							<a href="/user/join" class="flex-c-m trans-04 p-lr-25">
								JOIN
							</a>
							
							<a href="/user/login" class="flex-c-m trans-04 p-lr-25">
								LOGIN
							</a>
						</c:if>
						
						<c:if test="${userNo ne null && userId ne null && empty accessToken}">
							<a href="/user/logout" class="flex-c-m trans-04 p-lr-25">
								LOGOUT
							</a>
						</c:if>

						<c:if test="${userNo ne null && userId ne null && accessToken ne null}">
							<a href="https://kauth.kakao.com/oauth/logout?client_id=20a036a9e9a4a55d7de23fa420405573&logout_redirect_uri=http://localhost:8088/user/kakaoLogout" class="flex-c-m trans-04 p-lr-25">
								KAKAO LOGOUT
							</a>
						</c:if>
					</div>
				</div>
			</div> 

			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="/" class="logo">
						<img src="../../resources/images/icons/logo_01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu">
								<a href="/">Home</a>
							</li>

							<li>
								<a href="/mypage/myconorder">My Page</a>
							</li>

							<li>
								<a href="/mypage/myconorder">Booking</a>
							</li>

							<li>
								<a href="/noti/list">Notice</a>
							</li>

							<li>
								<a href="/mypage/qnalist">QnA</a>
							</li>

							<li>
								<a href="/faq/list">FAQ</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">

					<!-- 위시리스트 버튼 -->
					<div id="wishCount" class="js-show-cart">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="-">
 							<i class="zmdi zmdi-favorite-outline"></i>
						</div> 
					</div>

					</div>
				</nav>
			</div>	
		</div>


		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="../../resources/images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>

	<!-- 위시리스트 목록 -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					WISH LIST
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					
					<!-- ajax로 채워질 위시리스트 목록 -->
					<div id="wishList">
						
					</div>
				
				</ul>
				
			</div>
		</div>
	</div>

	<!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1" style="background-image: url(../../resources/images/banner_01.jpg);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl13 respon2">
									Don't Stand In Line
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl13 p-t-19 p-b-43 respon1">
									DO SKIP
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
								<a href="#tickets" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 nav-link">
									SKIP Now
								</a>
							</div>
						</div>
					</div>
				</div>
	
				<div class="item-slick1" style="background-image: url(../../resources/images/banner_02.png);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl13 respon2">
									Don't Stand In Line
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-201 cl13 p-t-19 p-b-43 respon1">
									Concerts & Exhibitions
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
								<a href="#tickets" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 nav-link">
									SKIP Now
								</a>
							</div>
						</div>
					</div>
				</div>
	
			</div>
		</div>
	</section> <!-- Slider End -->
	
