<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/semiproject/js/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_notice.css">


<div id="content_wrap">
	<form id="frm" action="/semiproject/semi/admin/notice_write" method="post">
		<table width="100%" height="400px">
	
	
		    <tr>
			<td>category</td>
			<td style="text-align: left;">
				<select class="form-control" name="state" style="width:400px;">
					<option value="1">예약</option>
					<option value="2">결제</option>
					<option value="3">변경&환불</option>
					<option value="4">계정</option>
				</select>
			</td>
		    </tr>
		        <tr>
		            <td style="font-size:15px;">제목</td>
		            <td><input type="text" id="title" name="title" style="width:400px; height: 20px; font-size: 15px;"/></td>
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
<script type="text/javascripte" src="/semiproject/js/admin_notice.js"></script>
