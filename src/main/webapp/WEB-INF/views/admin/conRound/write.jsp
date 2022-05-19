<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admlayout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})

	
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"))
		
		$("form").submit();
	})
})
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

<div id="layoutSidenav_content">
	<main>

	<!-- Concert -->
		<div class="container-fluid px-4">
			<h1 class="mt-4">공연 관리</h1>
			
			<ol class="breadcrumb mb-4">
			    <li class="breadcrumb-item active">Concert Management</li>
			</ol>

			<div class="card mb-4">
			    <div class="card-header">
			        <i class="fas fa-table me-1"></i>공연 글쓰기
			    </div>
		
				<!-- 목록 -->
				<div class="card-body">
		
					<form action="/admin/concert/write" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="conAdminId">작성자</label>
						<input type="text" id="conAdminId" name="adminId" value="${id}" class="form-control" readonly="readonly">
					</div>
					<br>
					<div class="form-group">
						<label for="conTitle">제목</label>
						<input type="text" id="conTitle" name="conTitle" class="form-control">
					</div>
					<br>
					<div class="form-group">
						<label for="fileConImg">공연이미지</label>
						<input type="file" id="fileConImg" name="fileConImg">
					</div>
					<br>
					<div class="form-group">
						<label for="fileConSeatImg">배치도</label>
						<input type="file" id="fileConSeatImg" name="fileConSeatImg">
					</div>
					<br>
					<div class="form-group">
						<label for="content">본문</label>
						<textarea rows="10" style="width: 100%;" id="content" name="conContent"></textarea>
					</div>
					<br>
					<div class="form-group">
						<label for="conAddress">위치</label>
						<input type="text" id="conAddress" name="conAddress" class="form-control" value="서울 종로구 세종대로 175">
					</div>
					<br>
					<div class="form-group">
						<label for="conStartDayString">공연 시작일</label>
						<input type="date" id="conStartDayString" name="conStartDayString" class="form-control" value="2022-05-16">
					</div>
					<br>
					<div class="form-group">
						<label for="conEndDayString">공연 종료일</label>
						<input type="date" id="conEndDayString" name="conEndDayString" class="form-control" value="2022-05-31">
					</div>
					<br>
					<div class="form-group">
						<label for="conReserveStartdayVIPString">VIP예약시작일</label>
						<input type="date" id="conReserveStartdayVIPString" name="conReserveStartdayVIPString" class="form-control" value="2022-05-16">
					</div>
					<br>
					<div class="form-group">
						<label for="conReserveStartDayString">예약시작일</label>
						<input type="date" id="conReserveStartDayString" name="conReserveStartDayString" class="form-control" value="2022-05-20">
					</div>
					<br>
					<div class="form-group">
						<label for="conReserveEndDayString">예약종료일</label>
						<input type="date" id="conReserveEndDayString" name="conReserveEndDayString" class="form-control" value="2022-05-31">
					</div>
					<br>
					
					<div class="text-center">
						<button class="btn btn-primary" id="btnWrite">작성</button>
						<input type="reset" id="cancel" class="btn btn-danger" value="취소">
					</div>
					</form>

					<div id="roundDiv" class="form-group">
					</div>
					<br>
					
					<div class="text-center">
						<a href="#this" id="addRound" class="btn btn-primary">회차 추가하기</a>
						<button class="btn btn-primary" id="btnWrite">작성</button>
						<input type="reset" id="cancel" class="btn btn-danger" value="취소">
					</div>

					<script type="text/javascript">
				        var r_count = 0;
				        
				        $(document).ready(function(){
				            
				            $("#addRound").on("click",function(e){
				            	++r_count;
				                console.log("add : "+r_count)
				            	
				            	e.preventDefault();
				                r_Add();
				            })
			            
   				            $("a[name='roundDelete_"4"']").on("click",function(e){
				                e.preventDefault();
				                r_Delete(".roundDelete_"4
				            })
				            
				        });

				        function r_Delete(obj){
				        	--r_count;
				            console.log("del : "+r_count)
// 				            console.log("obj : "+obj)
				        	
				            $('div').remove(obj);
				        }
				        
				        function r_Add(){
				            var str = 	
				            	"<div class='roundDelete_"+(r_count)+"'>" + 
									"<label for='conRound_"+(r_count)+"'>"+(r_count)+"회차 </label>" +
									"<a href='#this' name='roundDelete_"+(r_count)+"' class='btn btn-primary'>삭제하기</a> " +
									"<input type='number' id='conRound_"+(r_count)+"' name='conRound_"+(r_count)+"' class='form-control' value='"+(r_count)+"'>" +
									"<br>" +
									"<label for='conRoundStartTime_"+(r_count)+"'>시작 시간</label>" +
									"<input type='time' id='conRoundStartTime_"+(r_count)+"' name='conRoundStartTime_"+(r_count)+"' class='form-control' >" +
									"<br>" +
									"<label for='conRoundEndTime_"+(r_count)+"'>종료 시간</label>" + 
									"<input type='time' id='conRoundEndTime_"+(r_count)+"' name='conRoundEndTime_"+(r_count)+"' class='form-control' >" + 
								"</div>";
				            $("#roundDiv").append(str);
				            
   				            $("a[name='roundDelete_"+(r_count)+"']").on("click",function(e){
				                e.preventDefault();
				                r_Delete(".roundDelete_"+(r_count));
				            })				            

				        }
				    </script>


				    <script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors
						, elPlaceHolder: "content"
						, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
						, fCreator: "createSEditor2"
					})
					</script>
					
				</div>
			</div>
		</div>

	</main>
</div><!-- layoutSidenav_content -->

<c:import url="/WEB-INF/views/admlayout/footer.jsp" />