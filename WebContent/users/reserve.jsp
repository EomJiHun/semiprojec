<%@page import="semi.model.dto.UserDTO"%>
<%@page import="semi.model.dto.ReserveDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/semiproject/js/reserve.js"></script>
 <link href="/semiproject/css/reserve.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" type="text/css" href="/semiproject/css/bootstrap.min.css">
 <script src="/semiproject/js/bootstrap.min.js"></script>
 
 <style>
 #mask {
   position: absolute;
   left: 0;
   top: 0;
   z-index: 9000;
   background-color: #000;
   display: none;
}
 </style>
 <script type="text/javascript">
 
	 $(document).ready(function(){
	    
	    <% List<UserDTO> a=(List<UserDTO>)session.getAttribute("user"); 
	           UserDTO dto= a.get(0);
	        
	    %>
	   $('#country').val("<%=dto.getCountry()%>");
	   $('#phone').val("<%=dto.getP_country()%>")
	   
	      

	      var box=$('.tt').length;

	      var total=0;
	      for(var i=1; i<=box;i++)
	         {
	         var str=$("div[id=price"+i+"]").text();
	           total+=parseInt(str.replace("₩",""));
	         }
	      $('#amount1').val(total);
	      $('#amount').text(total);
	   
	 })
	 	
 
 </script>
