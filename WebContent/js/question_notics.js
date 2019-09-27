$(document).ready(function(){
	$('#reservation').on('click',process_1())
	$('#payment').on('click',process_2())
	$('#refund').on('click',process_3())
	$('#account').on('click',process_4())
});


function process_1(){

		$.ajax({
			type : 'POST',
			dataType : 'text',
			url :'notis.jsp#/semiproject/notice/noticeQst.jsp',
			success : function(object){
				$('#noti').load(object.url);
			}
	});
	
};//end process/////////////