<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my_reserv_list</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/mypage.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/common_nav.css">
<script>
//빠른 리모컨 위치 이동
$(document).ready(function(){
	$('#filepath').on('change', function() {
		var str = $('#filepath').val();
		//이미지 첨부파일인지 체크
		var patt = /(.jpg$|.gif$|.png$|.JPG$|.GIF$|.PNG$)/g;
		var result = str.match(patt);

		if (!result) {
			alert('jpg, gif, png만 가능합니다.');
			$('#filepath').val('');
			return false;
		}
		// 파일 첨부 사이즈 체크
		console.log(this.files + ", " + this.files[0]);
		//if (this.files && this.files[0]) {
			console.log('size:' + this.files[0].size);
			if(this.files[0].size>1000000000){
				alert('1GB바이트 이하만 첨부할 수 있습니다.');
				$('#filepath').val('');
				return false;
			}
		//}
		
		// 파일을 읽기 위한 FileReader 객체 생성
		var reader = new FileReader();
		
		//File내용을 일거 dataURL형식의 문자열로 저장
		reader.readAsDataURL(this.files[0]);
		
		// 파일읽어들이기를  성공했을때 호출되는 이벤트 핸들러
		reader.onload = function(e){
			//이미지 tag의 src속성에 읽어들인 file내용을 지정
			$('img').attr('src', e.target.result);
		}
		
	});
	
	  $("a").on('click', function(event) {
	    if (this.hash !== "") {
	      event.preventDefault();
	      var hash = this.hash;
	      $('html, body').animate({
	        scrollTop: $(hash).offset().top
	      }, 500, function(){
	        window.location.hash = hash;
	      });
	    } 
	  });
	  $('#btn1').on('click',function(){
		  swal({
			  title: "예약취소!",
			  text: "예약취소 신청이 완료되며 승인을 기다리셔야합니다!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
					$.ajax({
						url : "/semiproject/rec/recancel",
						dataType : "text",
						type:'post',
						data:"code="+$(this).prev().prev().val(),
						success : function(data) {
							  swal("예약취소 신청되었습니다", {
							      icon: "success",
						})
					
				  
						}
			    })
			  } else {
			    swal("취소되었습니다");
			  }
			});
		})
		$('#re_textlist > a > button').click(function(){
		
		$('body > div.my_container > div > div.w3-col.m7 > div:nth-child(2)').css({
			'display':'block'
		});
		var temp = $(this).parent().parent().next().children().children().next().text().split(":");
		var title = temp[0];
		var options = temp[1];
		console.log(title);
		console.log(options);
		$('#title').val(title);
		$('#options').val(options);
	})
	});
	


</script>


</head>

