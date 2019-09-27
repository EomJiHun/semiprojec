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
	
	

});