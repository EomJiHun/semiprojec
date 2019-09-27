$(document).ready(function(){
		var didScroll;
		// 스크롤시에 사용자가 스크롤했다는 것을 알림
		$(window).scroll(function(event){
			didScroll = true;
			setInterval(function(){
				if(didScroll){
					hasCrolled();
					didScroll = false;
				}
			});
		});
		
		// hasScrolled()를 실행하고 didScroll 상태를 재설정
		
		// 스크롤 시에 동작
		function hasCrolled(){
			var height = $(document).scrollTop();
			if(height >=100){
				$('#scroll_before').css({
					'display':'none'
				});
				$('#scroll_after').css({
					'display':'block'
				});
			}else{
				$('#scroll_before').css({
					'display':'block'
				});
				$('#scroll_after').css({
					'display':'none'
				});
			}
		}
		
		
		// 시간에 따라 배경화면이 변화는 부분
		// 클래스를 구분하여 z index 설정(css에 구현)
		$(function(){
			setInterval(function rotateImages(){
				console.log('rotate실행');
				var curPhoto = $('.bg div.current');
				var nextPhoto = curPhoto.next();
				if(nextPhoto.length == 0)
					nextPhoto = $('.bg div:first');
				
				curPhoto.removeClass('current').addClass('previous');
				nextPhoto.css({
					'opacity':'0.0'
				}).addClass('current').animate({'opacity':'1.0'}, 1000, function(){
					curPhoto.removeClass('previous');
				});
			},4000);
		})
		
		$('#searchbtn').click(function(){
			console.log('button');
			$.ajax({
				url:'/semiproject/semi/product/city_confirm?city='+$('#input_group > input').val(),
				type:'POST',
				contentType:'application/json',
				success:function(object){
					if(object.res=='empty'){
						alert('존재하지 않는 도시입니다!!');
						return false;
					}else{
						$('#content_bg_form').submit();
					}
				}
			});
		})
		$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			    $.ajax({
					url:'/semiproject/semi/product/city_confirm?city='+$('#input_group > input').val(),
					type:'POST',
					contentType:'application/json',
					success:function(object){
						if(object.res=='empty'){
							alert('존재하지 않는 도시입니다!!');
							return false;
						}else{
							$('#content_bg_form').submit();
						}
					}
				});
			  };
			});
});