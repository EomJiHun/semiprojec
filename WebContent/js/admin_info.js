$(document).ready(function(){
	// 상품등록 버튼을 누르면 등록화면 페이지로 이동한다.
	$('#admin_enroll').click(function(){
		$.ajax({
			type:'POST',
			contentType:'application/json',
			url:'/semiproject/semi/admin/admin_enroll',
			success:function(object){
				$('.main').load(object.url);
			}
		});
	})
});