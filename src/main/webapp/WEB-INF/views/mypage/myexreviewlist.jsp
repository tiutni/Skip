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


<!-- 나의리뷰 -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				MY Exhibition review
			</h3>
		</div>

<style type="text/css">
.grid_cont {
	font-size: large;
	border: 2px solid #ccc;
	border-color: #FFF5EE;
	background-color: #F5F5F5;
	margin: 5px;
	border-radius: 10px;
	display: grid;
}
.grid_cont {
    display: flex;
    justify-content: space-between;
}
</style>

<c:forEach items="${list }" var="exreview">
<div class="grid_cont">
	<div class="cont_row">
	<div class="cont">${exreview.EX_TITLE }</div>
	<div class="cont"><a href="/exhibition/view?exNo=${exreview.EX_NO }">${exreview.EX_REVIEW_CONTENT }</a></div>
	</div>
	
	<div class="cont_row">
	<div class="cont"><fmt:formatDate value="${exreview.EX_REVIEW_DATE }" pattern="yy-MM-dd "/></div>
	<div class="cont">
	<c:choose>
		<c:when test="${exreview.EX_REVIEW_STAR eq 5 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★★★★</span>
		</c:when>
		
		<c:when test="${exreview.EX_REVIEW_STAR eq 4 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★★★☆</span>
		</c:when>
		
		<c:when test="${exreview.EX_REVIEW_STAR eq 3 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★★☆☆</span>
		</c:when>
		
		<c:when test="${exreview.EX_REVIEW_STAR eq 2 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★★☆☆☆</span>
		</c:when>
		
		<c:when test="${exreview.EX_REVIEW_STAR eq 1 }">
		<span style="font-size: 12px; color: rgb(255,201,14);">★☆☆☆☆</span>
		</c:when>
	</c:choose>
	</div>
	</div>
</div>
</c:forEach>


<c:import url="myexreviewpaging.jsp" />

	</div><!-- .container -->


</section>
	

<c:import url="/WEB-INF/views/layout/footer.jsp" />



