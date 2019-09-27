// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}

$(document).ready(function(){
	
	$('.gmain').hide();//내설정
	$('.pass_pay').hide();//비밀번호경경
	
	$('.w3-white a').click(function(){
		console.log($(this).attr('id')=="account_settings");
		if($(this).attr('id')=="account_settings"){
			$('.gmain').show();//내설정
			$('.pass_pay').show();//비밀번호경경
			$('#back').hide();//여행후기
		}else if($(this).attr('id')=="Reservation"){
			$('.gmain').hide();//내설정
			$('.pass_pay').hide();//비밀번호경경
			$('#back').show();//여행후기
		}
		
		
	});
	
	
	
	
	
	
	
});