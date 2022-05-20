<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/mypage/myconorder"
	})
	
	$(".cwa-tab > li").click(function() {
		$(location).attr("href", $(this).find("a").attr("href"))
	})
	
})

</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

.cwa-tab {
	width: 80%;
	height: 50px;
	margin: 50px auto;
}
.cwa-tab > li {
    float: left;
    display: table;
    width: calc(100% / 7);
    height: 66px;
    position: relative;
    box-sizing: border-box;
}

.cwa-tab > li > a {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
    font-size: 15px;
    color: #8b8b8b;
    line-height: 20px;
    padding: 5px 8px;
    
}    
.cwa-tab > li::before {
    position: absolute;
    top: 0;
    left: -1px;
    width: calc(100% - 1px);
    height: calc(100% - 1px);
    border: 1px solid #e5e5e5;
    content: "";
}





</style>

<ul class="cwa-tab mgt50">
	<li class="">
	<a href="/mypage/myconorder"><button>My Concert Order</button></a><br>
	</li>
	<li class="">
	<a href="/mypage/myexorder"><button>My Exhibition Order</button></a><br>
	</li>
	<li class="">
	<a href="/mypage/myreviewlist"><button>My Concert Review</button></a><br>
	</li>
	<li class="">
	<a href="/mypage/myexreviewlist"><button>My Exhibition Review</button></a><br>
	</li>
	<li class="">
	<a href="/mypage/qnalist"><button>My QnA</button></a><br>
	</li>
	<li class="">
	<a href="/userinfo/update"><button>My Information</button></a><br>
	</li>
	<li class="">
	<a href="/userinfo/delete"><button>Withdrawal</button></a><br>
	</li>
</ul>



<!-- 나의주문 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				MY Exhibition Order
			</h3>
		</div>

<br><br><br>	

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 15%;">주문번호</th>
		<th style="width: 15%;">전시회이미지</th>
		<th style="width: 15%;">전시회제목</th>
		<th style="width: 15%;">주문날짜</th>
		<th style="width: 15%;">주문상태</th>
		<th style="width: 15%;">전시회 예약날짜</th>
		<th style="width: 15%;">총매수</th>
		
</tr>
</thead>
<tbody>
<c:forEach items="${exlist }" var="exorder">
	<tr>
		<td>${exorder.orderNo }</td>
		<td><img src="/upload/${exorder.exImgStoredname }" style="width: 40px; height: 60px;"></td>
		<td><a href="/exhibition/view?exNo=${exorder.exNo }">${exorder.exTitle }</a></td>
		<td><fmt:formatDate value="${exorder.orderDate }" pattern="yyyy-MM-dd"/></td>		
		<td>${exorder.orderStatus }</td>
		<td><fmt:formatDate value="${exorder.exOrderDate }" pattern="yyyy-MM-dd"/></td>		
		<td>${exorder.exOrderCount}</td>
		
	</tr>
</c:forEach>
</tbody>
</table>		

<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>


<c:import url="myexorderpaging.jsp" />

	</div><!-- .container -->


</section>
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />

