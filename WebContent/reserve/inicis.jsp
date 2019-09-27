<%@page import="semi.model.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = ""; //제목
		String myemail = ""; //내이메일
		String tel = ""; //전화번호
		String fname = ""; 
		String lname = "";
		int amount = 1111;
        String country=request.getParameter("country");
        String p_country= request.getParameter("p_country");
        System.out.println(p_country);
		name = request.getParameter("name");

		myemail = request.getParameter("myemail");

		tel = request.getParameter("tel");//전화번호

		fname = request.getParameter("payname"); //이름

		lname = request.getParameter("payname1"); //성

		if (request.getParameter("amount") != null) {
			String amount1 = request.getParameter("amount").replace(",", "");
			amount = Integer.parseInt(amount1);
		}
		
		UserDTO dto= new UserDTO();
		dto.setCountry(country);
		dto.setMyemail(myemail);
		dto.setPhone(tel);
		dto.setP_country(p_country);
		dto.setFname(fname);
		dto.setLname(lname);
		dto.setEmail((String)session.getAttribute("email"));
	    session.removeAttribute("user"); //selectMethod로 계정설정 정보가져온거 삭제
	    session.setAttribute("udto", dto);//계정설정 안내용들 가져와서 넣음
		
		
	%>
	<div>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
		<script type="text/javascript">





var IMP = window.IMP; // 생략가능
IMP.init('imp47139045'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : "<%=name%>", //주문명
    amount :<%=amount%>, //가격
    buyer_email : "<%=myemail%>", //이메일
    buyer_name : "<%=lname + fname%>", //주문자명
    buyer_tel : "<%=tel%>", //전화번호
}, function(rsp) {
    if ( rsp.success ) {
    	//결제성공시
    	var param={	"imp_uid" : rsp.imp_uid ,
    			"merchant_uid":rsp.merchant_uid,
    			"title":"<%=name%>"
    			
    		     //추가해야할것들 : member update위한 값들 , reserve에 update위한 값인데 ArrayList 걍넘길수있나
    		     	
    	
    	}
    	/* alert(rsp.imp_uid);
    	var jsonParam=JSON.stringify(param);
    	alert(jsonParam); */
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	jQuery.ajax({
    		 url: "../inicis.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    		type: 'POST',
    		dataType: 'json', //json형태로받는다
    		//내가 josn형태로 보낸다
    		data:param
	    	
	    		//기타 필요한 데이터가 있으면 추가 전달
    		
    	}).done(function(data) {
    		
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		// data.res 
    		
    		if (rsp.status=="paid") {
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;

    			
    		} else {
    			 session.removeAttribute("aList");
    		        session.removeAttribute("num");
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    		 window.opener.location.href=
    			 "<%=request.getContextPath()%>/reserve/reserveOk.jsp?email="+rsp.buyer_email+"&amount="+rsp.paid_amount+"&merchant_uid="+rsp.merchant_uid+"&name="+rsp.name;
    		 window.close();
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
       <%-- 결제 에러페이지 만들기  //window.opener.location.href='<%=request.getContextPath()%>/test/reserveConfirm.jsp?msg='+msg;
		// window.close(); --%>
        alert(msg);
								}
							});
		</script>
	</div>
</body>
</html>