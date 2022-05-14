<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">

<ul class="pagination">

<%-- 첫 페이지로 이동 --%>
<c:if test="${paging.curPage ne 1}">
	<li><a href="<%=request.getContextPath() %>/concert/view?conNo=${paging.conNo}">처음</a></li>
</c:if>
	
	
<%-- 이전 페이징 리스트로 이동 --%>
<c:choose>
	<c:when test="${paging.curPage < 11}">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>

	<c:otherwise>
		<li>
			<a href="/concert/view?conNo=${paging.conNo }&curPage=${paging.startPage - paging.pageCount }">
				&laquo;
			</a>
		</li>
	</c:otherwise>
</c:choose>
	
	<%-- 이전 페이지로 이동 --%>
<c:if test="${paging.curPage > 1 }">
	<li>
		<a href="<%=request.getContextPath() %>/concert/view?conNo=${paging.conNo }&curPage=${paging.curPage - 1}">
			&lt; 
		</a>
	</li>
</c:if>
	

<%-- 페이징 번호 리스트 --%>
<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	<c:choose>
		<c:when test="${paging.curPage eq i}">
			<li class="active">
				<a href="<%=request.getContextPath() %>/concert/view?conNo=${paging.conNo }&curPage=${i }">
					${i }
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="<%=request.getContextPath() %>/concert/view?conNo=${paging.conNo }&curPage=${i }">
					${i }
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</c:forEach>
	
<%-- 다음 페이지로 이동 --%>
<c:if test="${paging.curPage < paging.totalPage }">
	<li>
		<a href="<%=request.getContextPath() %>/concert/view?conNo=${paging.conNo }&curPage=${paging.curPage + 1 }">
			&gt; 
		</a>
	</li>
</c:if>
	
<%-- 다음 페이징 리스트로 이동 --%>
<c:choose>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	
	<c:otherwise>
		<li>
			<a href="/concert/view?conNo=${paging.conNo }&curPage=${paging.startPage + paging.pageCount }">
				&raquo;
			</a>
		</li>
	</c:otherwise>
</c:choose>
	
<%-- 마지막 페이지로 이동 --%>
<c:if test="${paging.curPage ne paging.totalPage }">
	<li><a href="<%=request.getContextPath() %>/concert/view?conNo=${paging.conNo }&curPage=${paging.totalPage }">
		끝
	</a>
	</li>
</c:if>
</ul>

</div>
