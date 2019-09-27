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
<%String email=(String)request.getParameter("email"); %>
<script type="text/javascript">
$(document).ready(function() {
    var id='<%=email%>'
	$('#email').val(id);
    
    $('#change').on('click',function()
    		{
    	if($('#pwd').val()!=$('#pwd').val())
    		{
    		swal ( "Fail" ,  "비밀번호가 다릅니다" ,  "error" )
    		}
    	else
    		{
    		    document.pwdForm.submit();
    		}
    	
    	
    		})
    
})

</script>
</head>

<body>
<jsp:include page="/fragment/common_nav.jsp" flush="true"></jsp:include>

<div id="empty_box">
	<form class="box" action="/semiproject/user/UpdatePwd" name="pwdForm">
		<h1>비밀번호 변경</h1>
		<input type="text" id="email" name="email" readonly/>		
		<input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요">
		<input type="password" id="pwd1" name="pwd1" placeholder="비밀번호를 한번더입력해주세요">
		<input type="button" value="변경하기" id="change"/>
     


	</form>
</div>
<jsp:include page="/fragment/footer.jsp" flush="true"></jsp:include>
</body>
</html>