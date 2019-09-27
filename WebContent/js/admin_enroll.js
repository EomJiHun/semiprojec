$(document).ready(function(){
var oEditors = [];
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1", // textarea에서 지정한 id와 일치해야 합니다.
			// SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI: "/semiproject/js/smartEditor/SmartEditor2Skin.html",
			htParams:{
				// 툴바 사용여부(true:사용/false:사용하지 않음)
				bUseToolbar:true,
				// 입력창 크기 조절바 사용 여부(true: 사용 / false: 사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부(true:사용 / false:사용하지 않음)
				bUseModeChanger: true,
				fOnBeForeUnload : function(){
					
				}
			},
			fOnAppLoad : function(){
				// 기존 저장된 내용의 text애용을 에디터 상에 뿌려주고자 할 때 사용
				oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
			},
			fCreator: "createSEditor2"
		});
		
		// 저장버튼 클릭시 form 전송
		$('#save').click(function(){
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$('#frm').submit();
		});
	})
	
	$('#filepath').on('change', function() {
			var str = $('#filepath').val();
			//이미지 첨부파일인지 체크
			var patt = /(.jpg$|.gif$|.png$)/g;
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
		}
	});
})