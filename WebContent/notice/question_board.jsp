<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/question_board.css">

<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/semiproject/js/notis.js"></script>

</head>
<body>
<input type="hidden" name="pageNum" id="pageNum" value="${sessionScope.pageNum}" />
<form action="list" method="post" name="form">
<br>
	<div class="contarner">
		<h3>질문 및 답변</h3>
		<table class="table table-striped">
			
			<thead>
				<tr>
					<td class="col-sm-1">번호</td>
					<td class="col-sm-2">제목</td>
					<td class="col-sm-1">작성자</td>
					<td class="col-sm-1">날짜</td>
					<td class="col-sm-1">조회수</td>
				</tr>
			</thead>
			<c:forEach items="${sessionScope.aList}" var="dto">
			<tbody>
				<tr>
					<td>
						<input type="hidden" name="number" id="number" value="${dto.no}" />
					<c:choose>
						<c:when test="${!(empty sessionScope.adminName)}">
							<input type="checkbox" name="chk" id="chk" style="width: 20px; height: 20px; " value="${dto.no}"/>
						</c:when>
					</c:choose>
					${dto.no}</td>
					<td><a href="/semiproject/question/text" id="text">${dto.title}</a></td>
					<td>${dto.email}</td>
					<td>${dto.day}</td>
					<td>${dto.vnum}</td>
				</tr>
			
			</tbody>
			</c:forEach>
			
		</table>
		<div id="pagi_wrap">
			<div id="pagination">
				<ul class="pagination pagination-sm">
					<li class="page-item">
		      			<a class="page-link" href="/semiproject/semi/admin/log?pageNum=${pdto.prePage}" aria-label="Previous">
		        			<span aria-hidden="true">&laquo;</span>
		        			<span class="sr-only">Previous</span>
		      			</a>
		    		</li>
		    		<c:set var="pdto" value="${sessionScope.pdto}" />
		    		<c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}">
				    <li class="page-item"><a class="page-link" href="/semiproject/question/question?pageNum=${i}">${i}</a></li>
				    </c:forEach>
				    <li class="page-item">
		      			<a class="page-link" href="/semiproject/question/question?pageNum=${pdto.nextPage}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					        <span class="sr-only">Next</span>
					   </a>
		    		</li>
		  		</ul>
			</div>
		</div>
			<c:choose>
				<c:when test="${!(empty sessionScope.name)}">
					<button type="submit" class="wirte" id="wirte">글쓰기</button>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${!(empty sessionScope.adminName)}">
					<button type="submit" class="censle" id="censle">삭제</button>
				</c:when>
			</c:choose>
			<%
			  session.removeAttribute("aList");
			%>
	</div>
</form>

</body>
</html>
<script>
$(document).ready(function(){
	// 로그 페이지 active 처리
	var index = $('#pageNum').val()*1;
	var active = (index%5)+1;
	if(active==1)
		active=6;
	var pageList = $('#pagination > ul li:nth-child('+active+')');
	pageList.addClass('active');
	
});
</script>
<%
session.removeAttribute("aList");
session.removeAttribute("pageNum");
session.removeAttribute("pdto");
%>