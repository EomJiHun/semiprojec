<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reserveConfirm</title>
<link rel="stylesheet" type="text/css" href="/semiproject/css/common_nav.css">
<link rel="stylesheet" type="text/css" href="/semiproject/css/reserveConfirm.css">
<link rel="stylesheet" type="text/css" href="/semiproject/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>
<body>
<!-- common_nav -->
<jsp:include page="/fragment/common_nav.jsp"></jsp:include>

<div class="step-box">
 <div class="step-state step3">
        <ul>	
            <li><p>장바구니</p></li>
            <li><p>주문 | 결제</p></li>
            <li><p>주문완료</p></li>
        </ul>
 </div>
</div>
<div class="res-message">
  <p id="res-me-text">"고객아이디"님이  정상적으로 완료 되었습니다</p>
  <p >이용해 주셔서 감사합니다</p>
  <p >자세한 주문내용은 마이페이지에서 확인하든가</p>
</div>

 <!-- 승인번호 창 -->
  <h1 class="a">"고객아이디"님의 주문번호: 00ASDE11122 </h1>
  
  <!-- 결제금액 보여주기창 -->
  
  <table id="customers" >
  <tr>
    <th>상품이름</th>
    <td>런던 이용권</td>
  </tr>
  <tr>
    <th>상점거래 ID</th>
    <td>merdfsf--736631</td>
  </tr>
  <tr>
    <th>주문금액</th>
    <td>140 원</td>
  </tr>
  <tr>
    <th style="color:#A52A2A">최종결제금액</th>
    <td style="color:#A52A2A">1000000원</td>
  </tr>
  </table>
  
  <!-- 결제 세부사항창 -->
   <table id="customers">
  <tr>
    <th>결제 수단</th>
    <td>카드</td>
  </tr>
  <tr>
    <th>결제 여부</th>
    <td>결제 완료(승인)</td>
  </tr>
  <tr>
    <th>결제 일시</th>
    <td>2019-07-07</td>
  </tr>
  </table>
  
  <div class="res-ok">
  <a href="#" style="color:white"><button class="button-ok" >주문완료확인</button></a>
  </div>
  
  
<!-- Footer -->
<jsp:include page="/fragment/footer.jsp"></jsp:include>
</body>
</html>