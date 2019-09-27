<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_infoEnroll.css">

<div class="table_wrap">
<form action="/semiproject/semi/admin/admin_info_enroll" method="post" id="frm">
	<table class="answer_table">
		<tr>
			<td style="border:0">아이디</td>
			<td><input type="text" name="id" id="id" required/></td>
		</tr>
		<tr>
			<td style="border:0">비밀번호</td>
			<td><input type="password" name="pwd" id="pwd" required/></td>
		</tr>
		<tr>
			<td style="border:0">비밀번호확인</td>
			<td><input type="password" name="pwdcon" id="pwdcon" required/></td>
		</tr>
		<tr>
			<td style="border:0">이름</td>
			<td><input type="text" name="name" id="name" required/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" name="generate" id="generate" value="생성"/></td>
		</tr>
	</table>
</form>
</div>
<script src="/semiproject/js/admin_infoEnroll.js"></script>