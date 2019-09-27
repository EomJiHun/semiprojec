$(document).ready(function() {
	
	//질문 글쓰기 페이지 전환 question_board.jsp
	$('#wirte').click(function(){
		$.ajax({
			type :'POST',
			dataType :'json',
			url:"/semiproject/question/write",
			success : function(object) {
				$('.noti').load(object.url);
			}
		});
		return false;
	});
	//질문 글 보기 페이지 전환 question_board.jsp
	$('table tbody #text').click(function(){
		var a = $(this).parent().prev().children().val();
		console.log(a)
		$.ajax({
			type :'POST',
			dataType :'json',
			data:{'a' : a},
			url:$(this).attr('href'),
			success : function(object) {
				console.log(object);
				$('.noti').load(object.url);
			}
		});
		return false;
	});
	
	
	// 모든 서브메뉴를 감춘다. notice.jsp
	$('#notics_body #list li ul').hide();
	$('#notics_body #list li #up').hide();

	var nu = $('#notics_body #list  li #up').text();

	$('#notics_body #list  li #qs').on('click', function() {
		if (nu == "") {
			$('#notics_body #list  li ul').show();
			$('#notics_body #list  li #up').show();
			$('#notics_body #list  li #down').hide();
			nu = " ";
		} else if (nu == " ") {
			$('#notics_body #list  li ul').hide();
			$('#notics_body #list  li #up').hide();
			$('#notics_body #list  li #down').show();
			nu = "";
		}
		;

	});
	
	//메뉴 리스트 페이지 전환 notice.jsp
	$('.noit-group .list').click(function(){
		$.ajax({
			type :'POST',
			dataType :'json',
			url:$(this).attr('href'),
			success : function(object) {
				console.log(object.url);
				$('.noti').load(object.url);
			}
		});
		return false;
	});

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
	
	$('.text_reple:first').remove()

	//댓글등록
	$('input.review_btn').click(function(){
		var mo = $(this).parents('form').serialize();
		$.ajax({
			type :'POST',
			dataType :'json',
			data:mo,
			url:"/semiproject/question/review",
			success : function(object) {
				$('.noti').load(object.url);
			}
		});
		return false;
	});

	//삭제 버튼 삭제하기
	$('.censle').click(function(){
		$('#chk:checked').val();
		$.ajax({
			type :'POST',
			dataType :'json',
			data:{"chk" : $('#chk:checked').val()},
			url:"/semiproject/question/delete",
			success : function(object) {
				$('.noti').load(object.url);
			}
		});
		return false;
		
	});
	
	
	
	
	
	
});
