<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semiproject/css/admin_city.css">

<form method="post" enctype="multipart/form-data" action="/semiproject/semi/admin/enroll_city">
<div class="table_wrap">
	<table class="answer_table">
		<tr>
			<td>대륙</td>
			<td><input type="text" name="continent" id="continent" style="width: 50%;"/></td>
		</tr>
		<tr>
			<td>국가</td>
			<td><input type="text" name="country" id="country" style="width: 50%;"/></td>
		</tr>
		<tr>
			<td>도시</td>
			<td><input type="text" name="city" id="city" style="width: 50%;"/></td>
		</tr>
		<tr>
			<td>위도 / 경도</td>
			<td><input type="text" name="lat" id="lat" style="width: 50%;" placeholder="위도를 입력하세요"/>
			<input type="text" name="lon" id="lon" style="width: 50%;" placeholder="경도를 입력하세요"/></td>
		</tr>
		<tr>
			<td>도시정보</td>
			<td><textarea rows="5" cols="50" name="content" id="content" style="width: 100%;"></textarea></td>
		</tr>
		<tr>
			<td>날씨정보</td>
			<td><input type="text" name="weather" id="weather" style="width: 100%;"/></td>
		<tr>
			<td>시간대</td>
			<td><textarea rows="4" cols="50" name="time" id="time" style="width: 100%;"></textarea></td>
		</tr>
		<tr>
			<td>통화</td>
			<td><textarea rows="4" cols="50" name="money" id="money" style="width: 100%;" ></textarea></td>
		</tr>
		<tr>
			<td>방문하기 좋은 시기</td>
			<td><textarea rows="4" cols="50" name="month" id="month" style="width: 100%;"></textarea></td>
		</tr>
		<tr>
			<td>사진추가<input type="file" name="filepath" id="filepath" multiple="multiple" /></td>
			<td><img src="" style="width: 200px; height: 100px;" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" name="enroll" id="enroll" value="등록"/></td>
		</tr>
	</table>
</div>
</form>
<script type="text/javascript" src="/semiproject/js/admin_city.js"></script>