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

$('form').submit(function() {
	var str = $('#filepath').val();
	if (str.length < 1) {
		alert('이미지를 선택하세요');
		return false;
	}else{
		var str = document.getElementById("content").value;
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		document.getElementById("content").value = str;
		var str2 = document.getElementById("time").value;
		str2 = str2.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		document.getElementById("time").value = str2;
		var str3 = document.getElementById("money").value;
		str3 = str3.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		document.getElementById("money").value = str3;
		var str4 = document.getElementById("month").value;
		str4 = str4.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		document.getElementById("month").value = str4;
	}
});
})