<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/semiproject/css/enroll_detail.css">


<div id="content_wrap">
	<form id="frm" action="/semiproject/semi/product/enroll_detail" method="post" enctype="multipart/form-data">
		<table width="100%" height="400px">
			<tr style="font-size: 15px;">
				<td width="3%">상품명 </td>
				<td width="97%">${sessionScope.title}</td>
			</tr>
		    <tr>
				<td width="3%" style="font-size:15px;">도시</td>
				<td width="97%">
					<input style="width: 30%; height: 35px;"type="text" id="city" name="city" /></td>
		    </tr>
		    <tr>
				<td style="font-size:15px;">사진추가<input type="file" name="filepath" id="filepath" multiple="multiple" /></td>
				<td><img src="" style="width: 200px; height: 100px;" /></td>
		    </tr>
		    <tr>
		        <td style="font-size:15px;">내용</td>
		        <td>
		            <textarea rows="10" cols="30" id="ir1" name="content" style="width:400px; height:350px; "></textarea>
		            </td>
		    </tr>
		    <tr>
		       <td colspan="2" style="font-size:15px; text-align:center">
		           <input type="button" id="save" value="저장" style="width: 7%;"/>
		           <input type="button" value="취소" style="width: 7%;" onclick='location.href="/semiproject/semi/admin"'/>
		       </td>
		    </tr>
		</table>
	</form>
</div>
<script type="text/javascript" src="/semiproject/js/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascripte" src="/semiproject/js/enroll_detail.js"></script>
