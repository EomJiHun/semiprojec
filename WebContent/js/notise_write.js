$(document).ready(function() {
	
	
	//리턴 되돌아가기
	$('.return').click(function(){
			$.ajax({
				type :'POST',
				dataType :'json',
				url:"/semiproject/question/question",
				success : function(object) {
					$('.noti').load(object.url);
				}
			});
			return false;
		});
	
	
	/*var email = $('input[name=email]').val();
	var title = $('input[name=title]').val();
	var content = $('textarea').val();
	console.log(email);
	console.log(title);
	console.log(content);*/
	
	
	
	//질문하기 페이지에서 제출하기 버튼
	$('.submit').click(function(){
		var array = $('form').serialize();
		$.ajax({
			type :'POST',
			dataType :'json',
			data: array,
			url:"/semiproject/question/qusrWrite",
			success : function(object) {
				$('.noti').load(object.url);
			}
		});
		return false;
	});
	

	
	
});