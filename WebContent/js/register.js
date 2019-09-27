$(document).ready(function() {
		// 페이지 로딩시 captch 가져옴
		$.ajax({
			url : "/semiproject/user/captchaAction",
			dataType : "text",
			success : function(data) {
				var dataArray = data.split(",");
			
				$("#key").val(dataArray[0]);
				//$("#div01").html("<img src='../test/images/background.jpg'>");
				$("#div01").html("<img src='../"+dataArray[1]+"'>");
			}
		});
		
		// 새로고침 버튼을 눌렀을 경우
		$("#btn01").on("click", function() {
			
			$.ajax({
				url : "/semiproject/user/captchaAction",
				dataType : "text",
				success : function(data) {
					var dataArray = data.split(",");
					
					$("#key").val(dataArray[0]);
					$("#div01").html("<img src='../"+dataArray[1]+"'>");
				}
			});
		});
		
		// 자동가입 방지 문자 확인
		var result;
		function process()
		{
			$.ajax({
				url : "/semiproject/user/captchaAction",
				async:false,
				data :"value="+$('#captcha').val()+'&key='+$('#key').val(),
				dataType:"text",
				
				success : function(data) {
					result=data;

				}
		
			});
			return result;
			
		}
	
		
		// 회원가입 버튼 클릭시
		$("#register").on("click",function(){
			
			if($('#captcha').val()=="" || $('#email').val()=="" ||$('#pwd').val()=="" ||$('#pwd1').val()==""  ){
				swal ( "Fail" ,  "빈칸이 있습니다!" ,  "error" )
			}
			else{
				var email_pat=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				var id_pat=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
				  //가장 많이 사용되는 최소 8자리에 숫자, 문자, 특수문자 각각 1개 이상 포함
				  //
				var data=process();
				//alert(typeof data);
				if(data=="fals"){
					swal ( "Fail" ,  "자동 가입 방지 문자가 틀렸습니다!" ,  "error" )
					$('#captcha').val("");
					$('#captcha').focus();
					$("#btn01").click();
					return;
				}else{
					// 정규식 확인
					if(!(email_pat.test($('#email').val()))){
					swal ( "Fail" ,  "올바른 이메일을 입력해주세요!" ,  "error" )
					$('#captcha').val("");
					$('#email').focus();
					$("#btn01").click();
					  return;
					}else if(!(id_pat.test($('#pwd').val()))){
						swal ( "Fail" ,  "최소 8자리 숫자 문자 특수문자 각각1개 이상 포함해주세요!" ,  "error" )
						$('#captcha').val("");
						$('#pwd').focus();
						$("#btn01").click();
						return;
					}else if($('#pwd').val()!=$('#pwd1').val()){
						swal ( "Fail" ,  "비밀번호가 같지 않습니다!" ,  "error" )
						return;
					}else{swal("Good job!", "회원가입 성공! 확인창을 누르시면 로그인 페이지로이동됩니다", "success")
						.then((value) => {
							 document.register.submit();
					});

			
				        /* swal("Good job!", "회원가입 성공! 5초후 로그인창으로 이동합니다", "success");
				         setTimeout(function() {
				        	 $('#regiseter').submit();
				        	 location.href="../test/login.jsp" ;
				        	}, 5000);
										*/
						}
					
				
					}
				}
			
			
		});
		
		
	});