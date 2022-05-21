<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
								<a href="/mypage/main">My Page</a>
							</li>

							<li>
								<a href="#">Booking</a>
							</li>

							<li>
								<a href="/noti/list">Notice</a>
							</li>

							<li>
								<a href="#">QnA</a>
							</li>

							<li>
								<a href="/faq/list">FAQ</a>
							</li>
						</ul>
					</div>	
				</nav>
			</div>	
		</div>
	</header>