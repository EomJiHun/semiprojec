<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/question_text.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/semiproject/js/notis.js"></script>

</head>
<body>

<form action="quse_sub.do" name="bord">
	<br>
	<h3>질문</h3>
		<table class="table table-striped">
		 <c:forEach items="${sessionScope.aList}" var="dto">
			<tbody>
				<tr class="text-center">
					<td width="10%" align="center">번호</td>
					<th><input type="text" id="no" name="no"  value="${dto.no}" readonly/></th>
				</tr>
				<tr class="text-center">
					<td width="10%" align="center">제목</td>
					<th><input type="text" id="title" name="title" value="${dto.title}" readonly/></th>
				</tr>
				<tr class="text-center">
					<td width="10%" align="center">내용</td>
					<td width="70%"><textarea name="content" name="content" rows="8" cols="40" readonly>${dto.content}</textarea></td>
				</tr>			
				<tr class="text-center">
					<td width="10%" align="center">작성자</td>
					<th><input type="text" id="email" name="email"  value="${dto.email}" readonly/></th>
				</tr>
				<tr class="text-center">
					<td width="10%" align="center">날짜</td>
					<th><input type="text" id="day" name="day" value="${dto.day}" readonly/></th>
				</tr>
			</tbody>
				
			 </c:forEach> 
				<tr></tr>
			<tfoot>
				<tr class="text-center">
					<c:choose>
						<c:when test="${!(empty sessionScope.adminName)}">
							<td width="10%" align="center">답변</td>
					<th><input type="text" name="coments" placeholder="댓글을 입력하세요" style="width:300px; "><span><input type="submit" name="submit" class="review_btn" value="댓글등록"></span></th>
						</c:when>
						<c:otherwise>
							<td width="10%" align="center">답변</td>
					<th><input type="text" name="coments" placeholder="댓글을 입력하세요" style="width:300px; "><span><input type="submit" name="submit" class="review_btn" value="댓글등록"></span></th>
						</c:otherwise>
					</c:choose>
				</tr>
				<c:forEach items="${sessionScope.repl}" var="a">
				<tr class="text_reple">
					<td width="20%" align="center">댓글</td>
					<th><p>${a.comments}</p>
					작성자 : ${a.email}</th>
			
				</tr>
				</c:forEach>
			</tfoot>
		</table>
		<c:choose>
			<c:when test="${!(empty sessionScope.adminName)}">
				<c:set var="writer" value="${sessionScope.adminName}" />
			</c:when>
			<c:when test="${!(empty sessionScope.name)}">
				<c:set var="writer" value="${sessionScope.name}" />
			</c:when>
		</c:choose>
		<input type="hidden" name="writer" value="${writer}" />
		<input type="button" class="return" value="되돌아가기"/>
		<%
		
			  session.removeAttribute("aList");
			  session.removeAttribute("repl");
		%>
</form>
</body>
</html>