<body>
	<!-- common_nav -->
	<jsp:include page="/fragment/common_nav.jsp"></jsp:include>

	<!--마이페이지 내용 컨테이너-->
	<div class="my_container">
		<!-- The Grid -->
		<div class="w3-row 1">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- 왼쪽 상단 프로필 -->
				<div class="w3-card w3-round w3-white">
					<div class="w3-container">
						<p class="w3-center">
							<img src="/semiproject/image/mypage/my.jpg" class="w3-circle"
								alt="Avatar">
						</p>
						<h4 class="w3-center">회원아이디</h4>
						<p class="w3-center w3-text-theme">
							<a href="/semiproject/user/selectAccount">계정관리</a>
						</p>
					</div>
				</div>
				<br>

				<!--왼쪽 안내바 -->
				<div class="w3-white">
					<a href="/semiproject/user/selectAccount" id="account_settings">
						<button class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-home fa-fw w3-margin-right "></i>계정 설정
						</button>
					</a> <a href="/semiproject/user/ReserveList" id="reservation_History">
						<button class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>예약내역
						</button>
					</a> <a href="/semiproject/reviews/reviewList.do" id="Reservation">
						<button class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-users fa-fw w3-margin-right"></i>예약후기
						</button>
					</a>
					<div id="Demo3" class="w3-hide w3-container">
						<div class="w3-row-padding"></div>
					</div>

				</div>
				<br>

				<!-- 왼쪽 하단 광고창 -->
				<div
					class="w3-container w3-display-container w3-round  w3-border w3-margin-bottom w3-hide-small"
					style="background: url(image/mypage/event.PNG) 30%">
					<span onclick="this.parentElement.style.display='none'"
						class="w3-button w3-display-topright"> <i
						class="fa fa-remove"></i>
					</span>
					<p>
						<strong>WE-GO</strong>
					</p>
					<p>WE-GO에 오신것을 환영합니다</p>
				</div>

				<!-- End Left Column -->
			</div>

			<!-- Middle Column -->
			<div class="w3-col m7">











				<!-- 예약내역 제목 -->
				<div class="w3-container w3-card w3-white w3-round review_margin">
					<br>
					<h4 style="margin-left: 16px">
						<i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> <strong>예약내역</strong>
					</h4>
					<h7 style="margin-left:16px">| 예약내역 보기 |</h7>

					<hr class="w3-clear">
					<c:forEach items="${requestScope.aList}" var="dto"
						varStatus="status">

						<c:choose>

							<c:when test="${status.index eq 0}">
								<p id="re_textlist">
									예약번호:${dto.merchant_uid}&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="hidden" value="${dto.merchant_uid}" /><a
										href="#re_section"><button type="button"
											class="w3-button w3-theme-d2 w3-margin-bottom">
											<i class="fa fa-comment"></i> 후기작성
										</button></a><input type="button" id="btn1" value="예약취소">
								</p>
							</c:when>

							<c:when
								test="${requestScope.aList[status.index].merchant_uid == requestScope.aList[status.index-1].merchant_uid }"></c:when>

							<c:otherwise>
								<p id="re_textlist">
									예약번호:${dto.merchant_uid}&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="#re_section"><button type="button"
											class="w3-button w3-theme-d2 w3-margin-bottom">
											<i class="fa fa-comment"></i> 후기작성
										</button></a><input type="button" id="btn1" value="예약취소">
								</p>
							</c:otherwise>

						</c:choose>

						<c:choose>
							<c:when test="${dto.rpId eq 0}">
								<c:set value="결제완료" var="rpids" />
							</c:when>
							<c:when test="${dto.rpId eq 1}">
								<c:set value="취소신청" var="rpids" />
							</c:when>
							<c:otherwise>
								<c:set value="환불완료" var="rpids" />
							</c:otherwise>
						</c:choose>
						<!-- 여행 후기 및 이벤트성 멘트 1 -->
						<div class="review_form">
							<span><img src="/semiproject/pro_image/${dto.imagePath}"
								id="re_photo"> 상품명:<span>${dto.title}</span>&nbsp;옵션명<span>:${dto.options}</span></span>
							<p id="re_textyy">
								결제금액: ${dto.price}원[선택 일자 : ${dto.day}]<i>${rpids}</i>
							</p>
						</div>
						<hr class="w3-clear">
					</c:forEach>


				</div>
				<div class="w3-container w3-card w3-white w3-round review_margin">
					<div class="w3-container w3-padding">
						<h6 class="w3-opacity">| 여행후기 작성 |</h6>
						<!--  여행 후기 서버로 보내는 폼 -->
						<form name="registerFrm" action="/semiproject/reviews/insert.do"
							enctype="multipart/form-data" method="post">
							<h6 class="w3-opacity">
								상품명 : <input type="text" name="title" id="title" value="제목들어가야함"
									style="width: 100%;" readonly />
							</h6>
							<h6 class="w3-opacity">
								옵션 : <input type="text" name="options" id="options"
									value="옵션들어가야함" style="width: 100%;" readonly />
							</h6>
							<textarea cols="72" name="reviewtext" placeholder="여행후기를 작성하세요."
								class="w3-border w3-padding" style="width: 100%; height: 100px"></textarea>
							<select name="star">
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5">5점</option>
							</select> <br /> <br />
							<h6 class="w3-opacity">| 사진파일(다중 선택가능) :</h6>
							<input type="file" name="filepath" id="filepath"
								multiple="multiple" />
							</td>
							<td><img src="" style="width: 200px; height: 100px;" /></td> <input
								type="submit" value="글쓰기" class="w3-button w3-theme"
								style="margin-left: 90%">
						</form>
					</div>
				</div>
				<!-- go-post 누르면 작성폼으로 이동하는 구역 -->
				<div class="main" id="re_section">
					<section></section>
				</div>


			</div>

			<!-- End Middle Column -->
		</div>

		<!-- End Page Container -->
	</div>
	<br>

	<!-- Footer -->
	<jsp:include page="/fragment/footer.jsp"></jsp:include>

	<script src="/semiproject/js/mypage.js"></script>
</body>
</html>