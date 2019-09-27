
$(document).ready(function(){
	
	 /*수량체크박스 체그시 금액변환*/
	   var hom = " ";
	   $('.count_p').click(function(){
	      var conut = $(this).next().val();
	      conut++;
	       var num = $(this).next().val(conut);
	       /*금액변경*/
	      var num = $(this).parents('table').attr('id');
	      console.log(num*1);
	      var sum = num*1;
	      var pr = $('input[name=price_'+sum+']').val();
	      pr = pr*1;
	      var original = $('input[name=price_'+sum+']').parent().attr('id');
	      original = original*1;
	      $('input[name=price_'+sum+']').val(original+pr);
	      

	   });

	   $('.count_m').click(function(){
	      
	      var conut =$(this).prev().val();
	      conut--;
	      var pb = $(this).prev().val(conut);
	       /*금액변경*/
	      var num = $(this).parents('table').attr('id');
	      num = num*1;
	      console.log(pb);
	         if((conut*1)<=0){
	            $('input[name=price_'+num+']').val(0);
	         }else {
	            var pr = $('input[name=price_'+num+']').val();
	            pr = pr*1;
	            var original = $('input[name=price_'+num+']').parent().attr('id');
	            original = original*1;
	            $('input[name=price_'+num+']').val(pr-original);            
	         }
	   });

	   
	   var sum = 0;
	   var prise= 0;
	   //토탈금액 넣기
	   $('.list').on('click',function(){      
	      prise=0;
	      var num = 0;
	      var count = $('.list:checked').length;//체크된 체크박스 갯수      
	      var bo = $('.list').length;//전체 갯수
	      var c = $(this).parents('table').attr('id');//체크된 인덱스 번호
	         for(var i=1; i<=bo; i++){
	            if($('table#'+i+' input[name=list]').is(':checked')){
	               num += 1;
	               sum = parseInt($('input[name=price_'+i+']').val());
	               prise = prise+sum;                                                   
	               }
	            }
	      $('.gt').html(num);
	      $('.total').val(prise);
	   })
	   
	   
	   var all_btn_price= 0;
	   /*체크박스 전체선택*/
	   var to = $('.list').length;//전체 갯수
	   $('.j_all').on('click',function(){
	      //클릭되었으면
	        if($(".j_all").prop("checked")){
	            $("input[name=list]").prop("checked",true);
	            $("input[name=j_all]").prop("checked",true);
	            $('.gt').html(to);
	        }else{
	            $("input[name=list]").prop("checked",false);
	            $("input[name=j_all]").prop("checked",false);
	            $('.gt').html(0);
	        }
	        for(var i=1; i<=to; i++){
	           if($('table#'+i+' input[name=list]').is(':checked')){
	              var sum = parseInt($('input[name=price_'+i+']').val());
	              console.log(sum);
	              all_btn_price += sum;              
	           }else{
	              all_btn_price=0;
	           }   
	        }
	        $('input[name=total_price]').val(all_btn_price);
	   });
	   
	   
	   $('.j_all_1').on('click',function(){
	      //클릭되었으면
	      if($(".j_all_1").prop("checked")){
	         //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	         $("input[name=list]").prop("checked",true);
	         $("input[name=j_all]").prop("checked",true);
	         $('.gt').html(to);
	         //클릭이 안되있으면
	      }else{
	         //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	         $("input[name=list]").prop("checked",false);
	         $("input[name=j_all]").prop("checked",false);
	         $('.gt').html('');
	      }
	      for(var i=1; i<=to; i++){
	           if($('table#'+i+' input[name=list]').is(':checked')){
	              var sum = parseInt($('input[name=price_'+i+']').val());
	              console.log(sum);
	              all_btn_price += sum;              
	           }else{
	              all_btn_price=0;
	            }
	        }
	        $('input[name=total_price]').val(all_btn_price);
	      
	      
	      
	   });
	   /*선택한 목록삭제*/
	     $('#delete').click(function(){
	       if($('.list:checked').length== 0){ 
	          alert("삭제할 대상을 선택해주세요")
	       }else if(confirm("삭제하시겠습니까?")){
	             $("input[name=list]:checked").each(function(){
	                var tr_value =$(this).val();
	                var tr=$("table[id='"+tr_value+"']");
	                var no = $('input[name='+tr_value+']').val();
	                $.ajax({
	                	type:'POST',
	                	url:'/semiproject/semi/product/delete_basket?no='+no,
	                	success:function(){}
	                });
	                tr.remove();
	             });
	             $('input[name=total_price]').val(0);
	          }else{
	             return false;
	          } 
	            
	       });
	     
	     
	     var a =$('span.gt').text();     
	     $('input[name=sum]').val(a);
	     
	     
	  //	  체크 대상이 없으면 값을 전송할 수 없다
	  $('#form > table > tbody > tr > td.fl_5 > input').click(function(){
		  if($('.list:checked').length== 0){ 
				 alert("대상을 선택해주세요!!");
				 return false;
			}else{
				$('#form').submit();
			}
	  });
	 
	  
	
});