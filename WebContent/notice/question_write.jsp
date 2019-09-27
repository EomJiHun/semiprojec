<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/question_write.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/semiproject/js/notise_write.js"></script>

</head>
<body>
<form  method="post" class="text-center">
	<br>
	<h3>질문하기</h3>
		<table class="table" style="background-color: #81BEF7;">
			<tbody>
				<tr class="text-name text-center">
					<td width="20%" align="center">이메일</td>
					<th><input type="text" name="email" value="${sessionScope.name}" readonly /></th>
				</tr>
				<tr class="text-title text-center">
					<td width="20%" align="center" >제목</td>
					<th><input type="text" name="title" placeholder="제목"/></th>
					
				</tr>
				
				<tr class="text-contents text-center">
					<td width="20%" align="center" >내용</td>
					<td width="80%"><textarea id="coment" name="content" rows="13" cols="40"></textarea></td>
				</tr>
			
			</tbody>
		</table>
		<input  type="submit" class="submit" value="제출하기"/>
		<input  type="button" class="return" value="돌아가기"/>
</form>

</body>
</html>