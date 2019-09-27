<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_reserve.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/semiproject/js/admin_reserve.js" ></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
	<script src="sweetalert2.all.min.js"></script>
<input type="hidden" name="pageNum" id="pageNum" value="${sessionScope.pageNum}" />
<div class="table_wrap">
	<table class="answer_table">
		<thead>
			<tr>
				<td style="width:5%;">No.</td>
				<td style="width:15%;">예약일</td>
				<td style="width:30%;">상품명</td>
				<td style="width:20%;">옵션</td>
				<td style="width:5%;">수량</td>
				<td style="width:10%;">예약자</td>
				<td style="width:15%;">예약상테</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sessionScope.reserveList}" var="rList">
				<tr>
					<td>${rList.no}</td>
					<td>${rList.day}</td>
					<td>${rList.title}</td>
					<td>${rList.options}</td>
					<td>${rList.pnum}</td>
					<td>${rList.name }</td>
					<td>
						<c:choose>
							<c:when test="${rList.rpId eq '취소신청'}">
								<input type="hidden" class="imp_uid" value="${rList.imp_uid}" />
								<input type="hidden" class="pid" value="${rList.pid}"/>
								<input type="button" class="cancel_btn" value="에약취소" style="color: orange;"/>
							</c:when>
							<c:otherwise>
								${rList.rpId}
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="pagi_wrap">
		<div id="pagination">
			<ul class="pagination pagination-sm">
				<li class="page-item">
	      			<a class="page-link" href="/semiproject/semi/admin/reserve?pageNum=${pdto.prePage}" aria-label="Previous">
	        			<span aria-hidden="true">&laquo;</span>
	        			<span class="sr-only">Previous</span>
	      			</a>
	    		</li>
	    		<c:set var="pdto" value="${sessionScope.pdto}" />
	    		<c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}">
			    <li class="page-item"><a class="page-link" href="/semiproject/semi/admin/reserve?pageNum=${i}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item">
	      			<a class="page-link" href="/semiproject/semi/admin/reserve?pageNum=${pdto.nextPage}" aria-label="Next">
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
	$(".cancel_btn").on('click',function(){
	    alert("click");
		$.ajax({
			url : "/semiproject/refund.do",
			dataType : "text",
			type:"POST",
			data:"imp_uid="+$(".imp_uid").val(),
			success : function(data) {
				swal("Good job!", "예약취소 성공!", "success")
			}
		});
	})
	
	
	
	
});
</script>

<%
session.removeAttribute("reserveList");
session.removeAttribute("pageNum");
session.removeAttribute("pdto");
%>