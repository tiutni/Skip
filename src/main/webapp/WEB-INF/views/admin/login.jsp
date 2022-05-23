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
        <title>SKIP Admin Login</title>
        <link href="../../resources/admbootstrap/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
        <!-- 파비콘 --><link rel="shortcut icon" href="/resources/images/favicon.ico">
        
    </head>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#id").focus();
	
})
</script>

<br><br>
<h1 style= "color: white; font-size: 40p; text-align: center;" >SKIP ADMIN</h1>
<br><br>

<body class="bg-dark">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        
                                        <form action="/admin/login" method="post">
                                           
                                            <div class="form-group">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="adminId" name="adminId" placeholder="ID" required />
                                                <label for="id">ID</label>
                                            </div>
                                            </div>
                                            
                                            <div class="form-group">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" id="adminPw" name="adminPw" placeholder="Password" required />
                                                <label for="pw">Password</label>
                                            </div>
                                            </div>
                                            
                                            <div class="form-group">
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="btn btn btn-danger" href="/">Home</a>
                                                <button class="btn btn-primary">Login</button>
                                            </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="/admin/join">Creating an Account</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>

</div><!-- .container end -->

