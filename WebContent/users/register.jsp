<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
	<script src="sweetalert2.all.min.js"></script>
	 <!-- alert창 script  -->
<script type="text/javascript" src="/semiproject/js/register.js"></script>
 <link href="/semiproject/css/register.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="/semiproject/css/bootstrap.min.css">
<script type="text/javascript" src="/semiproject/js/bootstrap.min.js"></script>
 <style type="text/css">
 body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background-image: url("/semiproject/image/background.jpg");
	background-repeat: no-repeat;
	background-size: 100% 100vh;
}
 </style>
</head>

<body>
<jsp:include page="/fragment/common_nav.jsp" flush="true"></jsp:include>
<div id="empty_box">
	<form class="box" action="/semiproject/user/register" id="regiseter" name="register" method="post">
		<h1>Sign Up</h1>
		<input type="email" name="email" placeholder="Email" required="required" id="email"> <input
			type="password" id="pwd" name="pwd" placeholder="password" required="required">
			<input
			type="password" id="pwd1" name="pwd" placeholder="password confirm" required="required">
        <div id="captcha-wrap">
		<div id="div01"></div>
		<input type="hidden" id="key" name="key">
		 <input type="text"
			name="value" id="captcha" placeholder="위에 사진 입력" required="required">
		<input type="button" id="btn01" value="Refresh"/>
         </div>

		<input type="button" value="Create an account" id="register"/>
	</form>
</div>
<jsp:include page="/fragment/footer.jsp" flush="true"></jsp:include>
</body>
</html>