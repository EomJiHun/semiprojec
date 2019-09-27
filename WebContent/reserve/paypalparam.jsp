<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@page import="java.net.URLEncoder" %>
<%
String imp_uid=request.getParameter("imp_uid");
String merchant_uid=request.getParameter("merchant_uid");
String imp_success=request.getParameter("imp_success");
String imp_uid1=URLEncoder.encode(imp_uid, "UTF-8");

%>
<script type="text/javascript">
$(document).ready(function(){
	
	var imp_uid="<%=imp_uid1%>"
	var merchant_uid="<%=merchant_uid%>"
	
	
	$.ajax({
		type:'GET',
		dataType:'text',
		url:"../paypal.do?imp_uid="+imp_uid+"&merchant_uid="+merchant_uid,
		success:function process(res)
	{
			var obj = JSON.parse(res);
			
		 window.opener.location.href="<%=request.getContextPath()%>/reserve/reserveOk.jsp?email="+obj.email+"&amount="+obj.amount+"&name="+obj.name+"&merchant_uid="+obj.merchant_uid;
    		 window.close(); 
		
	}
	});
	
	
	
})


</script>
</head>
<body>

</body>
</html>