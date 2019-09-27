<%@page import="semi.model.dto.ReviewDTO"%>
<%@ page import="semi.model.dao.ReviewDAO"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/mypage_review.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/common_nav.css">
<script>
	//빠른 리모컨 위치 이동
	$(document).ready(function() {
		$("a").on('click', function(event) {
			if (this.hash !== "") {
				event.preventDefault();
				var hash = this.hash;
				$('html, body').animate({
					scrollTop : $(hash).offset().top
				}, 500, function() {
					window.location.hash = hash;
				});
			}
		});
		

		
		
	});
</script>
<script type="text/javascript">

function showtext(data){
	
	//수정 버튼클릭시  글 키값날림
	console.log(data + " asdasdsadsa");
	 alert('수정하시겠습니까?');
	var dpon = document.getElementById(data); 
	
 	//수정입력창  class 모두 가져옴
	var alldp = document.getElementsByClassName('btn_word');
	
 	console.log(dpon + "  asdasd");
 	//수정버튼클릭한 수정창이 닫혀있으면,
	if (dpon.style.display == "none") {
	   for (var i = 0; i < alldp.length; i++) {
	      alldp[i].style.display="none";
	   }
	   dpon.style.display="block";
	}
	else {
		console.log("else ");
		dpon.style.display="none";
	};
}


	//텍스트 에어리어 
function updateIn(key){
		
	var txtval = document.getElementsByClassName('txtarea');
	var aa = "";
	for (var i = 0; i < txtval.length; i++) {
		if (txtval[i].value != null || txtval[i].value != "") {	
			var aa = txtval[i].value;
			console.log(aa + "  빈값아닌걸 가져옵니다");
			window.location.href="reviewUpdate.do?key="+key+"&contents="+aa;
		    break;
		}
		
	}
	 
}

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
         <p class="w3-center"><img src="/semiproject/image/mypage/my.jpg" class="w3-circle" alt="Avatar"></p>
         <h4 class="w3-center">회원아이디</h4>
         <p class="w3-center w3-text-theme"><a href="/semiproject/user/selectAccount">계정관리</a></p>
        </div>
      </div>
      <br>
      
      <!--왼쪽 안내바 -->
        <div class="w3-white">
          <a href="/semiproject/user/selectAccount" id="account_settings">
          <button  class="w3-button w3-block w3-theme-l1 w3-left-align">
          <i class="fa fa-home fa-fw w3-margin-right "></i>계정 설정</button>
          </a>
  
          <a href="/semiproject/user/ReserveList" id="reservation_History">
          <button  class="w3-button w3-block w3-theme-l1 w3-left-align">
          <i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>예약내역</button>
		  </a>
		  
		  <a href="/semiproject/reviews/reviewList.do" id="Reservation">
          <button  class="w3-button w3-block w3-theme-l1 w3-left-align">
          <i class="fa fa-users fa-fw w3-margin-right"></i>예약후기</button>
          </a>
          <div id="Demo3" class="w3-hide w3-container">
          <div class="w3-row-padding">
         
         </div>
          </div>
            
      </div>				<br>

				<!-- 왼쪽 하단 광고창 -->
				<div
					class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
					<span onclick="this.parentElement.style.display='none'"
						class="w3-button w3-theme-l3 w3-display-topright"> <i
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

				<!-- 여행 후기 제목 -->
				<div class="w3-container w3-card w3-white w3-round review_margin">
					<br>
					<h4 style="margin-left: 16px">
						<i class="fa fa-users fa-fw w3-margin-right"></i> <strong>여행후기</strong>
					</h4>
					<h7 style="margin-left:16px">| 전체후기 |</h7>
					<br/>
					<!--작성한 글 뿌려주기   -->

					

					<hr class="w3-clear">
					<ul>
						<li>여행후기를 작성하고, 다음 여행 시 사용 가능한 포인트를 적립하세요.</li>
						<li>동일 상품에 대한 후기 포인트는 한달에 한번만 적립 가능합니다.</li>
					</ul>
					<!-- 여행 후기 및 이벤트성 멘트 1 -->
					<c:forEach items="${requestScope.aList}" var="dto">
					<div class="review_form">
						<c:forEach items="${dto.path}" var="image">
						<span><img src="/semiproject/review_image/${image}" id="re_photo"></span>
						</c:forEach>
						<br />
						<br />
							<p>
							${dto.title} ~[사용일자 : ${dto.date}]
							<c:forEach begin="1" end="${dto.star}" step="1">
								<i class="fa fa-star" style="color: orange"></i>
							</c:forEach>
							<p>
						<p id="re_text">${dto.content}</p>

					
					</div>
					<br />
					<br />
					</c:forEach>
				</div>

				<!-- 여행 후기 작성폼 -->
				<%--   
      <%
      		String directory = application.getRealPath("/upload/");  //업로드 폴더
      		int maxSize= 1024* 1024 * 100; //사진 크기
      		String encoding = "UTF-8";
      		
      		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, 
      				new DefaultFileRenamePolicy());
      		
      		String imagePath= multipartRequest.getOriginalFileName("save");
      		String imagePath2 = multipartRequest.getOriginalFileName("save1");
      		String imagePath3 = multipartRequest.getOriginalFileName("save2");
      		String imagePath4 = multipartRequest.getOriginalFileName("save3");
      		
      		
      %> 
      
      
      --%>
      
      
      				<!-- End Middle Column -->
		</div>

		<!-- End Page Container -->
	</div>
	<br>

	<!-- Footer -->
	<jsp:include page="/fragment/footer.jsp"></jsp:include>

	<script src="/semiproject/js/mypage_review.js"></script>
</body>
</html>