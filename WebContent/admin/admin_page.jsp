<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 입니다.</title>
<link rel="stylesheet" type="text/css" href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_page.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script type="text/javascript">

$(document).ready(function() {
	$(".accordion > li").hover(
	    function(){
	      var $this = $(this);
	      $this.stop().animate({"width": "480px"},500);
	      $('.heading', $this).stop(true,true).fadeOut();
	      $('.bgDescription', $this).stop(true,true).slideDown(500);
	      $('.description',$this).stop(true,true).fadeIn();
	    },
	    function(){
	      var $this = $(this);
	      $this.stop().animate({"width": "115px"},1000);
	      $('.heading', $this).stop(true,true).fadeIn();
	      $('.bgDescription', $this).stop(true,true).slideUp(500);
	      $('.description',$this).stop(true,true).fadeOut();
	    }
	)

});
</script>
</head>
<body>
<jsp:include page="/fragment/common_nav.jsp"></jsp:include>
<div id="blank_top">
</div>
<div class="list-group">
	<span href="#" class="list-group-item">
       	메 뉴
   	</span>
    <a href="/semiproject/semi/admin" class="list-group-item">
    	<i class="fa fa-comment-o"></i> 관리자페이지
    </a>
    <a href="/semiproject/semi/admin/admin_info" class="list list-group-item">
    	<i class="fa fa-address-book"></i> 관리자정보
    </a>
    <a href="/semiproject/semi/admin/log" class="list list-group-item">
    	<i class="fa fa-search"></i> 관리자 로그
    </a>
    <a href="/semiproject/semi/admin/reserve" class="list list-group-item" id="admin_reserve">
    	<i class="fa fa-user"></i> 예약 관리
    </a>
    <a href="/semiproject/semi/admin/product" class="list list-group-item">
        <i class="fa fa-folder-open-o"></i> 상품 관리
    </a>
    <a href="/semiproject/semi/admin/notice" class="list list-group-item">
        <i class="fa fa-bar-chart-o"></i> 공지사항 
    </a>
    <a href="/semiproject/semi/admin/city" class="list list-group-item">
        <i class="fa fa-database" aria-hidden="true"></i> 도시정보등록
    </a>
</div>

<div class="main">
	<div style="margin-top:4%; height: 10%">
		<h2 style="text-align: center; margin-right: 20%;">관리자 페이지</h2>
	</div>
	<div style="width: 70%; margin-top:1%; margin-left:20%;" onclick="location.href='/semiproject/semi/admin/admin_info'">
	<ul class="accordion" id="accordion">
	  <li class="bg1">
	    <div class="heading">관리자정보</div>
	    <div class="bgDescription"></div>
	    <div class="description">
	      <a href="/semiproject/semi/admin/admin_info"><h2>관리자정보 </h2></a>
	      <p>관리자의 정보들을 담습니다. </p>
		</div>
	  </li>
	</ul>
	 
	<ul class="accordion" id="accordion" onclick="location.href='/semiproject/semi/admin/reserve'">
	  <li class="bg2">
	    <div class="heading">예약관리</div>
	    <div class="bgDescription"></div>
	    <div class="description">
	      <a href="/semiproject/semi/admin/reserve"><h2>예약관리 </h2></a>
	      <p>예약자의 정보들을 수정하고 확인할 수 있습니다</p>
		</div>
	  </li>
	</ul>
 

	<ul class="accordion" id="accordion" onclick="location.href='/semiproject/semi/admin/product'">
	  <li class="bg3">
	    <div class="heading">상품관리</div>
	    <div class="bgDescription"></div>
	    <div class="description">
	      <a href="/semiproject/semi/admin/product"><h2>상품관리</h2></a>
	      <p>상품을 추가하고 관리할 수 있습니다</p>
		</div>
	  </li>
	</ul>	 

	<ul class="accordion" id="accordion" onclick="location.href='/semiproject/semi/admin/notice'">
	  <li class="bg4">
	    <div class="heading">공지사항 </div>
	    <div class="bgDescription"></div>
	    <div class="description">
	      <a href="/semiproject/semi/admin/notice"><h2>공지사항</h2></a>
	      <p>공지사항을 관리할 수 있습니다.</p>
		</div>
	  </li>
	</ul>

	<ul class="accordion" id="accordion" onclick="location.href='/semiproject/semi/admin/city'">
	  <li class="bg5">
	    <div class="heading">도시정보등록 </div>
	    <div class="bgDescription"></div>
	    <div class="description">
	      <a href="/semiproject/semi/admin/city"><h2>도시정보등록</h2></a>
	      <p>도시정보를 등록 할 수 있습니다</p>
		</div>
	  </li>
	</ul>
	
	</div>
</div>  



<jsp:include page="/fragment/footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/semiproject/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="/semiproject/js/admin_page.js"></script>
</body>
</html>