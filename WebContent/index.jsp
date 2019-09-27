<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 어디갈까? 홈페이지</title>
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/semiproject/css/index.css">

</head>
<body>
	<jsp:include page="/fragment/main_nav.jsp"></jsp:include>
	<div class="bg">
		<div id="cf3" class="current">
			<img src="/semiproject/image/see.PNG" alt="photho1" />
		</div>
		<div>
			<img src="/semiproject/image/mountain.PNG" alt="photho2" />
		</div>
		<div>
			<img src="/semiproject/image/field.PNG" alt="photho3" />
		</div>
	</div>
	<div class="bg_content_wrap">
		<div id="content_wrap">
			<h1 class="bg_content" style="font-size: 70px;">
				<strong>YOURS TO EXPLORE</strong>
			</h1>
			<p class="bg_content" style="font-size: 25px;">아 이거 너무 힘든데? 포기..</p>
		</div>
		<form id="content_bg_form" method="post" action="/semiproject/semi/product/city">
			<div id="content_bg"></div>
			<div id="input_group">
				<input type="text" class="form-control" size="50" name="city"
					placeholder="도시를 입력하세요" required>
				<button type="button" class="btn" id="searchbtn">
					<i class="fa fa-search" aria-hidden="true" style="font-size: 30px;"></i>
				</button>
			</div>
		</form>
	</div>
	<div class="continent_wrap">
		<div class="dropdown">
			<button type="button" class="btn btn-success dropdbtn">동아시아</button>
			<div class="dropdown-content">
				<table class="continent">
					<tr>
						<td class="nation">홍콩 & <br />마카오
						</td>
						<td class="city"></span><a href="">홍콩</a></span></span><a href="">마카오</a></span></td>
					</tr>
					<tr>
						<td class="nation">일본</td>
						<td class="city"><span><a href="">도쿄</a></span> <span><a
								href="/semiproject/semi/product/city?city=오사카">오사카</a></span> <span><a href="">교토</a></span> <span><a
								href="">오키나와&이시가키</a></span> <span><a href="">JR패스</a></span> <span><a
								href="">규슈/후쿠오카 & 구마모토</a></span> <span><a href="">훗카이도</a></span> <span><a
								href="">나고야</a></span></td>
					</tr>
					<tr>
						<td class="nation">대만</td>
						<td class="city"><a href="/semiproject/semi/product/city?city=대만">대만</a> <a href="">타이페이</a> <a
							href="">이란</a> <a href="">화련</a> <a href="">타이둥</a> <a href="">타이중</a>
							<a href="">가오슝</a> <a href="">컨딩</a> <a href="">펑후</a> <a href="">타이난</a>
						</td>
					</tr>
					<tr>
						<td class="nation">한국</td>
						<td class="city"><a href="">서울</a> <a href="">부산</a> <a href="">강원도</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="dropdown">
			<button type="button" class="btn btn-danger dropdbtn">동남아시아</button>
			<div class="dropdown-content">
				<table class="continent">
					<tr>
						<td class="nation">싱가포르</td>
						<td class="city"><a href="/semiproject/semi/product/city?city=싱가포르">싱가포르</a></td>
					</tr>
					<tr>
						<td class="nation">베트남</td>
						<td class="city"><a href="">호치민</a> <a href="">나트랑</a> <a href="">후에</a> <a href="">호이안</a> <a href="">다낭</a> <a href="">푸꾸옥</a>
							<a href="">달랏</a></td>
					</tr>
					<tr>
						<td class="nation">태국</td>
						<td class="city"><a href="">방콕</a> <a href="">파타야</a> <a href="">치앙마이</a> <a href="">푸켓</a> <a href="">코사무이</a> <a href="">끄라비</a>
							<a href="">후아힌</a> <a href="">코창</a> <a href="">피피섬</a> <a href="">핫야이&꼬리빼</a> <a href="">치앙라이</a> <a href="">코팡안&수랏타이</a></td>
					</tr>
					<tr>
						<td class="nation">인도네시아</td>
						<td class="city"><a href="">발리</a><a href="">자카르타</a><a href="">롬복</a><a href="">바탐</a><a href="">빈탄</a><a href="">족자카르타</a></td>
					</tr>
					<tr>
						<td class="nation">말레이시아</td>
						<td class="city"><a href="">쿠알라룸푸르</a><a href="">코타키나발루</a><a href="">랑카위</a><a href="">페낭</a><a href="">조호바루</a></td>
					</tr>
					<tr>
						<td class="nation">필리핀</td>
						<td class="city"><a href="">마닐라</a><a href="">보라카이</a><a href="">세부</a><a href="">팔라완</a><a href="">보홀</a></td>
					</tr>
					<tr>
						<td class="nation">라오스</td>
						<td class="city"><a href="">루앙프라방</a><a href="">비엔티안</a><a href="">방비엥</a></td>
					</tr>
					<tr>
						<td class="nation">캄보디아</td>
						<td class="city"><a href="">씨엠립</a><a href="">프놈펜</a></td>
					</tr>
					<tr>
						<td class="nation">미얀마</td>
						<td class="city"><a href="">양곤</a><a href="">바간</a><a href="">만달레이</a><a href="">인레호수</a><a href="">나팔리</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="dropdown">
			<button type="button" class="btn btn-info dropdbtn">유럽</button>
			<div class="dropdown-content">
				<table class="continent">
					<tr>
						<td class="nation">프랑스</td>
						<td class="city"><a href="/semiproject/semi/product/city?city=파리">파리</a></td>
					</tr>
					<tr>
						<td class="nation">영국</td>
						<td class="city"><a href="">런던</a><a href="">에든버러</a><a href="">맨체스터</a></td>
					</tr>
					<tr>
						<td class="nation">스페인</td>
						<td class="city"><a href="">마드리드</a><a href="">바르셀로나</a><a href="">세비야</a><a href="">말라가</a></td>
					</tr>
					<tr>
						<td class="nation">이탈리아</td>
						<td class="city"><a href="">로마</a><a href="">밀라노</a><a href="">피렌체</a><a href="">베네치아</a><a href="">나폴리</a></td>
					</tr>
					<tr>
						<td class="nation">오스트리아</td>
						<td class="city"><a href="">비엔나</a></td>
					</tr>
					<tr>
						<td class="nation">네덜란드</td>
						<td class="city"><a href="">암스테르담</a></td>
					</tr>
					<tr>
						<td class="nation">독일</td>
						<td class="city"><a href="">베를린</a><a href="">뮌헨</a></td>
					</tr>
					<tr>
						<td class="nation">스위스</td>
						<td class="city"><a href="">인터라켄</a><a href="">취리히</a><a href="">루체른</a></td>
					</tr>
					<tr>
						<td class="nation">아이슬란드</td>
						<td class="city"><a href="">레이캬비크</a><a href="">북부아이슬란드</a></td>
					</tr>
					<tr>
						<td class="nation">핀란드</td>
						<td class="city"><a href="">헬싱키</a><a href="">핀란드 라플란드</a></td>
					</tr>
					<tr>
						<td class="nation">스웨덴</td>
						<td class="city"><a href="">스톡홀롬</a></td>
					</tr>
					<tr>
						<td class="nation">노르웨이</td>
						<td class="city"><a href="">오슬로</a></td>
					</tr>
					<tr>
						<td class="nation">덴마크</td>
						<td class="city"><a href="">코펜하겐</a></td>
					</tr><tr>
						<td class="nation">그리스</td>
						<td class="city"><a href="">아테네</a></td>
					</tr><tr>
						<td class="nation">러시아</td>
						<td class="city"><a href="">모스크바</a></td>
					</tr><tr>
						<td class="nation">아일랜드</td>
						<td class="city"><a href="">더블린</a></td>
					</tr><tr>
						<td class="nation">헝가리</td>
						<td class="city"><a href="">부다페스트</a></td>
					</tr><tr>
						<td class="nation">체코</td>
						<td class="city"><a href="">프라하</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="dropdown">
			<button type="button" class="btn btn-primary dropdbtn">미국</button>
			<div class="dropdown-content">
				<table class="continent">
					<tr>
						<td class="nation">미국</td>
						<td class="city"><a href="">뉴욕</a><a href="/semiproject/semi/product/city?city=로스앤젤레스">로스앤젤레스</a><a href="">괌</a><a href="">하와이</a><a href="">올랜도</a><a href="">샌프란시스코</a><a href="">시카고</a>
						<a href="">라스베이거스</a><a href="">샌디에이고</a><a href="">워싱턴D.C.</a><a href="">보스턴</a><a href="">마이애미</a><a href="">사이판</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="dropdown">
			<button type="button" class="btn btn-dark dropdbtn">오세아니아/아프리카</button>
			<div class="dropdown-content" style="position:relative;left:-200px !important">
				<table class="continent" style="background-color:white; width:800px;">
					<tr>
						<td class="nation">호주</td>
						<td class="city"><a href="">시드니</a><a href="">멜버른</a><a href="">케언즈</a><a href="">브리즈번</a><a href="">퍼스</a><a href="">골드코스트</a><a href="">호바트&타즈매니아</a>
						<a href="">울루루&앨리스 스프링스</a><a href="">선샤인 코스트</a></td>
					</tr>
					<tr>
						<td class="nation">뉴질랜드</td>
						<td class="city"><a href="">크라이스트처치</a><a href="">퀸스타운</a><a href="">오클랜드</a><a href="">웰링턴</a><a href="">말버러</a><a href="">넬슨</a></td>
					</tr>
					<tr>
						<td class="nation">모리셔스</td>
						<td class="city"><a href="">모리셔스</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="dropdown">
			<button type="button" class="btn btn-warning dropdbtn">남아시아/중동</button>
			<div class="dropdown-content" style="position:relative;left:-500px !important">
				<table class="continent" style="background-color:white; width:800px;">
					<tr>
						<td class="nation">인도</td>
						<td class="city"><a href="">뭄바이</a><a href="">델리</a><a href="">자이푸르</a><a href="">우다이푸르</a><a href="">바라나시</a><a href="">아그라</a></td>
					</tr>
					<tr>
						<td class="nation">터키</td>
						<td class="city"><a href="">이스탄불</a></td>
					</tr>
					<tr>
						<td class="nation">아랍에미리트</td>
						<td class="city"><a href="/semiproject/semi/product/city?city=두바이">두바이</a><a href="">아부다비</a></td>
					</tr>
					<tr>
						<td class="nation">네팔</td>
						<td class="city"><a href="">카트만두</a><a href="">포카라</a></td>
					</tr>
					<tr>
						<td class="nation">이스라엘</td>
						<td class="city"><a href="">예루살렘</a><a href="">텔아비브</a></td>
					</tr>
					<tr>
						<td class="nation">카타르</td>
						<td class="city"><a href="">도하</a></td>
					</tr>
					<tr>
						<td class="nation">오만</td>
						<td class="city"><a href="">무스카트</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<section class="favorite">
		<div class="favorite_des">
			<div class="favorite_header">
				<h1>인기 여행지</h1>
				<h3>지금 당장 떠나고 싶은, 매력 넘치는 도시들</h3>
			</div>
			<div id="flist_wrap">
			<!-- 인기여행지 6개만 가져오기 -->
	
				<div class="favorite_list" id="osaka">
			     <span> <a href="/semiproject/semi/product/city?city=오사카" class="noul">오사카</a></span>
				</div>
				
				<div class="favorite_list" id="dubai">
					<span><a href="/semiproject/semi/product/city?city=두바이">두바이</a></span>
				</div>
				<div class="favorite_list" id="sing">
				
					<span><a href="/semiproject/semi/product/city?city=싱가포르">싱가포르</a></span>
				
				</div>
				<div class="favorite_list" id="paris">
					<span><a href="/semiproject/semi/product/city?city=파리">파리</a></span>
				</div>
				<div class="favorite_list" id="duba2i">
					<span><a href="/semiproject/semi/product/city?city=로스앤젤레스">로스앤젤레스</a></span>
				</div>
				<div class="favorite_list" id="sing2">
					<span><a href="/semiproject/semi/product/city?city=대만">대만</a></span>
				</div>
			</div>
		</div>
	</section>
	<section class="favorite">
		<div class="favorite_des">
			<div class="favorite_header">
				<h1>인기 액티비티</h1>
				<h3>여행자가 추전하는 액티비티</h3>
			</div>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<div class="list_wrap">
							<!--///////////////////////////////////////////-->
							<c:forEach items="${requestScope.aList}" var="aList">
								<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${aList.title}'"
									style="background-image: url('/semiproject/pro_image/${aList.imagepath}');
										background-repeat: no-repeat;
										background-size: 100% 60%;">
										<span id="blank"></span> <br /> <br /> <br />
									<p><h4>${aList.title}</h4></p>
									<br />
									<p style="font-weight: bold;">${aList.price} 원</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="item">
						<div class="list_wrap">
							<c:forEach items="${requestScope.aList2}" var="aList2">
								<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${aList2.title}'"
									style="background-image: url('/semiproject/pro_image/${aList2.imagepath}');
										background-repeat: no-repeat;
										background-size: 100% 60%;">
										<span id="blank"></span> <br /> <br /> <br />
									<p><h4>${aList2.title}</h4></p>
									<br />
									<p style="font-weight: bold;">${aList2.price} 원</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev" style="background-image: none;"> <i
					class="fa fa-angle-left" aria-hidden="true"
					style="color: gray; font-size: 50px; line-height: 300px;"></i> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next" style="background-image: none;"> <i
					class="fa fa-angle-right" aria-hidden="true"
					style="color: gray; font-size: 50px; line-height: 300px;"></i> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</section>


	<jsp:include page="/fragment/footer.jsp"></jsp:include>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/semiproject/js/bootstrap.min.js"></script>
	<script src="/semiproject/js/index.js"></script>
</body>
</html>