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



<!-- ???????????? -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				MY Concert Order
			</h3>
		</div>

<br><br><br>	

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 15%;">????????????</th>
		<th style="width: 15%;">???????????????</th>
		<th style="width: 15%;">????????????</th>
		<th style="width: 15%;">????????????</th>
		<th style="width: 15%;">????????????</th>
		<th style="width: 15%;">?????? ????????????</th>
		<th style="width: 15%;">?????? ??????</th>
		
		
	</tr>
</thead>
<tbody>
<c:forEach items="${conlist }" var="conorder">
	<tr>
		<td>${conorder.orderNo }</td>
		<td><img src="/upload/${conorder.conImgStoredName }" style="width: 40px; height:60px;"></td>
		<td><a href="/concert/view?conNo=${conorder.conNo }">${conorder.conTitle}</a></td>
		<td><fmt:formatDate value="${conorder.orderDate }" pattern="yyyy-MM-dd"/></td>		
		<td>${conorder.orderStatus }</td>
		<td><fmt:formatDate value="${conorder.conOrderDate }" pattern="yyyy-MM-dd"/></td>		
		<td>${conorder.seatNo}</td>
		
	</tr>
</c:forEach>
</tbody>
</table>		

<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="myconorderpaging.jsp" />

	</div><!-- .container -->


</section>
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />

