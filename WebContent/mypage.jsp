<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" type="text/css" href="/semiproject/css/mypage.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/common_nav.css">
<script>
//빠른 리모컨 위치 이동
$(document).ready(function(){
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
	});

</script>


</head>

<body >
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
         <p class="w3-center"><img src="image/mypage/my.jpg" class="w3-circle" alt="Avatar"></p>
         <h4 class="w3-center">회원아이디</h4>
         <p class="w3-center w3-text-theme"><a href="#">계정관리</a></p>
        </div>
      </div>
      <br>
      
      <!--왼쪽 안내바 -->
        <div class="w3-white">
          <a href="#">
          <button  class="w3-button w3-block w3-theme-l1 w3-left-align">
          <i class="fa fa-home fa-fw w3-margin-right "></i>계정 설정</button>
          </a>
  
          <a href="#">
          <button  class="w3-button w3-block w3-theme-l1 w3-left-align">
          <i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>예약내역</button>
		  </a>
		  
		  <a href="#">
          <button  class="w3-button w3-block w3-theme-l1 w3-left-align">
          <i class="fa fa-users fa-fw w3-margin-right"></i>예약후기</button>
          </a>
          <div id="Demo3" class="w3-hide w3-container">
          <div class="w3-row-padding">
         
         </div>
          </div>
            
      </div>
      <br>
       
      <!-- 왼쪽 하단 광고창 -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">

	<!-- 여행 후기 제목 -->
      <div class="w3-container w3-card w3-white w3-round review_margin"><br>
        <h4 style="margin-left:16px"><i class="fa fa-users fa-fw w3-margin-right"></i>
        <strong>여행후기</strong></h4>
        <h7 style="margin-left:16px">| 전체후기 |</h7>
   
        <hr class="w3-clear">
        <ul>
        <li>여행후기를 작성하고, 다음 여행 시 사용 가능한 포인트를 적립하세요.</li>
        <li>동일 상품에 대한 후기 포인트는 한달에 한번만 적립 가능합니다.</li>
        </ul>
    <!-- 여행 후기 및 이벤트성 멘트 1 -->
        <div class="review_form">
        <span><img src="image/mypage/review_ph.PNG" id="re_photo">
                상품명이 들어가요 ~[사용일자 : 2019년 7월 7일]</span>
        <p id="re_text">여행후기와 사진을 등록하시면 좋은일이 일어날거에요^^</p>
       
        <a href="#re_section"><button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i> go-post </button></a> 
     	</div>
    <!-- 여행 후기 및 이벤트성 멘트 2 -->
     	 <div class="review_form">
        <span><img src="image/mypage/review_ph.PNG" id="re_photo">
                상품명이 들어가요 ~[사용일자 : 2019년 7월 7일]</span>
        <p id="re_text">여행후기와 사진을 등록하시면 좋은일이 일어날거에요^^</p>
        
       <a href="#re_section"><button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i> go-post </button></a>
     	</div>
      </div> 
      
      <!-- 여행 후기 작성폼 -->
          <div class="w3-container w3-card w3-white w3-round review_margin">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">| 여행후기 작성 |</h6>
              <p contenteditable="true" class="w3-border w3-padding">여행후기를 작성하세요</p>
              <button type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i>  Post</button> 
            </div>
           </div>
       <!-- go-post 누르면 작성폼으로 이동하는 구역 -->
           <div class="main" id="re_section">
  	          <section ></section>
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