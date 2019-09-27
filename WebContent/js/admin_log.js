$(document).ready(function() {

	// 메뉴 리스트 페이지 전환
	$('#pagination > ul li a').click(function() {
		$.ajax({
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json',
			url : $(this).attr("href"),
			success : function(object) {
				console.log(object);
				$('.main').load(object.url);
			}
		})
		return false;
	});
	
	// 조회 버튼을 눌렀을 때
	$('#answer').click(function(){
		var date = $('#search_date').val();
		var admin = $('#admin').val();
		$.ajax({
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json',
			url : '/semi/admin/search_log?date='+date+'&admin='+admin,
			success : function(object) {
				console.log(object);
				$('.main').load(object.url);
			}
		})
		return false;
	});

});