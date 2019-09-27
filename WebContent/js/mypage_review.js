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
	$('#filepath').on('change', function() {
		var str = $('#filepath').val();
		//이미지 첨부파일인지 체크
		var patt = /(.jpg$|.gif$|.png$|.JPG$|.GIF$|.PNG$)/g;
		var result = str.match(patt);

		if (!result) {
			alert('jpg, gif, png만 가능합니다.');
			$('#filepath').val('');
			return false;
		}
		// 파일 첨부 사이즈 체크
		console.log(this.files + ", " + this.files[0]);
		//if (this.files && this.files[0]) {
			console.log('size:' + this.files[0].size);
			if(this.files[0].size>1000000000){
				alert('1GB바이트 이하만 첨부할 수 있습니다.');
				$('#filepath').val('');
				return false;
			}
		//}
		
		// 파일을 읽기 위한 FileReader 객체 생성
		var reader = new FileReader();
		
		//File내용을 일거 dataURL형식의 문자열로 저장
		reader.readAsDataURL(this.files[0]);
		
		// 파일읽어들이기를  성공했을때 호출되는 이벤트 핸들러
		reader.onload = function(e){
			//이미지 tag의 src속성에 읽어들인 file내용을 지정
			$('img').attr('src', e.target.result);
		}
		
	});
	
	// go Post 버튼 클릭시 입력창 생성
	$('body > div.my_container > div > div.w3-col.m7 > div:nth-child(1) > div  a > button').click(function(){
		$('body > div.my_container > div > div.w3-col.m7 > div:nth-child(2)').css({
			'display':'block'
		})
	});
})