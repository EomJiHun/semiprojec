<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script><!-- jQuery CDN --->
</head>
<body>
<button onclick="cancelPay()">환불하기</button>
  
  <script>
    function cancelPay() {
      jQuery.ajax({
        "url": "http://localhost:8090/semidemo/refunda",
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
          "merchant_uid": "merchant_1565079693544", // 주문번호
          "cancel_request_amount": 2000, // 환불금액
          "reason": "테스트 결제 환불" // 환불사유
      
        }),
        "dataType": "json"
      });
    }
  </script>
</body>
</html>