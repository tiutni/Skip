<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
function btnUnActivate(exNo){
    if(confirm("전시를 종료하시겠습니까?") == true){
        location.href="/admin/exhibition/unactivate?exNo="+ exNo;
    }else{
        return;
    }
}  

function btnActivate(exNo){
    if(confirm("전시를 재개하시겠습니까?") == true){
        location.href="/admin/exhibition/activate?exNo="+ exNo;
    }else{
        return;
    }
}  

$(document).ready(function() {
	//글쓰기 버튼 클릭
	$("#btnWrite").click(function() {
		location.href = "/admin/exhibition/write"
	});
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/admin/exhibition/list?search="+$("#search").val();
	});
});
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th, td {
	text-align: center;
	vertical-align: middle;
}
</style>

<div class="container">

	<!-- Exhibition -->
	<article class="bg0 p-t-23 p-b-140">
	
		<!-- 페이지 제목 -->
		<br>
		<div class="p-b-10">
			<h3 class="ltext-103 cl5" style="text-align: center;">
				<a onclick="location.href='/admin/exhibition/list'">Exhibition</a>
			</h3>
		</div>
		
		<br><hr>
		
		<!-- 목록 -->
		<div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th style="width: 5%; text-align: center; vertical-align: middle;">번호</th>
					<th style="width: 30%; text-align: center; vertical-align: middle;">제목</th>
					<th style="width: 10%; text-align: center; vertical-align: middle;">작성자</th>
					<th style="width: 15%; text-align: center; vertical-align: middle;">작성일</th>
					<th style="width: 15%; text-align: center; vertical-align: middle;">예매율</th>
					<th style="width: 15%; text-align: center; vertical-align: middle;">평점</th>
					<th style="width: 10%; text-align: center; vertical-align: middle;">종료여부</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="exhibition">
				<tr>
					<td style="vertical-align: middle;">${exhibition.exNo }</td>
					<td style="vertical-align: middle; text-align: left;"><a href="/exhibition/view?exNo=${exhibition.exNo }">${exhibition.exTitle }</a></td>
					<td style="vertical-align: middle;">${exhibition.adminId }</td>
					<td style="vertical-align: middle;"><fmt:formatDate value="${exhibition.exRegDate }" pattern="yy-MM-dd"/></td>
					<td style="vertical-align: middle;">예매된 티켓수 / exhibition.exticketNum</td> 
					<td style="vertical-align: middle;">대범님푸쉬하면 인계받기</td>
					<td style="vertical-align: middle;">
						<c:choose>
							<c:when test="${ 1 == exhibition.exActivate }">
								<button onclick="btnUnActivate(${exhibition.exNo})" id="btnUnActivate" class="btn btn-secondary">종료하기</button>
							</c:when>
							<c:otherwise>
								<button onclick="btnActivate(${exhibition.exNo})" id="btnActivate" class="btn btn-primary">재개하기</button>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
						
		<!-- 검색 -->
		<div class="form-inline text-center pull-left">
			<button id="btnSearch" class="btn btn-primary">검색</button>
			<input style="width: 300px" class="form-control" type="text" id="search" value="${param.search }" />
		</div>
		
		<!-- 글쓰기 버튼 -->
		<div><button id="btnWrite" class="btn btn-primary pull-right">글쓰기</button></div>
		
		<!-- 페이징 -->
<%-- 		<div><span class="pull-right">total : ${paging.totalCount }</span></div> --%>
		<div class="clearfix"></div>
		
		<c:import url="/WEB-INF/views/admin/exhibition/paging.jsp" />
	
	</article><!-- .Exhibition -->

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











