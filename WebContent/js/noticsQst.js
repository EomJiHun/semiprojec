$(document).ready(function(){
		//모든 서브메뉴를 감춘다.
		$('#menu li ul').hide();
		
		$('ul#menu>li a').click(function(){
			//ul
			var checkElement=$(this).next().next();
	
			
			//menu
			var parent=$(this).parents("ul").prop("id");
			
			if(checkElement.is('ul') && checkElement.is(':hidden')){
			//기존에  보여줬던 서브메뉴를 감춘다.
				$('#'+parent+' ul:visible').slideUp('slow');
			
			//새로 선택한 메인메뉴의 서브 메뉴를 보여준다.
				checkElement.slideDown('normal');
		}
			return false;
		});
		
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