</head>
<body>
	<jsp:include page="/fragment/common_nav.jsp"></jsp:include>
   <div id="mask"></div>
  
   <section class="gmain pay" style="min-height: 600px;">

      <div class="g_left" id="pay_left">
         <form id="order" name="fo" method="post">
            <section class="part">

               <c:forEach var="user" items="${sessionScope.user}">
               <header>
                  <h2 class="t20">①여행자정보 </h2>
               </header>
               <div class="m_grid">
                  <div class="m_justify_list g_row1">
                     <div class="inputs g_ib">
                        <header>Title*</header>
                        <select id="gender" >
                           <option value="MR" selected="selected">MR</option>
                           <option value="MRS">MRS</option>
                           <option value="MISS">MISS</option>
                        </select>
                     </div>
                     <div class="inputs g_ib">
                        <header>여권 영문 이름*</header>
                        <input type="text" class="name" placeholder="여권에 기재된 이름"
                           name="payname" value="${user.lname}"  />

                     </div>
                     <div class="inputs g_ib">
                        <header>여권 영문 성*</header>
                        <input type="text" class="name" placeholder="여권 영문 성"
                           name="payname1" value="${user.fname}" />
                            
                     </div>
                  </div>

                  <div class="m_justify_list">
                     <div class="inputs">
                        <header>여권상 국가*</header>
                        <div>
                           <select id="country" data-selected-value="KR" name="country" >


                              <option value="">선택하세요</option>
                              <option value="KR">대한민국</option>
                              <option value="CN">중국 본토</option>
                              <option value="JP">일본</option>
                              <option value="US">미국</option>
                              <option value="TW">대만</option>
                              <option value="HK">홍콩</option>
                              <option value="PH">필리핀</option>
                              <option value="SG">싱가포르</option>
                              <option value="TH">태국</option>
                              <option value="MY">말레이시아</option>


                              <optgroup label="기타" 국가="" 지역="">



                                 <option value="MO">마카오</option>

                                 <option value="AU">호주</option>
                                 <option value="ID">인도네시아</option>
                                 <option value="IN">인도</option>






                                 <option value="DZ">알제리</option>
                                 <option value="AL">알바니아</option>
                                 <option value="AF">아프가니스탄</option>
                                 <option value="AS">사모아</option>
                                 <option value="AD">안도라</option>
                                 <option value="AO">앙골라</option>
                                 <option value="AI">앵귈라</option>
                                 <option value="AG">앤티가바부다</option>
                                 <option value="AR">아르헨티나</option>
                                 <option value="AM">아르메니아</option>
                                 <option value="AW">아루바</option>
                                 <option value="AT">오스트리아</option>
                                 <option value="AZ">아제르바이잔</option>
                                 <option value="BS">바하마</option>
                                 <option value="BH">바레인</option>
                                 <option value="BD">방글라데시</option>
                                 <option value="BB">바베이도스</option>
                                 <option value="BY">벨라루스</option>
                                 <option value="BE">벨기에</option>
                                 <option value="BZ">벨리즈</option>
                                 <option value="BJ">베냉</option>
                                 <option value="BM">버뮤다</option>
                                 <option value="BT">부탄</option>
                                 <option value="BO">볼리비아</option>
                                 <option value="BA">보스니아 헤르체고비나</option>
                                 <option value="BW">보츠와나</option>
                                 <option value="BR">브라질</option>
                                 <option value="BN">브루나이</option>
                                 <option value="BG">불가리아</option>
                                 <option value="BF">부르키나파소</option>
                                 <option value="BI">부룬디</option>
                                 <option value="KH">캄보디아</option>
                                 <option value="CM">카메룬</option>
                                 <option value="CA">캐나다</option>
                                 <option value="CV">카보베르데 제도</option>
                                 <option value="KY">케이맨 제도</option>
                                 <option value="CF">중앙 아프리카 공화국</option>
                                 <option value="CL">칠레</option>
                                 <option value="TD">차드</option>
                                 <option value="CO">콜롬비아</option>
                                 <option value="KM">코모로</option>
                                 <option value="CG">콩고</option>
                                 <option value="CK">쿡 제도</option>
                                 <option value="CR">코스타리카</option>
                                 <option value="CI">코트디부아르</option>
                                 <option value="HR">크로아티아</option>
                                 <option value="CU">쿠바</option>
                                 <option value="TRNC">북 키프로스</option>
                                 <option value="CY">남 키프로스</option>
                                 <option value="CZ">체코 공화국</option>
                                 <option value="DK">덴마크</option>
                                 <option value="DJ">지부티</option>
                                 <option value="DM">도미니카</option>
                                 <option value="DO">도미니카 공화국</option>
                                 <option value="EC">에콰도르</option>
                                 <option value="EG">이집트</option>
                                 <option value="SV">엘살바도르</option>
                                 <option value="GQ">적도 기니</option>
                                 <option value="ER">에리트레아</option>
                                 <option value="EE">에스토니아</option>
                                 <option value="ET">에티오피아</option>
                                 <option value="FK">포클랜드 제도</option>
                                 <option value="FO">페로 제도</option>
                                 <option value="FJ">피지</option>
                                 <option value="FI">핀란드</option>
                                 <option value="FR">프랑스</option>
                                 <option value="GF">프랑스령 기아나</option>
                                 <option value="PF">프랑스령 폴리네시아</option>
                                 <option value="GA">가봉</option>
                                 <option value="GM">감비아</option>
                                 <option value="GE">조지아</option>
                                 <option value="DE">독일</option>
                                 <option value="GH">가나</option>
                                 <option value="GI">지브롤터</option>
                                 <option value="GR">그리스</option>
                                 <option value="GL">그린란드</option>
                                 <option value="GD">그레나다</option>
                                 <option value="GP">과들루프</option>
                                 <option value="GU">괌</option>
                                 <option value="GT">과테말라</option>
                                 <option value="GN">기니</option>
                                 <option value="GW">기니 - 비사우</option>
                                 <option value="GY">가이아나</option>
                                 <option value="HT">아이티</option>
                                 <option value="HN">온두라스</option>
                                 <option value="HU">헝가리</option>
                                 <option value="IS">아이슬란드</option>
                                 <option value="IR">이란</option>
                                 <option value="IQ">이라크</option>
                                 <option value="IE">아일랜드</option>
                                 <option value="IL">이스라엘</option>
                                 <option value="IT">이탈리아</option>
                                 <option value="JM">자메이카</option>
                                 <option value="JO">요르단</option>
                                 <option value="KZ">카자흐스탄</option>
                                 <option value="KE">케냐</option>
                                 <option value="KI">키리바시</option>
                                 <option value="KP">북한</option>
                                 <option value="KW">쿠웨이트</option>
                                 <option value="KG">키르기스탄</option>
                                 <option value="LA">라오스</option>
                                 <option value="LV">라트비아</option>
                                 <option value="LB">레바논</option>
                                 <option value="LS">레소토</option>
                                 <option value="LR">라이베리아</option>
                                 <option value="LY">리비아</option>
                                 <option value="LI">리히텐슈타인</option>
                                 <option value="LT">리투아니아</option>
                                 <option value="LU">룩셈부르크</option>
                                 <option value="MK">마케도니아</option>
                                 <option value="MG">마다가스카르</option>
                                 <option value="MW">말라위</option>
                                 <option value="MV">몰디브</option>
                                 <option value="ML">말리</option>
                                 <option value="MT">몰타</option>
                                 <option value="MH">마샬 제도</option>
                                 <option value="MQ">마르티니크</option>
                                 <option value="MR">모리타니</option>
                                 <option value="YT">마요트 섬</option>
                                 <option value="MU">모리셔스</option>
                                 <option value="MX">멕시코</option>
                                 <option value="FM">미크로네시아</option>
                                 <option value="MD">몰도바</option>
                                 <option value="MC">모나코</option>
                                 <option value="MN">몽골</option>
                                 <option value="MS">몬세라트</option>
                                 <option value="MA">모로코</option>
                                 <option value="MZ">모잠비크</option>
                                 <option value="MM">미얀마</option>
                                 <option value="NA">나미비아</option>
                                 <option value="NR">나우루</option>
                                 <option value="NP">네팔</option>
                                 <option value="NL">네덜란드</option>
                                 <option value="AN">네덜란드령 앤틸리스</option>
                                 <option value="NC">뉴칼레도니아</option>
                                 <option value="NZ">뉴질랜드</option>
                                 <option value="NI">니카라과</option>
                                 <option value="NE">니제르</option>
                                 <option value="NG">나이지리아</option>
                                 <option value="NU">니우에</option>
                                 <option value="NF">노포크 제도</option>
                                 <option value="NO">노르웨이</option>
                                 <option value="OM">오만</option>
                                 <option value="PW">팔라우</option>
                                 <option value="PS">팔레스타인</option>
                                 <option value="PA">파나마</option>
                                 <option value="PG">파푸아 뉴 기니</option>
                                 <option value="PY">파라과이</option>
                                 <option value="PE">페루</option>
                                 <option value="PK">파키스탄</option>
                                 <option value="PL">폴란드</option>
                                 <option value="PT">포르투갈</option>
                                 <option value="PR">푸에르토리코</option>
                                 <option value="QA">카타르</option>
                                 <option value="RE">레위니옹</option>
                                 <option value="RO">루마니아</option>
                                 <option value="RU">러시아</option>
                                 <option value="RW">르완다</option>
                                 <option value="SM">산마리노</option>
                                 <option value="ST">상투메프린시페</option>
                                 <option value="SA">사우디 아라비아</option>
                                 <option value="SN">세네갈</option>
                                 <option value="CS">세르비아</option>
                                 <option value="SC">세이셸</option>
                                 <option value="SL">시에라리온</option>
                                 <option value="SK">슬로바키아</option>
                                 <option value="SI">슬로베니아</option>
                                 <option value="SB">솔로몬 제도</option>
                                 <option value="SO">소말리아</option>
                                 <option value="ZA">남아프리카 공화국</option>
                                 <option value="ES">스페인</option>
                                 <option value="LK">스리랑카</option>
                                 <option value="SH">세인트 헬레나</option>
                                 <option value="KN">세인트 키츠</option>
                                 <option value="LC">세인트 루시아</option>
                                 <option value="SD">수단</option>
                                 <option value="SR">수리남</option>
                                 <option value="SZ">스와질란드</option>
                                 <option value="SE">스웨덴</option>
                                 <option value="CH">스위스</option>
                                 <option value="TJ">타지키스탄</option>
                                 <option value="TZ">탄자니아</option>
                                 <option value="TG">토고</option>
                                 <option value="TO">통가</option>
                                 <option value="TT">트리니다드 토바고</option>
                                 <option value="TN">튀니지</option>
                                 <option value="TR">터키</option>
                                 <option value="TM">투르크 메니스탄</option>
                                 <option value="TC">터크스 케이커스 제도</option>
                                 <option value="TV">투발루</option>
                                 <option value="UG">우간다</option>
                                 <option value="GB">영국</option>
                                 <option value="UA">우크라이나</option>
                                 <option value="AE">아랍에미리트</option>
                                 <option value="UY">우루과이</option>
                                 <option value="UZ">우즈베키스탄</option>
                                 <option value="VU">바누아투</option>
                                 <option value="VA">바티칸시국</option>
                                 <option value="VE">베네수엘라</option>
                                 <option value="VN">베트남</option>
                                 <option value="VG">영국령 버진아일랜드</option>
                                 <option value="VI">미국령 버진아일랜드</option>
                                 <option value="WF">월리스 푸투나</option>
                                 <option value="YE">남 예맨</option>
                                 <option value="ZM">잠비아</option>
                                 <option value="ZW">짐바브웨</option>
                                 <option value="AX">올란드 제도</option>
                                 <option value="AQ">남극</option>
                                 <option value="AC">어센션 섬</option>
                                 <option value="BV">부베 섬</option>
                                 <option value="IO">영국령인도양식민지</option>
                                 <option value="IC">카나리아 제도</option>
                                 <option value="BQ">네덜란드령 카리브</option>
                                 <option value="EA">세우타 &amp; 멜리야</option>
                                 <option value="CX">크리스마스 섬</option>
                                 <option value="CP">클리퍼턴 섬</option>
                                 <option value="CC">코코스 제도</option>
                                 <option value="CD">콩고민주공화국</option>
                                 <option value="CW">퀴라소</option>
                                 <option value="DG">디에고가르시아섬</option>
                                 <option value="TF">프랑스령 남부와 남극지역</option>
                                 <option value="GG">건지</option>
                                 <option value="HM">허드 맥도날드 제도</option>
                                 <option value="IM">맨 섬</option>
                                 <option value="JE">저지</option>
                                 <option value="XK">코소보</option>
                                 <option value="ME">몬테네그로</option>
                                 <option value="MP">북마리아나제도</option>
                                 <option value="PN">핏케언 제도</option>
                                 <option value="WS">사모아</option>
                                 <option value="RS">세르비아</option>
                                 <option value="SX">신트마르턴</option>
                                 <option value="GS">사우스조지아 사우스샌드위치 제도</option>
                                 <option value="SS">남수단</option>
                                 <option value="BL">성 바르톨로메오</option>
                                 <option value="MF">성마르탱섬</option>
                                 <option value="PM">성 피에르 앤드 미클롱</option>
                                 <option value="VC">세인트빈센트 그레나딘</option>
                                 <option value="SJ">스발바르 얀마옌 제도</option>
                                 <option value="SY">시리아</option>
                                 <option value="TL">동티모르</option>
                                 <option value="TK">토켈라우</option>
                                 <option value="TA">트리스탄다쿠냐 제도</option>
                                 <option value="UM">미국령 군소 제도</option>
                                 <option value="EH">서사하라</option>




                              </optgroup>

                           </select>
                        </div>
                     </div>
                  </div>

                  <div>
                     <div class="inputs">
                        <div class="inputs g_ib">
                           <header> 국가코드* </header>
                           <select id="phone" data-selected-value="82" name="p_country">

                              <option value="">선택하세요</option>
                              <option data-countrycode="KR" value="82">대한민국 (+82)</option>
                              <option data-countrycode="CN" value="86">중국 본토 (+86)</option>
                              <option data-countrycode="JP" value="81">일본 (+81)</option>
                              <option data-countrycode="US" value="1">미국 (+1)</option>
                              <option data-countrycode="TW" value="886">대만 (+886)</option>
                              <option data-countrycode="HK" value="852">홍콩 (+852)</option>
                              <option data-countrycode="PH" value="63">필리핀 (+63)</option>
                              <option data-countrycode="SG" value="65">싱가포르 (+65)</option>
                              <option data-countrycode="TH" value="66">태국 (+66)</option>
                              <option data-countrycode="MY" value="60">말레이시아 (+60)</option>

                              <optgroup label="기타" 국가="" 지역="">



                                 <option data-countrycode="MO" value="853">마카오 (+853)</option>

                                 <option data-countrycode="AU" value="61">호주 (+61)</option>
                                 <option data-countrycode="ID" value="62">인도네시아 (+62)</option>
                                 <option data-countrycode="IN" value="91">인도 (+91)</option>






                                 <option data-countrycode="DZ" value="213">알제리 (+213)</option>
                                 <option data-countrycode="AL" value="355">알바니아
                                    (+355)</option>
                                 <option data-countrycode="AF" value="93">아프가니스탄
                                    (+93)</option>
                                 <option data-countrycode="AS" value="1684">사모아
                                    (+1684)</option>
                                 <option data-countrycode="AD" value="376">안도라 (+376)</option>
                                 <option data-countrycode="AO" value="244">앙골라 (+244)</option>
                                 <option data-countrycode="AI" value="1264">앵귈라
                                    (+1264)</option>
                                 <option data-countrycode="AG" value="1268">앤티가바부다
                                    (+1268)</option>
                                 <option data-countrycode="AR" value="54">아르헨티나 (+54)</option>
                                 <option data-countrycode="AM" value="374">아르메니아
                                    (+374)</option>
                                 <option data-countrycode="AW" value="297">아루바 (+297)</option>
                                 <option data-countrycode="AT" value="43">오스트리아 (+43)</option>
                                 <option data-countrycode="AZ" value="994">아제르바이잔
                                    (+994)</option>
                                 <option data-countrycode="BS" value="1242">바하마
                                    (+1242)</option>
                                 <option data-countrycode="BH" value="973">바레인 (+973)</option>
                                 <option data-countrycode="BD" value="880">방글라데시
                                    (+880)</option>
                                 <option data-countrycode="BB" value="1246">바베이도스
                                    (+1246)</option>
                                 <option data-countrycode="BY" value="375">벨라루스
                                    (+375)</option>
                                 <option data-countrycode="BE" value="32">벨기에 (+32)</option>
                                 <option data-countrycode="BZ" value="501">벨리즈 (+501)</option>
                                 <option data-countrycode="BJ" value="229">베냉 (+229)</option>
                                 <option data-countrycode="BM" value="1441">버뮤다
                                    (+1441)</option>
                                 <option data-countrycode="BT" value="975">부탄 (+975)</option>
                                 <option data-countrycode="BO" value="591">볼리비아
                                    (+591)</option>
                                 <option data-countrycode="BA" value="387">보스니아
                                    헤르체고비나 (+387)</option>
                                 <option data-countrycode="BW" value="267">보츠와나
                                    (+267)</option>
                                 <option data-countrycode="BR" value="55">브라질 (+55)</option>
                                 <option data-countrycode="BN" value="673">브루나이
                                    (+673)</option>
                                 <option data-countrycode="BG" value="359">불가리아
                                    (+359)</option>
                                 <option data-countrycode="BF" value="226">부르키나파소
                                    (+226)</option>
                                 <option data-countrycode="BI" value="257">부룬디 (+257)</option>
                                 <option data-countrycode="KH" value="855">캄보디아
                                    (+855)</option>
                                 <option data-countrycode="CM" value="237">카메룬 (+237)</option>
                                 <option data-countrycode="CA" value="1">캐나다 (+1)</option>
                                 <option data-countrycode="CV" value="238">카보베르데 제도
                                    (+238)</option>
                                 <option data-countrycode="KY" value="1345">케이맨 제도
                                    (+1345)</option>
                                 <option data-countrycode="CF" value="236">중앙 아프리카
                                    공화국 (+236)</option>
                                 <option data-countrycode="CL" value="56">칠레 (+56)</option>
                                 <option data-countrycode="TD" value="235">차드 (+235)</option>
                                 <option data-countrycode="CO" value="57">콜롬비아 (+57)</option>
                                 <option data-countrycode="KM" value="269">코모로 (+269)</option>
                                 <option data-countrycode="CG" value="242">콩고 (+242)</option>
                                 <option data-countrycode="CK" value="682">쿡 제도
                                    (+682)</option>
                                 <option data-countrycode="CR" value="506">코스타리카
                                    (+506)</option>
                                 <option data-countrycode="CI" value="225">코트디부아르
                                    (+225)</option>
                                 <option data-countrycode="HR" value="385">크로아티아
                                    (+385)</option>
                                 <option data-countrycode="CU" value="53">쿠바 (+53)</option>
                                 <option data-countrycode="TRNC" value="392">북 키프로스
                                    (+392)</option>
                                 <option data-countrycode="CY" value="357">남 키프로스
                                    (+357)</option>
                                 <option data-countrycode="CZ" value="420">체코 공화국
                                    (+420)</option>
                                 <option data-countrycode="DK" value="45">덴마크 (+45)</option>
                                 <option data-countrycode="DJ" value="253">지부티 (+253)</option>
                                 <option data-countrycode="DM" value="1767">도미니카
                                    (+1767)</option>
                                 <option data-countrycode="DO" value="1">도미니카 공화국
                                    (+1)</option>
                                 <option data-countrycode="EC" value="593">에콰도르
                                    (+593)</option>
                                 <option data-countrycode="EG" value="20">이집트 (+20)</option>
                                 <option data-countrycode="SV" value="503">엘살바도르
                                    (+503)</option>
                                 <option data-countrycode="GQ" value="240">적도 기니
                                    (+240)</option>
                                 <option data-countrycode="ER" value="291">에리트레아
                                    (+291)</option>
                                 <option data-countrycode="EE" value="372">에스토니아
                                    (+372)</option>
                                 <option data-countrycode="ET" value="251">에티오피아
                                    (+251)</option>
                                 <option data-countrycode="FK" value="500">포클랜드 제도
                                    (+500)</option>
                                 <option data-countrycode="FO" value="298">페로 제도
                                    (+298)</option>
                                 <option data-countrycode="FJ" value="679">피지 (+679)</option>
                                 <option data-countrycode="FI" value="358">핀란드 (+358)</option>
                                 <option data-countrycode="FR" value="33">프랑스 (+33)</option>
                                 <option data-countrycode="GF" value="594">프랑스령 기아나
                                    (+594)</option>
                                 <option data-countrycode="PF" value="689">프랑스령 폴리네시아
                                    (+689)</option>
                                 <option data-countrycode="GA" value="241">가봉 (+241)</option>
                                 <option data-countrycode="GM" value="220">감비아 (+220)</option>
                                 <option data-countrycode="GE" value="995">조지아 (+995)</option>
                                 <option data-countrycode="DE" value="49">독일 (+49)</option>
                                 <option data-countrycode="GH" value="233">가나 (+233)</option>
                                 <option data-countrycode="GI" value="350">지브롤터
                                    (+350)</option>
                                 <option data-countrycode="GR" value="30">그리스 (+30)</option>
                                 <option data-countrycode="GL" value="299">그린란드
                                    (+299)</option>
                                 <option data-countrycode="GD" value="1473">그레나다
                                    (+1473)</option>
                                 <option data-countrycode="GP" value="590">과들루프
                                    (+590)</option>
                                 <option data-countrycode="GU" value="1671">괌 (+1671)</option>
                                 <option data-countrycode="GT" value="502">과테말라
                                    (+502)</option>
                                 <option data-countrycode="GN" value="224">기니 (+224)</option>
                                 <option data-countrycode="GW" value="245">기니 - 비사우
                                    (+245)</option>
                                 <option data-countrycode="GY" value="592">가이아나
                                    (+592)</option>
                                 <option data-countrycode="HT" value="509">아이티 (+509)</option>
                                 <option data-countrycode="HN" value="504">온두라스
                                    (+504)</option>
                                 <option data-countrycode="HU" value="36">헝가리 (+36)</option>
                                 <option data-countrycode="IS" value="354">아이슬란드
                                    (+354)</option>
                                 <option data-countrycode="IR" value="98">이란 (+98)</option>
                                 <option data-countrycode="IQ" value="964">이라크 (+964)</option>
                                 <option data-countrycode="IE" value="353">아일랜드
                                    (+353)</option>
                                 <option data-countrycode="IL" value="972">이스라엘
                                    (+972)</option>
                                 <option data-countrycode="IT" value="39">이탈리아 (+39)</option>
                                 <option data-countrycode="JM" value="1876">자메이카
                                    (+1876)</option>
                                 <option data-countrycode="JO" value="962">요르단 (+962)</option>
                                 <option data-countrycode="KZ" value="7">카자흐스탄 (+7)</option>
                                 <option data-countrycode="KE" value="254">케냐 (+254)</option>
                                 <option data-countrycode="KI" value="686">키리바시
                                    (+686)</option>
                                 <option data-countrycode="KP" value="850">북한 (+850)</option>
                                 <option data-countrycode="KW" value="965">쿠웨이트
                                    (+965)</option>
                                 <option data-countrycode="KG" value="996">키르기스탄
                                    (+996)</option>
                                 <option data-countrycode="LA" value="856">라오스 (+856)</option>
                                 <option data-countrycode="LV" value="371">라트비아
                                    (+371)</option>
                                 <option data-countrycode="LB" value="961">레바논 (+961)</option>
                                 <option data-countrycode="LS" value="266">레소토 (+266)</option>
                                 <option data-countrycode="LR" value="231">라이베리아
                                    (+231)</option>
                                 <option data-countrycode="LY" value="218">리비아 (+218)</option>
                                 <option data-countrycode="LI" value="423">리히텐슈타인
                                    (+423)</option>
                                 <option data-countrycode="LT" value="370">리투아니아
                                    (+370)</option>
                                 <option data-countrycode="LU" value="352">룩셈부르크
                                    (+352)</option>
                                 <option data-countrycode="MK" value="389">마케도니아
                                    (+389)</option>
                                 <option data-countrycode="MG" value="261">마다가스카르
                                    (+261)</option>
                                 <option data-countrycode="MW" value="265">말라위 (+265)</option>
                                 <option data-countrycode="MV" value="960">몰디브 (+960)</option>
                                 <option data-countrycode="ML" value="223">말리 (+223)</option>
                                 <option data-countrycode="MT" value="356">몰타 (+356)</option>
                                 <option data-countrycode="MH" value="692">마샬 제도
                                    (+692)</option>
                                 <option data-countrycode="MQ" value="596">마르티니크
                                    (+596)</option>
                                 <option data-countrycode="MR" value="222">모리타니
                                    (+222)</option>
                                 <option data-countrycode="YT" value="262">마요트 섬
                                    (+262)</option>
                                 <option data-countrycode="MU" value="230">모리셔스
                                    (+230)</option>
                                 <option data-countrycode="MX" value="52">멕시코 (+52)</option>
                                 <option data-countrycode="FM" value="691">미크로네시아
                                    (+691)</option>
                                 <option data-countrycode="MD" value="373">몰도바 (+373)</option>
                                 <option data-countrycode="MC" value="377">모나코 (+377)</option>
                                 <option data-countrycode="MN" value="976">몽골 (+976)</option>
                                 <option data-countrycode="MS" value="1664">몬세라트
                                    (+1664)</option>
                                 <option data-countrycode="MA" value="212">모로코 (+212)</option>
                                 <option data-countrycode="MZ" value="258">모잠비크
                                    (+258)</option>
                                 <option data-countrycode="MM" value="95">미얀마 (+95)</option>
                                 <option data-countrycode="NA" value="264">나미비아
                                    (+264)</option>
                                 <option data-countrycode="NR" value="674">나우루 (+674)</option>
                                 <option data-countrycode="NP" value="977">네팔 (+977)</option>
                                 <option data-countrycode="NL" value="31">네덜란드 (+31)</option>
                                 <option data-countrycode="AN" value="599">네덜란드령 앤틸리스
                                    (+599)</option>
                                 <option data-countrycode="NC" value="687">뉴칼레도니아
                                    (+687)</option>
                                 <option data-countrycode="NZ" value="64">뉴질랜드 (+64)</option>
                                 <option data-countrycode="NI" value="505">니카라과
                                    (+505)</option>
                                 <option data-countrycode="NE" value="227">니제르 (+227)</option>
                                 <option data-countrycode="NG" value="234">나이지리아
                                    (+234)</option>
                                 <option data-countrycode="NU" value="683">니우에 (+683)</option>
                                 <option data-countrycode="NF" value="672">노포크 제도
                                    (+672)</option>
                                 <option data-countrycode="NO" value="47">노르웨이 (+47)</option>
                                 <option data-countrycode="OM" value="968">오만 (+968)</option>
                                 <option data-countrycode="PW" value="680">팔라우 (+680)</option>
                                 <option data-countrycode="PS" value="970">팔레스타인
                                    (+970)</option>
                                 <option data-countrycode="PA" value="507">파나마 (+507)</option>
                                 <option data-countrycode="PG" value="675">파푸아 뉴 기니
                                    (+675)</option>
                                 <option data-countrycode="PY" value="595">파라과이
                                    (+595)</option>
                                 <option data-countrycode="PE" value="51">페루 (+51)</option>
                                 <option data-countrycode="PK" value="92">파키스탄 (+92)</option>
                                 <option data-countrycode="PL" value="48">폴란드 (+48)</option>
                                 <option data-countrycode="PT" value="351">포르투갈
                                    (+351)</option>
                                 <option data-countrycode="PR" value="1">푸에르토리코 (+1)</option>
                                 <option data-countrycode="QA" value="974">카타르 (+974)</option>
                                 <option data-countrycode="RE" value="262">레위니옹
                                    (+262)</option>
                                 <option data-countrycode="RO" value="40">루마니아 (+40)</option>
                                 <option data-countrycode="RU" value="7">러시아 (+7)</option>
                                 <option data-countrycode="RW" value="250">르완다 (+250)</option>
                                 <option data-countrycode="SM" value="378">산마리노
                                    (+378)</option>
                                 <option data-countrycode="ST" value="239">상투메프린시페
                                    (+239)</option>
                                 <option data-countrycode="SA" value="966">사우디 아라비아
                                    (+966)</option>
                                 <option data-countrycode="SN" value="221">세네갈 (+221)</option>
                                 <option data-countrycode="CS" value="381">세르비아
                                    (+381)</option>
                                 <option data-countrycode="SC" value="248">세이셸 (+248)</option>
                                 <option data-countrycode="SL" value="232">시에라리온
                                    (+232)</option>
                                 <option data-countrycode="SK" value="421">슬로바키아
                                    (+421)</option>
                                 <option data-countrycode="SI" value="386">슬로베니아
                                    (+386)</option>
                                 <option data-countrycode="SB" value="677">솔로몬 제도
                                    (+677)</option>
                                 <option data-countrycode="SO" value="252">소말리아
                                    (+252)</option>
                                 <option data-countrycode="ZA" value="27">남아프리카 공화국
                                    (+27)</option>
                                 <option data-countrycode="ES" value="34">스페인 (+34)</option>
                                 <option data-countrycode="LK" value="94">스리랑카 (+94)</option>
                                 <option data-countrycode="SH" value="290">세인트 헬레나
                                    (+290)</option>
                                 <option data-countrycode="KN" value="1869">세인트 키츠
                                    (+1869)</option>
                                 <option data-countrycode="LC" value="1758">세인트 루시아
                                    (+1758)</option>
                                 <option data-countrycode="SD" value="249">수단 (+249)</option>
                                 <option data-countrycode="SR" value="597">수리남 (+597)</option>
                                 <option data-countrycode="SZ" value="268">스와질란드
                                    (+268)</option>
                                 <option data-countrycode="SE" value="46">스웨덴 (+46)</option>
                                 <option data-countrycode="CH" value="41">스위스 (+41)</option>
                                 <option data-countrycode="TJ" value="992">타지키스탄
                                    (+992)</option>
                                 <option data-countrycode="TZ" value="255">탄자니아
                                    (+255)</option>
                                 <option data-countrycode="TG" value="228">토고 (+228)</option>
                                 <option data-countrycode="TO" value="676">통가 (+676)</option>
                                 <option data-countrycode="TT" value="1868">트리니다드 토바고
                                    (+1868)</option>
                                 <option data-countrycode="TN" value="216">튀니지 (+216)</option>
                                 <option data-countrycode="TR" value="90">터키 (+90)</option>
                                 <option data-countrycode="TM" value="993">투르크 메니스탄
                                    (+993)</option>
                                 <option data-countrycode="TC" value="1649">터크스 케이커스
                                    제도 (+1649)</option>
                                 <option data-countrycode="TV" value="688">투발루 (+688)</option>
                                 <option data-countrycode="UG" value="256">우간다 (+256)</option>
                                 <option data-countrycode="GB" value="44">영국 (+44)</option>
                                 <option data-countrycode="UA" value="380">우크라이나
                                    (+380)</option>
                                 <option data-countrycode="AE" value="971">아랍에미리트
                                    (+971)</option>
                                 <option data-countrycode="UY" value="598">우루과이
                                    (+598)</option>
                                 <option data-countrycode="UZ" value="998">우즈베키스탄
                                    (+998)</option>
                                 <option data-countrycode="VU" value="678">바누아투
                                    (+678)</option>
                                 <option data-countrycode="VA" value="379">바티칸시국
                                    (+379)</option>
                                 <option data-countrycode="VE" value="58">베네수엘라 (+58)</option>
                                 <option data-countrycode="VN" value="84">베트남 (+84)</option>
                                 <option data-countrycode="VG" value="1284">영국령
                                    버진아일랜드 (+1284)</option>
                                 <option data-countrycode="VI" value="1340">미국령
                                    버진아일랜드 (+1340)</option>
                                 <option data-countrycode="WF" value="681">월리스 푸투나
                                    (+681)</option>
                                 <option data-countrycode="YE" value="967">남 예맨
                                    (+967)</option>
                                 <option data-countrycode="ZM" value="260">잠비아 (+260)</option>
                                 <option data-countrycode="ZW" value="263">짐바브웨
                                    (+263)</option>
                                 <option data-countrycode="AX" value="358">올란드 제도
                                    (+358)</option>
                                 <option data-countrycode="AQ" value="672">남극 (+672)</option>
                                 <option data-countrycode="AC" value="247">어센션 섬
                                    (+247)</option>
                                 <option data-countrycode="BV" value="47">부베 섬 (+47)</option>
                                 <option data-countrycode="IO" value="246">영국령인도양식민지
                                    (+246)</option>
                                 <option data-countrycode="IC" value="34">카나리아 제도
                                    (+34)</option>
                                 <option data-countrycode="BQ" value="599">네덜란드령 카리브
                                    (+599)</option>
                                 <option data-countrycode="EA" value="34">세우타 &amp;
                                    멜리야 (+34)</option>
                                 <option data-countrycode="CX" value="61">크리스마스 섬
                                    (+61)</option>
                                 <option data-countrycode="CP" value="33">클리퍼턴 섬
                                    (+33)</option>
                                 <option data-countrycode="CC" value="61">코코스 제도
                                    (+61)</option>
                                 <option data-countrycode="CD" value="243">콩고민주공화국
                                    (+243)</option>
                                 <option data-countrycode="CW" value="599">퀴라소 (+599)</option>
                                 <option data-countrycode="DG" value="246">디에고가르시아섬
                                    (+246)</option>
                                 <option data-countrycode="TF" value="262">프랑스령 남부와
                                    남극지역 (+262)</option>
                                 <option data-countrycode="GG" value="441481">건지
                                    (+441481)</option>
                                 <option data-countrycode="HM" value="672">허드 맥도날드 제도
                                    (+672)</option>
                                 <option data-countrycode="IM" value="441624">맨 섬
                                    (+441624)</option>
                                 <option data-countrycode="JE" value="441534">저지
                                    (+441534)</option>
                                 <option data-countrycode="XK" value="383">코소보 (+383)</option>
                                 <option data-countrycode="ME" value="382">몬테네그로
                                    (+382)</option>
                                 <option data-countrycode="MP" value="1670">북마리아나제도
                                    (+1670)</option>
                                 <option data-countrycode="PN" value="64">핏케언 제도
                                    (+64)</option>
                                 <option data-countrycode="WS" value="685">사모아 (+685)</option>
                                 <option data-countrycode="RS" value="381">세르비아
                                    (+381)</option>
                                 <option data-countrycode="SX" value="1721">신트마르턴
                                    (+1721)</option>
                                 <option data-countrycode="GS" value="500">사우스조지아
                                    사우스샌드위치 제도 (+500)</option>
                                 <option data-countrycode="SS" value="211">남수단 (+211)</option>
                                 <option data-countrycode="BL" value="590">성 바르톨로메오
                                    (+590)</option>
                                 <option data-countrycode="MF" value="590">성마르탱섬
                                    (+590)</option>
                                 <option data-countrycode="PM" value="508">성 피에르 앤드
                                    미클롱 (+508)</option>
                                 <option data-countrycode="VC" value="1784">세인트빈센트
                                    그레나딘 (+1784)</option>
                                 <option data-countrycode="SJ" value="47">스발바르 얀마옌 제도
                                    (+47)</option>
                                 <option data-countrycode="SY" value="963">시리아 (+963)</option>
                                 <option data-countrycode="TL" value="670">동티모르
                                    (+670)</option>
                                 <option data-countrycode="TK" value="690">토켈라우
                                    (+690)</option>
                                 <option data-countrycode="TA" value="290">트리스탄다쿠냐 제도
                                    (+290)</option>
                                 <option data-countrycode="UM" value="1">미국령 군소 제도
                                    (+1)</option>
                                 <option data-countrycode="EH" value="212">서사하라
                                    (+212)</option>
                              </optgroup>


                           </select>

                        </div>
                        <div class="inputs g_ib">
                           <input type="text" id="phone1" name="tel"
                              placeholder="핸드폰 번호(긴급상황 대비)" value="${user.phone}"/>
                        </div>
                     </div>

                  </div>
                  <div class="m_justify_list">
                     <div class="inputs">
                        <header>이메일 주소(해당 이메일 주소로 바우처가 발송됩니다. 올바르게 입력했는지
                           확인하세요.)</header>
                        <input type="email" name="myemail" placeholder="이메일 주소" value="${user.myemail}">
                        
                     </div>
                  </div>
               </div>
               </c:forEach>




               <input type="text" id="pname1" name="name" />
                <input type="text"
                  id="amount1" name="amount">

            </section>
            <!-- 위 section  -->

         </form>

         <section class="part">
            <header>
               <h2 class="t20">②결제수단</h2>
            </header>
            <div class="wrap">
               <div>
                  <input type="radio" value="1" name="pay" /><span>신용/체크카드</span><span
                     class="card"><img src="/semiproject/image/visa.png" id="visa">
                     <img src="/semiproject/image/mastercard.png" id="master"> <img
                     src="/semiproject/image/express.png" id="express"></span>
               </div>
               <div class="pay_wrap">
                  <input type="radio" value="2" name="pay" /><span>Paypal</span><span
                     class="card"><img src="/semiproject/image/paypal.png"
                     id="paypal1"></span>
               </div>
               <div class="pay_wrap">
                  <input type="button" id="btn" value="바로 결제" />
               </div>
            </div>
         </section>
         <!--왼쪽위 form  -->
      </div>
      <!--전체 div  -->

      <div class="g_right">
         <section>
          <c:forEach items="${sessionScope.aList}" var="dto">
          <c:set var="count" value="${count + 1}" />
            <div class="total_box tt" id="total1">
               <header>
                  <h2 id="pname">${dto.title}</h2>

               </header>
               <div class=" t_right pack_info">
                  <div class="info">
                     <span class="t_gray t_left">날짜</span>

                     <div>${dto.day}</div>

                  </div>
                  <div class="units_box info">
                     <span class="t_gray t_left">수량</span>
                     <div>
                        <p>${dto.pnum} x 성인</p>
                     </div>
                  </div>

                  <div class="wifi">
                     <div class="tab showWifi">
                        <div>패키지 상세정보</div>
                        <div><span>v</span></div>
                     </div>
                     <div class="info">
                        <span class="t_gray t_left" id="op">옵션 선택</span>
                        <div>${dto.options}</div>
                     </div>

                  </div>
                  <div class="info">

                     <span class="t_gray t_left">결제 금액</span>
                     <div id="price${count}">₩${dto.price}</div>

                  </div>
               </div>
            </div>
           </c:forEach>
            <div class="j_f_box total_box" id="pay_total">
               <div id="pay_total_box">
                  <div class="info" id="totalprice">
                     <span class="t_gray t_left">총금액</span>

                     <div>
                        <span>₩</span><span id="amount"></span>
                     </div>



                  </div>

               </div>
            </div>
         </section>



      </div>


   </section>







   <!-- last section -->






</body>
</html>