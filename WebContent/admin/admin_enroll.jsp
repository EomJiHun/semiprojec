<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/admin_enroll.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div id="content_wrap">
  <form  id="frm" action="/semiproject/semi/admin/product_write" method="post">
  <label for="fname" id="title " name="title ">상품제목</label>
  <br/>
  <input type="text" id="title " name="title" value="John"> <br/>
  
  <label for="lname">카테고리 구분ID</label> <br/>
  <select id="cid" name="cid">
  	<option value="1">액티비티</option>
  	<option value="2">공연</option>
  	<option value="3">대중교통</option>
  	<option value="4">맛집</option>
  </select>
  <br/>
  
  <label for="lname">출시가격</label> <br/>
  <input type="text" id="price " name="price" value="Doe"> <br/>
  
  <label for="lname">옵션</label> <br/>
  <input type="text" id="options " name="options" value="Doe"> <br/>
  
  <br/>
  <input type="submit" id="save" value="저장" style="width: 9%;height: 3%;" />
   <input type="reset" value="취소" style="width: 9%; height: 3%;"/>
  
  
</form>
</div>
<script type="text/javascript"
	src="/semiproject/js/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascripte" src="/semiproject/js/admin_enroll.js"></script>
