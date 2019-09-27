// Tabbed Menu
$(document).ready(function(){
	function openMenu(evt, menuName) {
		  var i, x, tablinks;
		  x = document.getElementsByClassName("menu");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablink");
		  for (i = 0; i < x.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" w3-dark-grey", "");
		  }
		  document.getElementById(menuName).style.display = "block";
		  evt.currentTarget.firstElementChild.className += " w3-dark-grey";
		};

		//메인 이미지 슬라이드
		var myIndex = 0;
		carousel();

		function carousel() {
		  var i;
		  var x = document.getElementsByClassName("mySlides");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";  
		  }
		  myIndex++;
		  if (myIndex > x.length) {myIndex = 1}    
		  x[myIndex-1].style.display = "block";  
		  setTimeout(carousel, 2000); // Change image every 2 seconds
		};

		 $("a").on('click', function(event) {
		       if (this.hash !== "") {
		          event.preventDefault();
		          var hash = this.hash;
		          $('html, body').animate({
		             scrollTop : $(hash).offset().top
		          }, 600, function() {
		             window.location.hash = hash;
		          });
		       }
		    });
		
		 
		$('#where > div > form > p.option-check-form > button').click(function(){
			$('#fn_type1_price').val(1);
			$('#fn_total').val($(this).val()*$('#fn_type1_price').val());
			$('#opt').val($(this).text());
			return false;
		});
		
		$('#fn_type1_price').change(function(){
			$('#fn_total').val($(this).val()*$('#where > div > form > p.option-check-form > button').val());
		});
		
		$('#basket').click(function(){
			if($('#fn_type1_price').val()==0){
				alert('옵션을 선택해주세요!!');
				return false;
			}else if($('#email').val() == null){
				alert('로그인이 필요합니다!!');
				location.href="/semiproject/user/login_page";
				return false;
			}else{
				$('#ftm').attr('action', '/semiproject/semi/product/basket_enroll');
				$('#ftm').submit();
			}
		});
		$('#ftm > p:nth-child(13) > button:nth-child(1)').click(function(){
			if($('#fn_type1_price').val()==0){
				alert('옵션을 선택해주세요!!');
				return false;
			}else if($('#email').val() == null){
				alert('로그인이 필요합니다!!');
				location.href="/semiproject/user/login_page";
				return false;
			}else{
				$('#ftm').attr('action', '/semiproject/semi/product/reserve_enroll');
				$('#ftm').submit();
			}
		});
		
})

