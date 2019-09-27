<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="/semiproject/css/product_list.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/semiproject/css/common_nav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <script async defer
	      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnxAZu6B_5ZaIOMtbE9EzAWmgdddJp0lk&callback=initMap">
	      </script> 
 <style>
      #map {
        height: 100%;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
</head>
<body>
	<jsp:include page="/fragment/common_nav.jsp" flush="true"></jsp:include>
<c:set value="${requestScope.dto}" var="dto" />
<c:set value="${requestScope.weather}" var="weather" />

	<!-- 도시 메뉴  이미지. -->
	<div class="jumbotron text-center"
	style="background-image:url('/semiproject/city_image/${dto.imagepath}');
	background-repeat: no-repeat;
	background-size: 100% 100%;">
		<h1 style="margin-top: 100px; color: white;">${dto.city}</h1>
	</div>
</body>
<div class="btn-group btn-block" id="btn">
	<div class="btn-group">
		<a href="#city_neyo" id="d"><button class="btn btn-lg btn-primary"
				id="c">도시정보</button></a> 
		<a href="#favor" id="d"><button class="btn btn-lg btn-primary" id="c">추천하는 액티비티</button></a> 
		<a href="#activ" id="d"><button class="btn btn-lg btn-primary" id="c">액티비티 및 투어</button></a> 
		<a href="#atect" id="d"><button class="btn btn-lg btn-primary" id="c">어트렉션 공연</button></a> 
		<a href="#atection" id="d"><button class="btn btn-lg btn-primary" id="c">대중교통</button></a> 
		<a href="#resta" id="d"><button class="btn btn-lg btn-primary" id="c">추천맛집</button></a>

	</div>
</div>
<section class="favorite" id="favor">
	<div class="favorite_des">
		<div class="favorite_header">
			<h1>${dto.city}</h1>
			<h3>여행자가 추전하는 액티비티</h3>
		</div>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<div class="list_wrap">
						<c:forEach items="${requestScope.pList5}" var="pList5">
						<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${pList5.title}'"
						style="background-image: url('/semiproject/pro_image/${pList5.imagepath}');
								background-repeat: no-repeat;
								background-size: 100% 60%;">
							<span id="blank"></span> <br /> <br /> <br />
							<p><h4>${pList5.title}</h4></p>
							<br />
							<p style="font-weight: bold;">${pList5.price} 원</p>
						</div>
						</c:forEach>
					</div>
				</div>
				<div class="item">
					<div class="list_wrap">
						<c:forEach items="${requestScope.pList6}" var="pList6">
						<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${pList6.title}'"
						style="background-image: url('/semiproject/pro_image/${pList6.imagepath}');
								background-repeat: no-repeat;
								background-size: 100% 60%;">
							<span id="blank"></span> <br /> <br /> <br />
							<p><h4>${pList6.title}</h4></p>
							<br />
							<p style="font-weight: bold;">${pList6.price} 원</p>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev"
				style="background-image: none;"> <i class="fa fa-angle-left"
				aria-hidden="true"
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

<section class="activities" id="activ">
	<div class="activities_des">
		<div class="activities_header">
			<h1>액티비티 및 투어</h1>
			<h3>놀거리</h3>
		</div>
		<div id="myCarousel_1" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<div class="list_wrap">
						<c:forEach items="${requestScope.pList}" var="pList">
						<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${pList.title}'"
						style="background-image: url('/semiproject/pro_image/${pList.imagepath}');
								background-repeat: no-repeat;
								background-size: 100% 60%;">
							<span id="blank"></span> <br /> <br /> <br />
							<p><h4>${pList.title}</h4></p>
							<br />
							<p style="font-weight: bold;">${pList.price} 원</p>
						</div>
						</c:forEach>
					</div>
				</div>
				<div class="item">
					<div class="list_wrap">
						<c:forEach items="${requestScope.pList7}" var="pList7">
						<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${pList7.title}'"
						style="background-image: url('/semiproject/pro_image/${pList7.imagepath}');
								background-repeat: no-repeat;
								background-size: 100% 60%;">
							<span id="blank"></span> <br /> <br /> <br />
							<p><h4>${pList7.title}</h4></p>
							<p>
							<i class="fa fa-star" style="color: orange"></i>${pList7.star}
							</p>
							<p style="font-weight: bold;">${pList7.price} 원</p>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel_1"
				data-slide="prev" style="background-image: none;"> <i
				class="fa fa-angle-left" aria-hidden="true"
				style="color: gray; font-size: 50px; line-height: 300px;"></i> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel_1"
				data-slide="next" style="background-image: none;"> <i
				class="fa fa-angle-right" aria-hidden="true"
				style="color: gray; font-size: 50px; line-height: 300px;"></i> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
</section>




