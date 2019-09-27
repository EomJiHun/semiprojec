<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="/semiproject/js/login.js"></script>
 <link href="/semiproject/css/login.css" rel="stylesheet" type="text/css">
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
	<form class="box">
		<h1>Login</h1>
		<input type="email" name="email" placeholder="Email" id="email"> <input
			type="password" name="pwd" placeholder="password" id="pwd">
        <div id="captcha-wrap">
		<div id="div01"></div>
		<input type="hidden" id="key" name="key">
		 <input type="text"
			name="value" id="captcha" placeholder="입력해주세요">
		<input type="button" id="btn01" value="새로고침"/>
         </div>

		<input type="button" value="Login" id="login"/>


		<div class="bottom-text">
			아직 회원이아니신가요? <a href="#">회원가입</a>
		</div>
		<div class="bottom-text"><a href="/semiproject/users/findId.jsp">아이디찾기</a>  | <a href="/semiproject/users/findPwd.jsp">비밀번호 찾기</a></div>
	</form>
</div>
<jsp:include page="/fragment/footer.jsp" flush="true"></jsp:include>
</body>
</html>