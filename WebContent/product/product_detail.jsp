<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inconsolata">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/common_nav.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/product_detail.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.roundbutton1 {
	border: 1px #333 solid;
	padding: 8px;
	background-color: white;
	-webkit-border-radius: 5px;
	-moz-border-radius: 20px;
	border-radius: 30px;
}
</style>


<body>
<c:set var="dto" value="${requestScope.dto}" />
<c:set var="options" value="${requestScope.optionList}" />
<c:set var="imagePath" value="${requestScope.image}" />
<input type="hidden" id="email" value="${sessionScope.email}" />
	<!-- include 메인메뉴-->
	<jsp:include page="/fragment/common_nav.jsp"></jsp:include>
	<!-- Links (sit on top) -->


	<!-- 헤더 이미지 -->
	<header class="header-images" id="home">
		<c:forEach var="image" items="${imagePath}">
			<img class="mySlides" src="/semiproject/pro_image/${image}" style="width: 100%">
		</c:forEach>
	</header>

	<!-- 제목부분 -->
	<div class="activity-title">
		<p class="color-grey">메인페이지 > ${dto.city} > ${dto.title}</p>
		<h1 id="act-title">${dto.title}</h1>
		<!-- db에서 불러오는 제목값 -->
		<hr />
		<h5 class="color-grey">취소 불가 | 오픈티켓 | 출력된 바우처</h5>
		<hr />
	</div>

	<!-- 빠른 예약 리모컨-->
	<div class="fast-remote">
		<span class="fast-price">우리어디갈까</span>
		<p class="fast-price" id="animate">최저가 보상제!!</p>
		<p class="fast-price">
			<strong class="present-price"> ₩ <span>${options.get(0).price}</span>
			</strong>
			<del class="past-price">${options.get(0).price*2}</del>
			<br> 내일 예약가능
		</p>
		<p></p>
		<a href="#fast-reserve" style="color: white"><button
				class="button1 button4">바로예약</button></a>
	</div>

	<!--  바로예약버튼 눌렀을 시 이동 구간 -->
	<div class="main" id="fast-reserve"></div>
	<!-- 패키지 옵션 예약  -->
	<div class="w3-container" id="where">
		<div class="w3-content w3-border-bottom" style="max-width: 700px">
			<h2 class="package-title">패키지옵션</h2>
			<p>
				<span class="w3-tag">날짜 및 패키지 옵션 선택</span>
			</p>
			<p>
				<strong>옵션 선택</strong>
			</p>
			<form action="" id="ftm" method="post">
				<c:set var="index" value="0" />
				<p class="option-check-form">
					<c:forEach items="${options}" var="options">
						<c:choose>
							<c:when test="${!(options.count eq 0)}">
								<button class="button button2" value="${options.price}">${options.options}</button>
								<c:set var="index" value="1" />
							</c:when>
						</c:choose>
					</c:forEach>
					<c:choose>
							<c:when test="${index eq 0}">
								<h3>현재 재고가 모두 소진되었습니다.</h3>
							</c:when>
					</c:choose>
				</p>
				<input type="hidden" name="opt" id="opt" />
				<input type="hidden" name="til" id="til" value="${dto.title}" />
				   <p>
               <strong>수량</strong>
            </p>
            <table class="table table-bordered exam">
               <tbody>
                  <input type="text" class="form-control num_only num_comma num_sum"
                     id="fn_type1_price" name="pnum"/>
                  <br />

                  <p>
                     <strong>총 금액</strong>
                  </p>
                  <input type="text"  
                     class="form-control font-weight-bold num_only num_comma num_sum"
                     id="fn_total" placeholder="total price" 
                      name="price" readonly>
                  <div id="han_money" class="text-right"></div>
                  </td>

               </tbody>
            </table>


				<p>
					<strong>날짜 선택</strong>
				</p>
				<p>
					<input class="w3-input w3-padding-16 w3-border"
						type="datetime-local" placeholder="Date and time" required
						name="date" value="2019-08-14T12:00">
				</p>
				<p>
					<button class="w3-button w3-black" type="submit">예약하기</button>
					<button class="w3-button w3-black" type="button" id="basket">장바구니 담기</button>
				</p>
			</form>
		</div>
	</div>
	<br />
	<div class="w3-container">
	<div class="w3-content w3-border-bottom" style="max-width: 700px">
		${dto.content}
		</div>
	</div>
	<!-- 패키지 내용 -->
	

	<!-- 여행후기 -->
	<br />
	<!--    여행 후기  		-->

	<!-- Contact/Area Container -->
	<div class="w3-container" id="where">
		<div class="w3-content" style="max-width: 700px">
			<h2 class="package-title">여행후기</h2>
			<div class="gallery-wrapper">

				<div class="gallery-wrapper-inner">
					
					<br />
					<!--  도시 정보보기 버튼 -->
					<button class="roundbutton1" type="submit" onclick="location.href='/semiproject/semi/product/city?city=${dto.city}'">
					도시 정보 보기
					</button>
					<br /> <br />
				</div>


			</div>


			<!-------  후기 글 작성자 -------->
			<div class="review-wrapper1">
			<c:forEach items="${requestScope.rList}" var="rdto">
					<div class="review_form">
						<c:forEach items="${rdto.path}" var="image">
						<span><img src="/semiproject/review_image/${image}" style="width:200px; heigth: 100px;"></span>
						</c:forEach>
						<br />
						<br />
							<p>
							${rdto.title} ~[사용일자 : ${rdto.date}]
							<c:forEach begin="1" end="${rdto.star}" step="1">
								<i class="fa fa-star" style="color: orange"></i>
							</c:forEach>
							<p>
						<p id="re_text">${rdto.content}</p>

					
					</div>
					<br />
					<br />
					<hr>
					</c:forEach>
			</div>



			<!-- Footer -->
		</div>
		<jsp:include page="/fragment/footer.jsp"></jsp:include>
	</div>


	<!-- <a href="https://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-text-green"></a> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/semiproject/js/product_detail.js"></script>

</body>
</html>