<section class="atection" id="atect">
	<div class="atection_des">
		<div class="atection_header">
			<h1>어트랙션</h1>
			<h3>공연</h3>
		</div>
		<div id="myCarousel_2" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<div class="list_wrap">
						<c:forEach items="${requestScope.pList2}" var="pList2">
						<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${pList2.title}'"
						style="background-image: url('/semiproject/pro_image/${pList2.imagepath}');
								background-repeat: no-repeat;
								background-size: 100% 60%;">
							<span id="blank"></span> <br /> <br /> <br />
							<p><h4>${pList2.title}</h4></p>
							<br />
							<p style="font-weight: bold;">${pList2.price} 원</p>
						</div>
						</c:forEach>
					</div>
				</div>
				<div class="item">
					<div class="list_wrap">
						<c:forEach items="${requestScope.pList8}" var="pList8">
						<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${pList8.title}'"
						style="background-image: url('/semiproject/pro_image/${pList8.imagepath}');
								background-repeat: no-repeat;
								background-size: 100% 60%;">
							<span id="blank"></span> <br /> <br /> <br />
							<p><h4>${pList8.title}</h4></p>
							<br />
							<p style="font-weight: bold;">${pList8.price} 원</p>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel_2"
				data-slide="prev" style="background-image: none;"> <i
				class="fa fa-angle-left" aria-hidden="true"
				style="color: gray; font-size: 50px; line-height: 300px;"></i> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel_2"
				data-slide="next" style="background-image: none;"> <i
				class="fa fa-angle-right" aria-hidden="true"
				style="color: gray; font-size: 50px; line-height: 300px;"></i> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
</section>
<section class="atection" id="atection">
	<div class="atection_des">
		<div class="atection_header">
			<h1>교통수단</h1>
			<h3>대중교통</h3>
		</div>
		<div id="myCarousel_3" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<div class="list_wrap">
						<c:forEach items="${requestScope.pList3}" var="pList3">
						<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${pList3.title}'"
						style="background-image: url('/semiproject/pro_image/${pList3.imagepath}');
								background-repeat: no-repeat;
								background-size: 100% 60%;">
							<span id="blank"></span> <br /> <br /> <br />
							<p><h4>${pList3.title}</h4></p>
							<br />
							<p style="font-weight: bold;">${pList3.price} 원</p>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>
<section class="restaurant" id="resta">
	<div class="restaurant_des">
		<div class="restaurant_header">
			<h1>세계맛집</h1>
			<h3>추천 맛집</h3>
		</div>
		<div id="myCarousel_4" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<div class="list_wrap">
						<c:forEach items="${requestScope.pList4}" var="pList4">
						<div class="pro_img" onclick="location.href='/semiproject/semi/product/view_detail?title=${pList4.title}'"
						style="background-image: url('/semiproject/pro_image/${pList4.imagepath}');
								background-repeat: no-repeat;
								background-size: 100% 60%;">
							<span id="blank"></span> <br /> <br /> <br />
							<p><h4>${pList4.title}</h4></p>
							<br />
							<p style="font-weight: bold;">${pList4.price} 원</p>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>




<div class="city container">
	<h3>도시정보</h3>
	<table class="city">
		<tr class="city_info">
			<del id="city_neyo">
				<div class="col-sm-6">${dto.content}</div>
			</del>
		</tr>
		<tr>
			<del id="google_map">
				  <div id="map" style="width: 400px; height: 300px;"></div>
			</del>
		</tr>
		<del>
			<hr
				style="width: 100%; color: black; height: 1px; background-color: black;" />
		</del>

		<tr>
			<h3>날씨정보</h3>
			<del>
				<!--1d35103d82/singapore/     label :data-label_1="SINGAPORE" 변경    -->
				<a class="weatherwidget-io"
					href="https://forecast7.com/en/${weather[0]}"
					data-label_1="${weather[1]}" data-label_2="WEATHER"
					data-theme="original">${dto.city} 날씨</a>
			</del>
		</tr>

		<del>
			<hr
				style="width: 100%; color: black; height: 1px; background-color: black;" />
		</del>

		<tr>
			<h3>현지정보</h3>
			<td id="time"><header>시간대</header>
				<div>
					<span class="t16">
						${dto.time}
					</span>
				</div></td>
			<td id="mony"><header>통화</header>
				<div>
						${dto.money}
				</div>
			</td>

			<td id="back"><header>방문하기 좋은 시기</header>
				${dto.month}
			</td>
		</tr>
	</table>
</div>
<input type='hidden' value="${dto.lat}" id="lat" />
<input type="hidden" value="${dto.lon}" id="lon" />
<jsp:include page="/fragment/footer.jsp" flush="true"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script  type="text/js"
	href="/semiproject/js/product_list.js"></script>
<script src="/semiproject/js/bootstrap.min.js"></script>
  <script>
  	var lat2 = $('#lat').val()*1;
  	var lon2 = $('#lon').val()*1;
    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var labelIndex = 0;
      function initMap() {
		var banel = {lat: lat2, lng: lon2};      
    	  var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: banel
        });

    	  google.maps.event.addListener(map, 'click', function(event) {
              addMarker(event.latLng, map);
            });
    	  
    	  setMarkers(banel,map);
      }

      
      function setMarkers(location,map) {
          var marker = new google.maps.Marker({
            position: location,
            label: labels[labelIndex++ % labels.length],
            map: map
          });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnxAZu6B_5ZaIOMtbE9EzAWmgdddJp0lk&callback=initMap">
    </script>
<script>
	!function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://weatherwidget.io/js/widget.min.js';
			fjs.parentNode.insertBefore(js, fjs);
		}
	}(document, 'script', 'weatherwidget-io-js');
</script>
</body>
</html>