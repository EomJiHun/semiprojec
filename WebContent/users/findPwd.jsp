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
<script type="text/javascript">
$(document).ready(function() {
	
$('#confirm').on('click',function(){

	$.ajax({
        url : "/semiproject/users/uuid.jsp",
        type:"GET",
        dataType:"text",
        success:function process(res)
	{
        	console.log(res);
        	var result=$.trim(res);
        	if($('#number').val()==result)
    		{
        		swal("Good job!", "비밀번호 변경창으로 이동합니다!", "success").then(function(){
        			/* session.setAttribute("email", $('#email').val()); */
        			 location.href="/semiproject/users/pwdchangeform.jsp?email="+$('#email').val();
				});
    		
    		}
    	else if($('#number').val()=="")
    		{
    		swal ( "Fail" ,  "인증번호를 입력해주세요!" ,  "error" );
    		}
    	else
    		{
    		swal ( "Fail" ,  "인증번호가 틀렸습니다!" ,  "error" )
    		}
	}
	
	
	
})
})
})
</script>
</head>

<body>
<jsp:include page="/fragment/common_nav.jsp" flush="true"></jsp:include>

<div id="empty_box">
	<form class="box">
		<h1>비밀번호 찾기</h1>
		<input type="email" name="email" placeholder="Email" id="email">
		<input type="button" value="인증번호 발송" id="findPwd"/>
		<div id="wrap">
		<input type="text" name="number" placeholder="인증번호 확인" id="number">
		<input type="button" value="확인" id="confirm"/>
		</div>


	</form>
</div>
<jsp:include page="/fragment/footer.jsp" flush="true"></jsp:include>
</body>
</html>