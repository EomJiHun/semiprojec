<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_info.css">
<input type="hidden" name="pageNum" id="pageNum" value="${sessionScope.pageNum}" />
<div class="table_wrap">
	<table class="answer_table">
		<thead>
			<tr>
				<td colspan="3" style="text-align:right;border: 0;">
					<input type="button" value="관리자등록" name="enroll" id="admin_enroll" />
				</td>
			</tr>
			<tr>
				<td style="width:33%;">아이디</td>
				<td style="width:33%;">이름</td>
				<td style="width:33%">생성일자</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sessionScope.aList}" var="dto">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.date}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="pagi_wrap">
		<div id="pagination">
			<ul class="pagination pagination-sm">
				<li class="page-item">
	      			<a class="page-link" href="/semiproject/semi/admin/admin_info?pageNum=${pdto.prePage}" aria-label="Previous">
	        			<span aria-hidden="true">&laquo;</span>
	        			<span class="sr-only">Previous</span>
	      			</a>
	    		</li>
	    		<c:set var="pdto" value="${sessionScope.pdto}" />
	    		<c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}">
			    <li class="page-item"><a class="page-link" href="/semiproject/semi/admin/ladmin_info?pageNum=${i}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item">
	      			<a class="page-link" href="/semiproject/semi/admin/admin_info?pageNum=${pdto.nextPage}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				   </a>
	    		</li>
	  		</ul>
		</div>
	</div>
</div>
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
	// session으로 불러온뒤 삭제해준다.
	session.removeAttribute("aList");
	session.removeAttribute("pageNum");
	session.removeAttribute("pdto");
%>
<script type="text/javascript" src="/semiproject/js/admin_info.js"></script>