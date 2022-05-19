<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로그인상태 -->
<c:if test="${login }">

	<!-- 위시리스트가 있는 경우 -->
	<c:if test="${wishList.size() != 0 }">
	
	<c:forEach items="${wishList }" var="wish">
		<c:choose>
		<c:when test="${wish.showType == 1 }">
				<li class="header-cart-item flex-w flex-t m-b-12">
					<div onclick="deleteWish(${wish.wishNo})" class="header-cart-item-img" >
						<img src="/upload/${wish.conImgStoredName }" alt="IMG">
					</div>
	
					<div class="header-cart-item-txt p-t-8">
						<a href="/concert/view?conNo=${wish.conNo }" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
							${wish.conTitle }
						</a>
	
						<span class="header-cart-item-info">
							${wish.conAddress }
						</span>
					</div>
				</li>
		</c:when>
	
		<c:when test="${wish.showType == 2 }">
				<li class="header-cart-item flex-w flex-t m-b-12">
					<div onclick="deleteWish(${wish.wishNo})" class="header-cart-item-img">
						<img src="/upload/${wish.exImgStoredName }" alt="IMG">
					</div>
	
					<div class="header-cart-item-txt p-t-8">
						<a href="/exhibition/view?exNo=${wish.exNo }" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
							${wish.exTitle }
						</a>
	
						<span class="header-cart-item-info">
							${wish.exAddress }
						</span>
					</div>
				</li>
		</c:when>
		</c:choose>
	</c:forEach>
	
	</c:if> 
	
	<!-- 위시리스트가 빈 경우 -->
	<c:if test="${wishList.size() == 0 }">
		<strong>위시리스트가 비어있습니다.</strong>
	</c:if>
	
</c:if>

