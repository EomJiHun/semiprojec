$(document).ready(function() {
		$.ajax({
			type:"POST",
			url : "/semiproject/user/captchaAction",
			dataType : "text",
			success : function(data) {
				var dataArray = data.split(",");
				$("#key").val(dataArray[0]);
				$("#div01").html("<img src='../"+dataArray[1]+"'>");
			}
		});
		// 새로고침 버튼을 눌렀을 시
		$("#btn01").on("click", function() {
			
			$.ajax({
				url : "/semiproject/user/captchaAction",
				dataType : "text",
				success : function(data) {
					var dataArray = data.split(",");
					console.log(data.key);
					$("#key").val(dataArray[0]);
					$("#div01").html("<img src='../"+dataArray[1]+"'>");
				}
			});
		});
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
		
		$("#login").on("click",function(){
		
			if($("#email").val()=="" || $('#pwd').val()==""){
				swal ( "Fail" ,  "아이디 또는 비밀번호에 빈칸이 있습니다" ,  "error" )
			}
			else{
				$.ajax({
					type:'POST',
					dataType:'text',
					url:'/semiproject/user/login',
					data:'email='+$("#email").val()+'&pwd='+$('#pwd').val()+'&captcha='+$('#captcha').val(),
					success:function login(res){
						console.log(res);
						if(res=="true"){
							swal("Good job!", "로그인 성공!", "success").then(function(){
								window.location.href="/semiproject/semi";
							});
						}else if(res=="false"){
							swal ( "Fail" ,  "아이디 또는 비밀번호가 다릅니다" ,  "error" )
						}else if(res=="show"){
							$('#captcha-wrap').css('display','block');
							swal ( "Fail" ,  "IP 주소가 변경되었습니다 매크로 방지 키를 입력해주세요!" ,  "error" )
							$('#captcha').focus();
							
							return;
						}
						// 아이디,비밀번호는 일치하지만 ip가 다른 경우 
					else if(res=="login")
						{
						var data=process();
						//alert(typeof data);
						if(data=="fals"){
							swal ( "Fail" ,  "이미지를 제대로 입력해주세요!" ,  "error" )
							$('#captcha').val("");
							$('#captcha').focus();
							$("#btn01").click();
						}else{
							$.ajax({
								type:'POST',
								dataType:'text',
								url:'/semiproject/user/ipupdate',
								data:'email='+$("#email").val(),
								success:function login(res){
									if(res==1){
										swal("Good job!", "update 성공!", "success").then(function(){
											window.location.href="/semiproject/semi";
										});
									}else{
										 swal ( "Fail" ,  "update 실패!" ,  "error" )
									}
								}
								
							})
						}
						
					}
					
					
			}
			});
		
		}
			
		});
	});