<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${param.search }" />
</c:if>

<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
	<ul class="pagination" style="margin: 0 auto">

	<c:choose>
	<c:when test="${empty search}">
	
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li>
				<a href="/noti/list?curPage=${paging.curPage - 1 }" class="flex-c-m how-pagination1 trans-04 m-all-7">&lt;</a>
			</li>
		</c:if>
	
	
		<%-- 페이징 번호 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage eq i }">
			<li class="active"><a href="/noti/list?curPage=${i }" class="flex-c-m how-pagination1 trans-04 m-all-7">${i }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="/noti/list?curPage=${i }" class="flex-c-m how-pagination1 trans-04 m-all-7">${i }</a></li>
		</c:if>
		</c:forEach>
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li>
				<a href="/noti/list?curPage=${paging.curPage + 1 }" class="flex-c-m how-pagination1 trans-04 m-all-7">&gt;</a>
			</li>
		</c:if>
	</c:when>


	<c:when test="${not empty search}">
	
		<%-- 이전 페이지로 가기 --%>
		<c:if test="${paging.curPage > 1 }">
			<li>
				<a href="/noti/list?curPage=${paging.curPage - 1 }${searchParam }" class="flex-c-m how-pagination1 trans-04 m-all-7">&lt;</a>
			</li>
		</c:if>
	
	
		<%-- 페이징 번호 리스트 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage eq i }">
			<li class="active"><a href="/noti/list?curPage=${i }${searchParam }" class="flex-c-m how-pagination1 trans-04 m-all-7">${i }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne i }">
			<li><a href="/noti/list?curPage=${i }${searchParam }" class="flex-c-m how-pagination1 trans-04 m-all-7">${i }</a></li>
		</c:if>
		</c:forEach>
		
		
		<%-- 다음 페이지로 가기 --%>
		<c:if test="${paging.curPage < paging.totalPage }">
			<li>
				<a href="/noti/list?curPage=${paging.curPage + 1 }${searchParam }" class="flex-c-m how-pagination1 trans-04 m-all-7">&gt;</a>
			</li>
		</c:if>
	
	</c:when>
	</c:choose>
	
	</ul>
</div>
















