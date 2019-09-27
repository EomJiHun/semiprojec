<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="/semiproject/css/activity.css">

  
<body>
	<!-- include 메인메뉴-->
	<jsp:include page="/fragment/main_nav.jsp"></jsp:include>
	<!-- Links (sit on top) -->


	<!-- 헤더 이미지 -->
	<header class="header-images" id="home">

		<img class="mySlides" src="image/disney.PNG" style="width: 100%">
		<img class="mySlides" src="image/disney2.PNG" style="width: 100%">
		<img class="mySlides" src="image/disney3.PNG" style="width: 100%">

	</header>

	<!-- 제목부분 -->
	<div class="activity-title">
		<p class="color-grey">메인페이지 > 파리 > [기간 한정 프로모션] 파리 디즈니랜드® 티켓 1일권</p>
		<h1 id="act-title">[기간 한정 프로모션] 파리 디즈니랜드® 티켓 1일권</h1>
		<!-- db에서 불러오는 제목값 -->
		<hr />
		<h5 class="color-grey">취소 불가 | 오픈티켓 | 출력된 바우처</h5>
		<hr />
	</div>

	<!-- 빠른 예약 리모컨-->
	<div class="fast-remote">
		<span class="remote-title">우리어디갈까 최저가 보상제</span>
		<p class="fast-price">
			<strong class="present-price"> ₩ <span>59,100</span>
			</strong>
			<del class="past-price">117,100</del>
		</p>
		<span class="remote-title">내일 예약가능</span>
		<p></p>
		<button class="button1 button4" id="go-to">바로예약</button>
	</div>

	<!-- 패키지 내용 -->
	<div class="w3-container" id="where">
		<div class="w3-content w3-border-bottom" style="max-width: 700px">
			<ul>
				<li><strong>여름 한정 15% 추가 할인! (최대 7만원)</strong>을 확인하고 특별한 할인 혜택을
					만나보세요.</li>
				<li>꿈 속 세상이 현실이 되는 공간, 파리 디즈니랜드®로 초대합니다.</li>
				<li>어린시절 단짝이었던 디즈니 친구들과 기념 사진을 남겨보세요.</li>
				<li>'The Adventures Continue', 'The Tower of Terror'와 더 많은
					흥미진진한 놀이기구가 기다리고 있습니다.</li>
				<li>잠자는 숲속의 공주를 테마로 한 사운드 쇼와 마법 같은 조명에 감탄해보세요.</li>
				<li>가족과 친구들과 함께 완벽한 하루를 만들어줄 거예요.</li>
				<li>기다리는 시간을 절약할 수 있는 패스트패스를 예약하는 것도 잊지 마세요!</li>
				<li>더 많은 시간을 이곳에서 보내고 싶으시다면, <a
					href="https://www.klook.com/ko/activity/10624-disneyland-paris-multi-day-ticket-paris/">파리
						디즈니랜드® 멀티 데이 입장권</a>을 참고하세요.
				</li>
			</ul>
		</div>
	</div>
    <br/>
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
			<form action="/action_page.php" target="_blank">

				<p class="option-check-form">
					<button class="button button2">옵션1</button>
					<button class="button button2">옵션2</button>
					<button class="button button2">옵션3</button>
					<button class="button button2">옵션4</button>
				</p>

				<p>
					<strong>수량</strong>
				</p>
				<p>
					<input class="w3-input w3-padding-16 w3-border" type="number"
						placeholder="How many people (adult)" required name="People">
					<!-- 성인금액표시 -->
				</p>
				<p>
					<input class="w3-input w3-padding-16 w3-border" type="number"
						placeholder="How many people (child)" required name="People">
					<!-- 어린이금액표시 -->
				</p>
				<p>
					<strong>총 금액</strong>
				</p>
				<p>
					<input class="w3-input w3-padding-16 w3-border" type="text"
						placeholder="total price" required name="Price">
				</p>
				<p>
					<strong>날짜 선택</strong>
				</p>
				<p>
					<input class="w3-input w3-padding-16 w3-border"
						type="datetime-local" placeholder="Date and time" required
						name="date" value="2017-11-16T20:00">
				</p>
				<p>
					<button class="w3-button w3-black" type="submit">reserve</button>
				</p>
			</form>
		</div>
	</div>
	<br />
	
	<!-- 여행스토리 -->
	<div class="w3-container" id="where">
		<div class="w3-content w3-border-bottom" style="max-width: 700px">
			<h2 class="package-title">여행스토리</h2>
			<P>세계에서 가장 행복한 장소인 파리 디즈니랜드에서 마술과 같은 시간을 보내보세요. 낭만의 도시 파리 디즈니랜드는
				흥미로운 어트랙션과 디즈니 캐릭터들이 가득하여 함께 사진을 찍다 보면 시간 가는 줄 모르는 곳입니다. 특히 밤에는 환상적인
				불꽃놀이가 하늘을 수놓으며, 디즈니를 상징하는 아름다운 성이 불을 밝히며 더욱 환상적인 모습을 연출합니다. 가족 그리고
				친구 누구와 함께해도 최고의 추억을 만들어주는 완벽한 여행지. 파리를 간다면, 세계에서 가장 행복한 장소가 당신을 기다리고
				있다는 걸 잊지 말고 꼭 방문하세요.</P>
			<img class="w3-input" src="image/disney.PNG" />
			<p>
				<span class="css-arrow"></span>세계에서 가장 행복한 곳, 꿈과 희망으로 가득한 디즈니랜드로
				떠나보세요.
			</p>
			<img class="w3-input" src="image/disney2.PNG" />
			<p>
				<span class="css-arrow"></span>세계에서 가장 행복한 곳, 꿈과 희망으로 가득한 디즈니랜드로
				떠나보세요.
			</p>
			<img class="w3-input" src="image/disney3.PNG" />
			<p>
				<span class="css-arrow"></span>세계에서 가장 행복한 곳, 꿈과 희망으로 가득한 디즈니랜드로
				떠나보세요.
			</p>
		</div>
	</div>

   <br />
	<!-- 예약정보 -->
	<div class="w3-container" id="where">
		<div class="w3-content w3-border-bottom" style="max-width: 700px">
			<h2 class="package-title">예약정보</h2>
			<span class="w3-tag">예약확정</span>
			<ul>
				<li>예약 후, 확정 메일이 바로 발송됩니다.</li>
				<li>이메일을 받지 못한 경우, 스팸 메일함을 확인하거나 고객센터로 문의해주세요.</li>
			</ul>
			<div class="w3-content" style="max-width: 700px; background-color: antiquewhite;">
				<div class="line reminder_div">
					<div class="title g_left t_gray">TIP</div>
					<div class="g_left markdown-content">
						<h4 class="tip">Tip:</h4>
						<h5>파리 디즈니랜드® 패스트패스는 어떻게 사용하나요?</h5>
						<ul>
							<li>디즈니랜드® 패스트패스는 <strong>무료</strong> 서비스로 Space Mountain의
								Mission 2, The Twilight Zone Tower of Terror와 같은 어트랙션의 줄을 서지 않고,
								바로 입장할 수 있습니다.
							</li>
							<li>탑승을 원하는 어트랙션에 가서 디즈니랜드® 입장권을 패스트패스 기기에 넣은 뒤, 지정된 탑승 시간에
								탑승을 하면 됩니다.</li>
							<li>디즈니 호텔을 머무시는 고객의 경우, VIP 패스트패스와 호텔 패스트패스로 더욱 빠르게 이용할 수
								있습니다.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 사용방법 -->
<div class="w3-container" id="where">
		<div class="w3-content w3-border-bottom" style="max-width: 700px">
			<h2 class="package-title">사용방법</h2>
			<ul>
							
							<li>디즈니랜드® 패스트패스는 <strong>무료</strong> 서비스로 Space Mountain의
								Mission 2, The Twilight Zone Tower of Terror와 같은 어트랙션의 줄을 서지 않고,
								바로 입장할 수 있습니다.
							</li>
							<li>탑승을 원하는 어트랙션에 가서 디즈니랜드® 입장권을 패스트패스 기기에 넣은 뒤, 지정된 탑승 시간에
								탑승을 하면 됩니다.</li>
							<li>디즈니 호텔을 머무시는 고객의 경우, VIP 패스트패스와 호텔 패스트패스로 더욱 빠르게 이용할 수
								있습니다.</li>
						</ul>
					
			<img class="w3-input" src="image/disneymap.PNG" style="height: 50%;"/>
			</div></div>

	<!-- Footer -->
	<footer class="w3-center w3-light-grey w3-padding-48 w3-large">
		<p>
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a>
		</p>
	</footer>



	<script src="/semiproject/js/activity.js"></script>

</body>
</html>
