<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_log.css">
<script src="/semiproject/js/admin_log.js"></script>
<input type="hidden" name="pageNum" id="pageNum" value="${sessionScope.pageNum}" />

<div class="table_wrap">
	<table class="answer_table">
		<thead>
			<tr>
				<td style="width:5%;">No.</td>
				<td style="width:45%;">내용</td>
				<td style="width:25%;">시간</td>
				<td style="width:10%;">관리자</td>
				<td style="width:15%;">IP</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sessionScope.logList}" var="log" varStatus="status">
				<tr>
					<td>${log.no}</td>
					<td>${log.content}</td>
					<td>${log.time}</td>
					<td>${log.name}</td>
					<td>${log.ip}</td>
				</tr>
			</c:forEach>
			
		</tbody>
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
			    <li class="page-item"><a class="page-link" href="/semiproject/semi/admin/log?pageNum=${i}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item">
	      			<a class="page-link" href="/semiproject/semi/admin/log?pageNum=${pdto.nextPage}" aria-label="Next">
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
session.removeAttribute("logList");
session.removeAttribute("pageNum");
session.removeAttribute("pdto");
%>