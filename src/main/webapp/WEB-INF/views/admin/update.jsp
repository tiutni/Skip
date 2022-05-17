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
        <title>Admin Join</title>
        <link href="../../resources/admbootstrap/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
       

<script>

$(document).ready(function() {

	$("#cancel").click(function() {
		history.go(-1) });

})

setInterval (function() {
	var pwd1 = $("#adminPw").val();
    var pwd2 = $("#adminPw2").val();
	    if ( pwd1!= "" && pwd2!= "" ){
	    	  if (pwd1 == pwd2) {
	              $("#alert-success").css('display', 'inline-block');
	              $("#alert-danger").css('display', 'none');
	          } else {
	              $("#alert-success").css('display', 'none');
	              $("#alert-danger").css('display', 'inline-block');
	          }
	    }
	}, 300);
	
</script>
</head>

  <body class="bg-dark">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Change Password</h3></div>
                                    <div class="card-body">
                                        <form action="/admin/update" method="post">
                                        
                                        
                                            <div class="form-group">
											<input type="hidden" id="adminId" name="adminId" value="${id }">
											</div>
                                                
                                            
                                        
                                            <div class="row mb-3" class ="pw">
                                                <div class="d-grid">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input type="password" class="form-control" name="adminPw" id="adminPw" class="pw" autoComplete="off" placeholder="Create a password" required />
                                                        <label for="adminPw">Password</label>
                                                    </div>
                                                </div>
                                          </div>
                                          
                                        
                                            <div class="row mb-3" class ="pw">
                                                <div class="d-grid">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input type="password" class="form-control" name="adminPw2" id="adminPw2" class="pw" autoComplete="off" placeholder="Create a password" required />
                                                        <label for="adminPw">Password</label>
                                                    </div>
                                                </div>
                                          </div>
                                                
                                                <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
    											<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>
                                            
                                            <div class="form-group">
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <button class="btn btn-danger" id="cancel">Cancel</button>
                                                <button class="btn btn-primary btn-block" >Change</button>
                                                
                                            </div>
                                            </div>
                                            
                                        </form>
                                    </div>
                              
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>