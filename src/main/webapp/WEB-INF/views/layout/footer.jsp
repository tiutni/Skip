<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!-- 플로팅 버튼 CSS 스타일 -->
<style>
/* 실시간 문의하기 버튼 스타일 */
.qnaBtn {
  position: fixed;
  top: 85%; /* 브라우저 윗쪽 끝에서부터의 거리 */
  right: 50%; /* 왼쪽에 배치하려면 right를 left로 변경 */
  margin-right: -48%; /* 가운데를 기준으로 오른쪽 거리 */
  z-index: 99;
}
</style>

	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Categories
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#tickets" class="stext-107 cl7 hov-cl1 trans-04">
								Concert
							</a>
						</li>

						<li class="p-b-10">
							<a href="#tickets" class="stext-107 cl7 hov-cl1 trans-04">
								Exhibition
							</a>
						</li>

					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Help
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="/noti/list" class="stext-107 cl7 hov-cl1 trans-04">
								Notice
							</a>
						</li>

						<li class="p-b-10">
							<a href="/qna/list" class="stext-107 cl7 hov-cl1 trans-04">
								QnA
							</a>
						</li>

						<li class="p-b-10">
							<a href="/faq/list" class="stext-107 cl7 hov-cl1 trans-04">
								FAQ
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						GET IN TOUCH
					</h4>

					<p class="stext-107 cl7 size-201">
						Any questions? Let us know in store at 6 Teheran-ro 14-gil, Gangnam-gu, Seoul, Republic of Korea 06234 or call us on 010 1234 5678
					</p>

					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-pinterest-p"></i>
						</a>
					</div>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Newsletter
					</h4>

					<form>
						<div class="wrap-input1 w-full p-b-4">
							<input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com">
							<div class="focus-input1 trans-04"></div>
						</div>

						<div class="p-t-18">
							<button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
								Subscribe
							</button>
						</div>
					</form>
				</div>
			</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1">
						<img src="../../resources/images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="../../resources/images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="../../resources/images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="../../resources/images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="../../resources/images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>

				</div>

				<p class="stext-107 cl6 txt-center">
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | SKIP 
					
					<!-- 하트는 관리자 로그인 버튼입니다 -->
					<a href="/admin/login" class="m-all-1">
					<i class="fa fa-heart-o"></i>
					</a>

				</p>
			</div>
		</div>
	</footer>



	<!-- 실시간채팅 버튼 -->
<!-- 	<div class="qnaBtn hidden-md hidden-sm hidden-xs"> -->
<!--   		<a href="http://localhost:8088/chat.do"> -->
<!--     		<img src="../../resources/images/icons/qnaBtn.png" width="76px" height="76px"> -->
<!--  		</a> -->
<!-- 	</div> -->



	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>



	<!-- Modal1 -->
<!-- 	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20"> -->
<!-- 		<div class="overlay-modal1 js-hide-modal1"></div> -->

<!-- 		<div class="container"> -->
<!-- 			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent"> -->
<!-- 				<button class="how-pos3 hov3 trans-04 js-hide-modal1"> -->
<!-- 					<img src="../../resources/images/icons/icon-close.png" alt="CLOSE"> -->
<!-- 				</button> -->

<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-6 col-lg-7 p-b-30"> -->
<!-- 						<div class="p-l-25 p-r-30 p-lr-0-lg"> -->
<!-- 							<div class="wrap-slick3 flex-sb flex-w"> -->
<!-- 								<div class="wrap-slick3-dots"></div> -->
<!-- 								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div> -->

<!-- 								<div class="slick3 gallery-lb"> -->
<!-- 									<div class="item-slick3" data-thumb="../../resources/images/product-detail-01.jpg"> -->
<!-- 										<div class="wrap-pic-w pos-relative"> -->
<!-- 											<img src="../../resources/images/product-detail-01.jpg" alt="IMG-PRODUCT"> -->

<!-- 											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="../../resources/images/product-detail-01.jpg"> -->
<!-- 												<i class="fa fa-expand"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->

<!-- 									<div class="item-slick3" data-thumb="../../resources/images/product-detail-02.jpg"> -->
<!-- 										<div class="wrap-pic-w pos-relative"> -->
<!-- 											<img src="../../resources/images/product-detail-02.jpg" alt="IMG-PRODUCT"> -->

<!-- 											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="../../resources/images/product-detail-02.jpg"> -->
<!-- 												<i class="fa fa-expand"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->

