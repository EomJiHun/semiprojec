<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="/semiproject/js/find.js"></script>
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
		<h1>아이디 찾기</h1>
		<input type="text" name="phone" placeholder="Phone" id="phone">
		<div id="result"></div> 
		<input type="button" value="find" id="findId"/>


	</form>
</div>
<jsp:include page="/fragment/footer.jsp" flush="true"></jsp:include>
</body>
</html>