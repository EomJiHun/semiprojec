<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 입니다.</title>
<link rel="stylesheet" type="text/css" href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_page.css">
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
    	<i class="fa fa-address-book"></i></i> 관리자정보
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
        <i class="fa fa-quora"></i> 공지사항 
    </a>
    <a href="/semiproject/semi/admin/city" class="list list-group-item">
        <i class="fa fa-database" aria-hidden="true"></i> 도시정보등록
    </a>
</div>

<div class="main">
	<div id="panel_wrap">
		<div class="panel panel-primary">
	  		<div class="panel-heading">
	    		<h3 class="panel-title">2019년 매출</h3>
	  		</div>
	  		<div class="panel-body">
	    		<div class="panel-con">200,000</div>
	    		<div style="float: left;">
	    			<i class="fa fa-bar-chart" style="font-size: 40px;"></i>
	    		</div>
	  		</div>
		</div>
		<div class="panel panel-info">
	  		<div class="panel-heading">
	    		<h3 class="panel-title">이번달 매출</h3>
	  		</div>
	  		<div class="panel-body">
	    		<div class="panel-con">200,000</div>
	    		<div style="float: left;">
	    			<i class="fa fa-krw" style="font-size: 40px;"></i>
	    		</div>
	  		</div>
		</div>
		<div class="panel panel-warning">
	  		<div class="panel-heading">
	    		<h3 class="panel-title">오늘의 방문자수</h3>
	  		</div>
	  		<div class="panel-body">
	    		<div class="panel-con">30</div>
	    		<div style="float: left;">
	    			<i class="fa fa-user" style="font-size: 40px;"></i>
	    		</div>
	  		</div>
		</div>
	</div>
	<div id="chart_wrap">
		<div id="chart_div"></div>
	</div>
</div>  



<jsp:include page="/fragment/footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/semiproject/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="/semiproject/js/admin_page.js"></script>
</body>
</html>