<!-- 									<div class="item-slick3" data-thumb="../../resources/images/product-detail-03.jpg"> -->
<!-- 										<div class="wrap-pic-w pos-relative"> -->
<!-- 											<img src="../../resources/images/product-detail-03.jpg" alt="IMG-PRODUCT"> -->

<!-- 											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="../../resources/images/product-detail-03.jpg"> -->
<!-- 												<i class="fa fa-expand"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
<!-- 					<div class="col-md-6 col-lg-5 p-b-30"> -->
<!-- 						<div class="p-r-50 p-t-5 p-lr-0-lg"> -->
<!-- 							<h4 class="mtext-105 cl2 js-name-detail p-b-14"> -->
<!-- 								Lightweight Jacket -->
<!-- 							</h4> -->

<!-- 							<span class="mtext-106 cl2"> -->
<!-- 								$58.79 -->
<!-- 							</span> -->

<!-- 							<p class="stext-102 cl3 p-t-23"> -->
<!-- 								Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat. -->
<!-- 							</p> -->
							
<!-- 							 -->
<!-- 							<div class="p-t-33"> -->
<!-- 								<div class="flex-w flex-r-m p-b-10"> -->
<!-- 									<div class="size-203 flex-c-m respon6"> -->
<!-- 										Size -->
<!-- 									</div> -->

<!-- 									<div class="size-204 respon6-next"> -->
<!-- 										<div class="rs1-select2 bor8 bg0"> -->
<!-- 											<select class="js-select2" name="time"> -->
<!-- 												<option>Choose an option</option> -->
<!-- 												<option>Size S</option> -->
<!-- 												<option>Size M</option> -->
<!-- 												<option>Size L</option> -->
<!-- 												<option>Size XL</option> -->
<!-- 											</select> -->
<!-- 											<div class="dropDownSelect2"></div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->

<!-- 								<div class="flex-w flex-r-m p-b-10"> -->
<!-- 									<div class="size-203 flex-c-m respon6"> -->
<!-- 										Color -->
<!-- 									</div> -->

<!-- 									<div class="size-204 respon6-next"> -->
<!-- 										<div class="rs1-select2 bor8 bg0"> -->
<!-- 											<select class="js-select2" name="time"> -->
<!-- 												<option>Choose an option</option> -->
<!-- 												<option>Red</option> -->
<!-- 												<option>Blue</option> -->
<!-- 												<option>White</option> -->
<!-- 												<option>Grey</option> -->
<!-- 											</select> -->
<!-- 											<div class="dropDownSelect2"></div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->

<!-- 								<div class="flex-w flex-r-m p-b-10"> -->
<!-- 									<div class="size-204 flex-w flex-m respon6-next"> -->
<!-- 										<div class="wrap-num-product flex-w m-r-20 m-tb-10"> -->
<!-- 											<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m"> -->
<!-- 												<i class="fs-16 zmdi zmdi-minus"></i> -->
<!-- 											</div> -->

<!-- 											<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1"> -->

<!-- 											<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m"> -->
<!-- 												<i class="fs-16 zmdi zmdi-plus"></i> -->
<!-- 											</div> -->
<!-- 										</div> -->

<!-- 										<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"> -->
<!-- 											Add to cart -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 								</div>	 -->
<!-- 							</div> -->

<!-- 							 -->
<!-- 							<div class="flex-w flex-m p-l-100 p-t-40 respon7"> -->
<!-- 								<div class="flex-m bor9 p-r-10 m-r-11"> -->
<!-- 									<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist"> -->
<!-- 										<i class="zmdi zmdi-favorite"></i> -->
<!-- 									</a> -->
<!-- 								</div> -->

<!-- 								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook"> -->
<!-- 									<i class="fa fa-facebook"></i> -->
<!-- 								</a> -->

<!-- 								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter"> -->
<!-- 									<i class="fa fa-twitter"></i> -->
<!-- 								</a> -->

<!-- 								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus"> -->
<!-- 									<i class="fa fa-google-plus"></i> -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!--===============================================================================================-->	
<!-- 	<script src="../../resources/vendor/jquery/jquery-3.2.1.min.js"></script> -->
<!--===============================================================================================-->
	<script src="../../resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/bootstrap/js/popper.js"></script>
	<script src="../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="../../resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/slick/slick.min.js"></script>
	<script src="../../resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="../../resources/js/main.js"></script>

</body>
</html>