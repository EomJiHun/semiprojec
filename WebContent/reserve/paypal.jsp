<%@page import="semi.model.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

     <%
    request.setCharacterEncoding("UTF-8");
%>
<%
   //실행이 두번되서 null값이 들어와 밑에 if문으로 null값 방지
   String name=null;
   String myemail=null;
   String tel=null;
   String fname=null;
   String lname=null;
   int amount=11111;
  
   
   
	   name=request.getParameter("name");
   
       session.setAttribute("title", name);
	   myemail=request.getParameter("myemail");
   
  
	   tel=request.getParameter("tel");
   
   
	   fname=request.getParameter("payname");
   
   
	   lname=request.getParameter("payname1");
	   
	   String country=request.getParameter("country");
       String p_country= request.getParameter("p_country");
	   if(request.getParameter("amount")!=null)
	   {
		   String amount1=request.getParameter("amount").replace(",", "");
		  int amount2=Integer.parseInt(amount1);
		   amount=(amount2/1000);
	   }
   
	  /*  System.out.println("amount :" + request.getParameter("amount"));
	    */
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


</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
var IMP = window.IMP; // 생략가능
IMP.init('imp83304631'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
IMP.request_pay({
    pg : 'paypal', // version 1.1.0부터 지원.
    pay_method : 'card', 
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : "<%=name%>", //주문명
    amount :<%=amount%>, //가격
    currency : 'USD',
    buyer_email : "<%=myemail%>", //이메일
    buyer_name : "<%=lname+fname%>", //주문자명
    buyer_tel : "<%=tel%>" ,   //전화번호
    m_redirect_url : 'http://localhost:8090/semiproject/reserve/paypalparam.jsp'

})
</script>
</body>
</html>