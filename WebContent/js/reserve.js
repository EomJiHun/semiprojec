
   $(document)
         .ready(
               function() {

                  var inicis;
                  var pay;
                  var st;
                  $('#btn')
                        .on(
                              'click',
                              function() {
                                 st = $(
                                       "input:radio[name=pay]:checked")
                                       .val();
                                 
                                 var winl = (screen.width - 700) / 2;
                                 var wint = (screen.height - 900) / 2;
                                 if (st == 1) {
                                    wrapWindowByMask();
                                    inicis=window.open("/semiproject/reserve/inicis.jsp",
                                          "pay",
                                          "width=900,height=600,top="
                                                + wint
                                                + ",left="
                                                + winl
                                                + ",menubar=no, status=no, toolbar=no");
                                    
                                    var fo1 = document.fo;
                                    fo.action="/semiproject/reserve/inicis.jsp";
                                    fo1.target = "pay";
                                    fo1.method = "post";
                                    fo1.submit();
                                    
                               
                                 } else if (st == 2) {
                                    //window.showModalDialog("pay.jsp","pay","dialogWidth:700px;dialogHeight:365px;");
                                    pay = window
                                          .open(
                                                "/semiproject/reserve/paypal.jsp",
                                                "pay",
                                                "width=900,height=800,top="
                                                      + wint
                                                      + ",left="
                                                      + winl
                                                      + ",menubar=no, status=no, toolbar=no");
                                    var fo1 = document.fo;
                                    fo.action="/semiproject/reserve/paypal.jsp";
                                    fo1.target = "pay";
                                    fo1.method = "post";
                                    fo1.submit();
                                    wrapWindowByMask();
                                 } else {
                                    alert("결제하실 방식을 선택해주세요");
                                 }

                              })

                  function wrapWindowByMask() {
                     //화면의 높이와 너비를 구한다.
                     var maskHeight = $(document).height();
                     var maskWidth = $(window).width();

                     //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
                     $('#mask').css({
                        'width' : maskWidth,
                        'height' : maskHeight
      
                     });
                      $('#mask').fadeIn(1000);      
                          $('#mask').fadeTo("slow",0.8); 
                  }

                  //검은 막을 눌렀을 때
                  $('#mask').click(function() {
                     $(this).hide();
                     if (st == "1") {
                        inicis.close();
                     } else {
                        pay.close();
                     }

                  });
                  $('#pname1').val($('#pname').text());
                  
               });