<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">

<ul class="pagination" style="margin: 0 auto">

<c:choose>

<c:when test="${empty search and empty sort}">
<%-- 이전 페이지로 이동 --%>
<c:if test="${paging.curPage > 1 }">
	<li>
		<a href="<%=request.getContextPath() %>/mypage/myreviewlist?curPage=${paging.curPage - 1}" class="flex-c-m how-pagination1 trans-04 m-all-7">
			&lt;
		</a>
	</li>
</c:if>
	

<%-- 페이징 번호 리스트 --%>
<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	<c:choose>
		<c:when test="${paging.curPage eq i}">
			<li class="active">
				<a href="<%=request.getContextPath() %>/mypage/myreviewlist?curPage=${i }" class="flex-c-m how-pagination1 trans-04 m-all-7">
					${i }
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="<%=request.getContextPath() %>/mypage/myreviewlist?curPage=${i }" class="flex-c-m how-pagination1 trans-04 m-all-7">
					${i }
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</c:forEach>
	
<%-- 다음 페이지로 이동 --%>
<c:if test="${paging.curPage < paging.totalPage }">
	<li>
		<a href="<%=request.getContextPath() %>/mypage/myreviewlist?curPage=${paging.curPage + 1 }" class="flex-c-m how-pagination1 trans-04 m-all-7">
			&gt;
		</a>
	</li>
</c:if>
</c:when>


<c:when test="${not empty search}">
<%-- 이전 페이지로 이동 --%>
<c:if test="${paging.curPage > 1 }">
	<li>
		<a href="<%=request.getContextPath() %>/mypage/myreviewlist?search=${search }&curPage=${paging.curPage - 1}" class="flex-c-m how-pagination1 trans-04 m-all-7">
			&lt; 
		</a>
	</li>
</c:if>
	

<%-- 페이징 번호 리스트 --%>
<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	<c:choose>
		<c:when test="${paging.curPage eq i}">
			<li class="active">
				<a href="<%=request.getContextPath() %>/mypage/myreviewlist?search=${search }&curPage=${i }" class="flex-c-m how-pagination1 trans-04 m-all-7">
					${i }
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="<%=request.getContextPath() %>/mypage/myreviewlist?search=${search }&curPage=${i }" class="flex-c-m how-pagination1 trans-04 m-all-7">
					${i }
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</c:forEach>
	
<%-- 다음 페이지로 이동 --%>
<c:if test="${paging.curPage < paging.totalPage }">
	<li>
		<a href="<%=request.getContextPath() %>/mypage/myreviewlist?search=${search }&curPage=${paging.curPage + 1 }" class="flex-c-m how-pagination1 trans-04 m-all-7">
			&gt; 
		</a>
	</li>
</c:if>
</c:when>

<c:when test="${empty search and not empty sort}">
<%-- 이전 페이지로 이동 --%>
<c:if test="${paging.curPage > 1 }">
	<li>
		<a href="<%=request.getContextPath() %>/mypage/myreviewlist?sort=${sort }&curPage=${paging.curPage - 1}" class="flex-c-m how-pagination1 trans-04 m-all-7">
			&lt; 
		</a>
	</li>
</c:if>
	

<%-- 페이징 번호 리스트 --%>
<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	<c:choose>
		<c:when test="${paging.curPage eq i}">
			<li class="active">
				<a href="<%=request.getContextPath() %>/mypage/myreviewlist?sort=${sort }&curPage=${i }" class="flex-c-m how-pagination1 trans-04 m-all-7">
					${i }
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="<%=request.getContextPath() %>/mypage/myreviewlist?sort=${sort }&curPage=${i }" class="flex-c-m how-pagination1 trans-04 m-all-7">
					${i }
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</c:forEach>
	
<%-- 다음 페이지로 이동 --%>
<c:if test="${paging.curPage < paging.totalPage }">
	<li>
		<a href="<%=request.getContextPath() %>/mypage/myreviewlist?sort=${sort }&curPage=${paging.curPage + 1 }" class="flex-c-m how-pagination1 trans-04 m-all-7">
			&gt; 
		</a>
	</li>
</c:if>
</c:when>
</c:choose>
</ul>

</div>