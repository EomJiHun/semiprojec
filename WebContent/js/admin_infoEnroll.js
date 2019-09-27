$(document).ready(function(){
	$('#generate').click(function(){
		if($('#pwd').val()!=$('#pwdcon').val()){
			alert('비밀번호가 일치 하지 않습니다!!');
			return false;
		}
		var email_pat=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var id_pat=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		
		if(!email_pat.test($('#id').val())){
			alert('이메일 형식이 올바르지 않습니다!!');
			return false;
		}
		if(!id_pat.test($('#pwd').val())){
			alert('최소 8자리 숫자 문자 특수문자 각각1개이상 포함해주세요!');
			return false;
		}
		if($('#name').val()==""){
			alter('이름을 입력하세요!');
			return false;
		}
		$('#frm').submit();
	});
});