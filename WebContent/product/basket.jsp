<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/semiproject/css/basket.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script type="text/javascript" src="/semiproject/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/semiproject/js/basket.js"></script>
</head>
<body style="background-color: #BDBDBD;">

	<jsp:include page="/fragment/common_nav.jsp" flush="true"></jsp:include>
	<br>
	<div id="body">
		<h3>장바구니</h3>
		<table class="t1">
			<tr>
				<td class="fo_1" style="width: 50px;"><input type="checkbox"
					class="j_all" name="j_all" /></td>
				<td class="fo_2" style="width: 150px;">전체선택</td>
				<td class="fo_3" style="width: 300px;">상품 및 상세내용</td>
				<td class="fo_4" style="width: 300px;">날짜</td>
				<td class="fo_5" style="width: 200px;">수량</td>
				<td class="fo_6">금액</td>
			</tr>

		</table>
		<br />

		<form name="form" id="form" action="basket_price" method="get"
			style="height: 100%; height: 100%;">
			<c:forEach items="${requestScope.aList}" var="dto">
			<input type="hidden" id="email" name="email" value="${dto.email}"/>
			<c:set var="count" value="${count + 1}" />
			<table class="t2" id="${count}">
				<tr id="tr_1">
					<input type="hidden" name="${count}" value="${dto.no}" />
					<td class="bo_1" style="width: 50px;"><input type="checkbox"
						class="list" name="list" value="${count}" /></td>
					<td class="bo_2" style="width: 150px;"><img
						src="/semiproject/pro_image/${dto.imagepath}"
						style="width: 100px; height: 100px;"></td>
					<td class="bo_3" style="width: 300px;"><a href="/semiproject/semi/product/view_detail?title=${dto.title}"
						class="product">${dto.title}</a>
					<p id="obtion">${dto.options}</p></td>
					<td class="bo_4" style="width: 300px;">${dto.day}</td>
					<td class="bo_5" style="width: 200px;"> <input type="text"
						class="count_text" name="count_${count}" value="${dto.pnum}"
						style="width: 30px; height: 27px; text-align: center;" readonly /> </td>
					<td class="bo_6"></td>
				</tr>
				<tr id="tr_2">
					<td></td>
					<td style="width: 100px;" class="modified"></td>
					<td colspan="2"></td>
					<td></td>
					<td class="pp" id="dsfsdfs"><label id="${dto.price}"
						style="font-size: 15px; text-align: center;"> &#8361;<input
							class="price" name="price_${count}" type="text"
							style="width: 90px" value="${dto.price}" readonly/>
					</label>원</td>
				</tr>
				
				</c:forEach>
			</table>


			<br />
			<table class="t4">
				<tr>
					<td class="fl_1" style="width: 50px;"><input type="checkbox"
						class="j_all_1" name="j_all" /></td>
					<td class="fl_2">전체선택</td>
					<td class="fl_3" id="delete"><a href="#"><span
							class="glyphicon glyphicon-trash">선택한목록삭제</span></a></td>
					<td></td>
					<td class="fl_4"><span class="gt">0</span>개 액티비티|| 총액:&#8361;<input
						name="total_price" type="text" style="width: 110px;" class="total" value="" readonly>원</td>
					<td class="fl_5"><input type="button" class="btn btn-primary"
						value="바로결제"></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="footer">
		<jsp:include page="/fragment/footer.jsp" flush="true"></jsp:include>
	</div>

	<script type="text/javascript">
		var bo = $('.list').length;//전체 갯수 

		function dele() {
			/*부분체크박스 삭제*/

			alert(bo);
			for (var i = 1; i <= bo; i++) {
				if ($('table#' + i + ' input[name=list]').is(':checked')) {
					$('table#' + i).remove();
				}
			}
			;
		};
	</script>
</body>
</html>


