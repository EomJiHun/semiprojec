<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_pro.css">
<input type="hidden" name="pageNum" id="pageNum" value="${sessionScope.pageNum}" />

<div class="table_wrap">
	<table class="answer_table">
		<thead>
			<tr>
				<td colspan="6" style="text-align:right;border: 0 !important;">
					<input type="button" name="update" id="update" value="수정" />
					<input type="button" name="complete" id="complete" value="수정완료" />
					<input type="button" value="상품등록" name="enroll" id="enroll_btn" />
				</td>
			</tr>
			<tr>
				<td style="width:5%;">No.</td>
				<td style="width:30%">상품명</td>
				<td style="width:30%;">옵션</td>
				<td style="width:20%;">가격</td>
				<td style="width:15%;">재고</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sessionScope.aList}" var="pro" varStatus="status">
				<tr>
					<td>${pro.pid}</td>
					<td><a href="/semiproject/semi/product/detail_enroll?pid=${pro.pid}&title=${pro.title}">${pro.title}</a></td>
					<td>${pro.options}</td>
					<td>${pro.price}</td>
					<td><input type="text" name="count" value="${pro.count}" size="3" readonly />
					<div class="icon"><i class="fa fa-arrow-up"></i></div></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="pagi_wrap">
		<div id="pagination">
			<ul class="pagination pagination-sm">
				<li class="page-item">
	      			<a class="page-link" href="/semiproject/semi/admin/product?pageNum=${pdto.prePage}" aria-label="Previous">
	        			<span aria-hidden="true">&laquo;</span>
	        			<span class="sr-only">Previous</span>
	      			</a>
	    		</li>
	    		<c:set var="pdto" value="${sessionScope.pdto}" />
	    		<c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}">
			    <li class="page-item"><a class="page-link" href="/semiproject/semi/admin/product?pageNum=${i}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item">
	      			<a class="page-link" href="/semiproject/semi/admin/product?pageNum=${pdto.nextPage}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				   </a>
	    		</li>
	  		</ul>
		</div>
	</div>
</div>
<script type="text/javascript" src="/semiproject/js/admin_pro.js"></script>
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