<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SKIP 관리자페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        
        <link href="../../resources/admbootstrap/css/styles.css" rel="stylesheet" />
        
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        
        <script src="../../resources/admbootstrap/js/scripts.js"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        
        <script src="../../resources/admbootstrap/assets/demo/chart-area-demo.js"></script>
        <script src="../../resources/admbootstrap/assets/demo/chart-bar-demo.js"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        
        <script src="../../resources/admbootstrap/js/datatables-simple-demo.js"></script>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> <!-- 아이콘 추가 --> <!-- https://icons.getbootstrap.com -->
        
        <!-- 파비콘 -->	<link rel="shortcut icon" href="/resources/images/favicon.ico">
        
    </head>
    
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/">SKIP</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-person-circle"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/admin/update">Modify</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/admin/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Member</div>
                            <a class="nav-link" href="/admin/member/list">
                                <div class="sb-nav-link-icon"><i class="bi bi-people-fill"></i></div>
                                회원
                            </a>
                            <div class="sb-sidenav-menu-heading">Exhibition</div>
                            <a class="nav-link" href="/admin/exhibition/list">
                                <div class="sb-nav-link-icon"><i class="bi bi-calendar-day"></i></div>
                                전시
                            </a>
                            <div class="sb-sidenav-menu-heading">Concert</div>
                            <a class="nav-link" href="/admin/concert/list">
                                <div class="sb-nav-link-icon"><i class="bi bi-calendar-date"></i></div>
                                공연
                            </a>
                            <div class="sb-sidenav-menu-heading">Notice</div>
                            <a class="nav-link" href="/admin/noti/list">
                                <div class="sb-nav-link-icon"><i class="bi bi-exclamation-circle"></i></div>
                                공지사항
                            </a>
                            <div class="sb-sidenav-menu-heading">FAQ</div>
                            <a class="nav-link" href="/admin/faq/list">
                                <div class="sb-nav-link-icon"><i class="bi bi-question-circle"></i></div>
                                자주 묻는 질문
                            </a>
                            <div class="sb-sidenav-menu-heading">QnA</div>
                            <a class="nav-link" href="/admin/qna/list">
                                <div class="sb-nav-link-icon"><i class="bi bi-chat-dots"></i></div>
                                1:1 문의
                            </a>
                           
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        SKIP 관리자 페이지 
                        <div class="small">SKIP Administrator page</div>
                    </div>
                </nav>
            </div>
            
