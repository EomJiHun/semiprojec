
$(document).ready(function() {

	
	$('#findId').on('click',function(){
		
		if($('#phone').val()=="")
			{
			swal ( "Fail" ,  "폰번호를 입력해주세요!" ,  "error" )
			}
		else
			{
			$.ajax({
		          url : "/semiproject/user/findId?phone="+$('#phone').val(),
		          type:"GET",
		          dataType:"text",
		          success:function process(res)
				{
		        	  if(res=="")
		        		  {
		        		  $('#result').text("맞는 아이디가 없습니다");
		        		  
		        		  }
		        	  else
		        		  {
		        		  $('#result').text(res);
		        		  }
				}
		          
				})
			}
	
		
	})
	$('#findPwd').on('click',function(){
		if($('#email').val()=="")
			{
			swal ( "Fail" ,  "이메일을 입력해주세요!" ,  "error" );
			
			}
		else
			{
			$.ajax({
		          url : "/semiproject/user/findPwd?email="+$('#email').val(),
		          type:"GET",
		          dataType:"text",
		          success:function process(res)
				{
		        	  if(res=='true')
		        		  {
		        		  swal("Good job!", "인증번호 전송완료!", "success");
		        			$('#wrap').css('display','block');
		        		  }
		        	  else
		        		  {
		        		  swal ( "Fail" ,  "맞는 아이디가 없습니다!" ,  "error" );
		        		  }
				}
		          
				})
			}
		
	
		
	})
	
	
	
})
