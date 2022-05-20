<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/loginHeader.jsp" />

<!-- Slider -->
<section class="section-slide">
	<div class="wrap-slick1">
		<div class="slick1">
			<div class="item-slick1" style="background-image: url(../../resources/images/banner_02.png);">
				<div class="container h-full">
					<div class="flex-col-m flex-c-m h-full p-t-100 p-b-30 respon5">
						
						<div class="layer-slick1">
							<h2 class="ltext-201 cl13 p-t-19 p-b-43 respon1 bor12">
								Skip Id
							</h2>
						</div>
						
						<c:if test="${userId ne null}">
							<div class="layer-slick1">
								<h2 class="ltext-201 cl13 p-t-19 p-b-43 respon1" style="font-size: 36px; text-transform: none;">
									${userId}
								</h2>
							</div>
						</c:if>
						
						<c:if test="${empty userId}">
							<div class="layer-slick1">
								<h2 class="ltext-201 cl13 p-t-19 p-b-43 respon1" style="font-size: 36px; text-transform: none;">
									Account does not exist.
								</h2>
							</div>
						</c:if>	
					</div>
				</div>
			</div>
		</div>
	</div>
</section> <!-- Slider End -->
<c:import url="/WEB-INF/views/layout/loginFooter.jsp" />