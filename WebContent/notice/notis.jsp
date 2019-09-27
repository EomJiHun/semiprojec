<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/semiproject/css/notis.css">
<link rel="stylesheet" type="text/css" href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/semiproject/js/notis.js"></script>


</head>
<body style="background-color:#dcdcdc;">

<jsp:include page="/fragment/common_nav.jsp"></jsp:include>
	<div class="container-fluid text-center" id="notics_body" style="width:100%;">
		<div class="noit-group">	
			<div class="col-sm-2" id="list" style="background-color: White;">
				<li><a href="#" id="qs">자주 묻는 질문  
				<span class="glyphicon glyphicon-chevron-up" id="up" > </span>
				<span class="glyphicon glyphicon-chevron-down" id="down"></span>		
				</a><hr class="hee"/>
					<ul>
						<li><p><a href="/semiproject/question/notice?bid=1" class="list" id="reservation">예약</a></p></li>
						<li><p><a href="/semiproject/question/notice?bid=2" class="list" id="payment">결제</a></p></li>
						<li><p><a href="/semiproject/question/notice?bid=3" class="list" id="refund">변경&amp;환불</a></p></li>
						<li><p><a href="/semiproject/question/notice?bid=4" class="list" id="account">계정</a></p></li>
					</ul>
				</li>
				<br>
				<a href="/semiproject/question/question"
				class="list" id="account"><input type="button" class="btn active" value="문의하기"></a>
			</div>
			<div class="col-sm-6" >
				<div class="noti" id="noti" style="width:700px; background-color:White;"></div>
			</div>
		</div>	
	</div>
<div id="fotter">
<jsp:include page="/fragment/footer.jsp"></jsp:include>
</div>

</body>
</html>