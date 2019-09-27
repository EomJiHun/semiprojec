<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="email" value="${sessionScope.email}" />
<c:set var="admin" value="${sessionScope.admin }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/semiproject/css/main_nav.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" id="scroll_before">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"data-target="#myNavbar">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>

				<a class="navbar-brand nav_link" style="color: white;" href="/semiproject/semi"><img src="image/logo.png" style="width:60px; height:30px"  />

					<p class="w3-xxlarge w3-myfont">WE-GO</p>
				</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="nav_link" href="/semiproject/question/home">FAQ</a></li>
				<c:choose>
					<c:when test="${!(empty sessionScope.adminName)}">
						<li class="dropdowns"><a class="nav_link" href="/semiproject/semi/admin/admin">${adminName}님</a>
							<div class="dropdown-contents">
								<a href="/semiproject/semi/admin/admin"><i class="fa fa-address-book-o" aria-hidden="true"></i>&nbsp;&nbsp;관리자페이지</a>
								<a href="/semiproject/semi/admin/logout"><i class="fa fa-times" aria-hidden="true"></i></i>&nbsp;&nbsp;로그아웃</a>
							</div>
						</li>
					</c:when>
					<c:when test="${empty sessionScope.email}">
						<li><a class="nav_link" href="/semiproject/user/login_page">로그인</a></li>
						<li><a class="nav_link" href="/semiproject/user/register_page">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="nav_link" href="/semiproject/semi/product/basket"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
						<li class="dropdowns"><a class="nav_link" href="/semiproject/user/my_page">${name}님</a>
							<div class="dropdown-contents">
								<a href="/semiproject/user/selectAccount"><i class="fa fa-address-book-o" aria-hidden="true"></i>&nbsp;&nbsp;마이페이지</a>
								<a href="/semiproject/user/ReserveList"><i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;&nbsp;예약내역</a>
								<a href="/semiproject/reviews/reviewList.do"><i class="fa fa-paper-plane-o" aria-hidden="true"></i>&nbsp;&nbsp;여행후기</a>
								<a href="/semiproject/user/selectAccount"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;&nbsp;계정설정</a>
								<a href="/semiproject/user/logout"><i class="fa fa-times" aria-hidden="true"></i></i>&nbsp;&nbsp;로그아웃</a>
							</div>
						</li>
					</c:otherwise>
				</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-default navbar-fixed-top nav_scoll" id="scroll_after">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"data-target="#myNavbar_after">
					<span class="icon-bar" style="background-color: black"></span> 
					<span class="icon-bar" style="background-color: black"></span> 
					<span class="icon-bar" style="background-color: black"></span>
				</button>
				<a class="navbar-brand nav_link" style="color: black;" href="/semiproject/semi"><img src="image/logo_blue.png" style="width:60px; height:30px"  />
					<p class="w3-xxlarge w3-myfont">WE-GO</p>
				</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar_after">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="nav_link" href="/semiproject/question/home">FAQ</a></li>
				<c:choose>
					<c:when test="${!(empty sessionScope.adminName)}">
						<li class="dropdowns"><a class="nav_link" href="/semiproject/semi/admin/admin">${adminName}님</a>
							<div class="dropdown-contents">
								<a href="/semiproject/semi/admin/admin"><i class="fa fa-address-book-o" aria-hidden="true"></i>&nbsp;&nbsp;관리자페이지</a>
								<a href="/semiproject/semi/admin/logout"><i class="fa fa-times" aria-hidden="true"></i></i>&nbsp;&nbsp;로그아웃</a>
							</div>
						</li>
					</c:when>
					<c:when test="${empty sessionScope.email}">
						<li><a class="nav_link" href="/semiproject/user/login_page">로그인</a></li>
						<li><a class="nav_link" href="/semiproject/user/register_page">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="nav_link" href="/semiproject/semi/product/basket"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
						<li class="dropdowns"><a class="nav_link" href="/semiproject/user/my_page">${name}님</a>
							<div class="dropdown-contents">
								<a href="/semiproject/user/selectAccount"><i class="fa fa-address-book-o" aria-hidden="true"></i>&nbsp;&nbsp;마이페이지</a>
								<a href="/semiproject/user/ReserveList"><i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;&nbsp;예약내역</a>
								<a href="/semiproject/reviews/reviewList.do"><i class="fa fa-paper-plane-o" aria-hidden="true"></i>&nbsp;&nbsp;여행후기</a>
								<a href="/semiproject/user/selectAccount"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;&nbsp;계정설정</a>
								<a href="/semiproject/user/logout"><i class="fa fa-times" aria-hidden="true"></i></i>&nbsp;&nbsp;로그아웃</a>
							</div>
						</li>
					</c:otherwise>
				</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>