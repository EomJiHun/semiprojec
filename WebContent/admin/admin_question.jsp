<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_reserve.css">
<div class="table_wrap">
	<table class="answer_table">
		<tr>
			<td>게시일자</td>
			<td style="text-align: left;">
				<input type="date" name="date"/>
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" id="input_name" name="name" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" name="answer" id="answer" value="조회"/></td>
		</tr>
	</table>
</div>
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
			<tr>
				<td>1</td>
				<td>2019.08.05</td>
				<td><a href="#">유니버셜 익스프레스 패스4</a></td>
				<td>미니언 라이드</td>
				<td>4</td>
				<td>이종민</td>
				<td>예약완료</td>
			</tr>
		</tbody>
	</table>
</div>