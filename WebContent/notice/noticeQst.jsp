<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semiproject/css/noticsQst.css">
<link rel="stylesheet" type="text/css" href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/semiproject/js/noticsQst.js"></script>
</head>
<body>
<div class="qst_list text-center" id="qst_list">
<br>
<h4>${sessionScope.category}</h4>
<ul id="menu" class="menu expandfirst">
		<c:forEach items="${sessionScope.notice}" var="notice">
		<li><a href="#" style="color : #000000">${notice.title}</a>
		<br>
			<ul>
				<li>
					<div class="container" id="qs">
						<br>
						<p style= "margin-left: 200px; width: 650px;" >${notice.content}</p>
					</div>
				</li>
			</ul>
		</li>
		<hr/>
		</c:forEach>
	</ul>
</div>
</body>
</html>	
<% 
session.removeAttribute("notice");
session.removeAttribute("category");
%>