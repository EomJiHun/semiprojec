<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"  %>
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
<%
String email=request.getParameter("email");
String amount=request.getParameter("amount");
String name=request.getParameter("name");// 주문상품명
String merchant_uid=request.getParameter("merchant_uid");// 주문번호

 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy년MM월dd일");
 String today = formatter.format(new java.util.Date());

 /* out.println(today); */

%>

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
  <p id="res-me-text">"결제가 완료되었습니다"</p>
  <p >이용해 주셔서 감사합니다</p>
  <p >입력하신 <%=email %>로 바우처가 발송되었습니다</p>
</div>

 <!-- 승인번호 창 -->
  <h1 class="a">"고객아이디"님의 주문번호:<%=merchant_uid %> </h1>
  
  <!-- 결제금액 보여주기창 -->
  
  <table id="customers" >
  <tr>
    <th>상품이름</th>
    <td><%=name%></td>
  </tr>
  <tr>
    <th style="color:#A52A2A">최종결제금액</th>
    <td style="color:#A52A2A"><%=amount %></td>
  </tr>
  </table>
  
  <!-- 결제 세부사항창 -->
   <table id="customers">
  <tr>
    <th>결제 수단</th>
    <td>카드</td>
  </tr>
  <tr>
    <th>결제여부</th>
    <td>결제 완료(승인)</td>
  </tr>
  <tr>
    <th>결제일시</th>
    <td><%=today %></td>
  </tr>
  </table>
  
  <div class="res-ok">
  <a href="/semiproject/user/ReserveList" style="color:white"><button class="button-ok" >주문완료확인</button></a>
  </div>
  
  
<!-- Footer -->

</body>
</html>