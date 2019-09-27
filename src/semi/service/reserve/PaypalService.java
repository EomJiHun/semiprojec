package semi.service.reserve;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import semi.model.dao.BasketDAO;
import semi.model.dao.ProductDAO;
import semi.model.dao.ReserveDAO;
import semi.model.dao.UserDAO;
import semi.model.dto.ReserveDTO;
import semi.model.dto.UserDTO;
import semi.service.mail.Mail;



@WebServlet("/paypal.do")
public class PaypalService extends HttpServlet {

 
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      HttpSession session=req.getSession();
      String imp_uid=req.getParameter("imp_uid");
      String merchant_uid=req.getParameter("merchant_uid");
      String imp_success=req.getParameter("imp_success");
      
      String title=(String)session.getAttribute("title");
      
      String email=(String)session.getAttribute("email");
      UserDTO dto=(UserDTO)session.getAttribute("udto");
      String [] chk=(String [])session.getAttribute("num");
      
      UserDAO udao=UserDAO.getInstance();
      
      String myemail=dto.getMyemail();
      String lname=dto.getLname();
      String fname=dto.getFname();
      String name=lname+fname;
      
        ReserveDAO dao=ReserveDAO.getInstance();
        BasketDAO bdao=BasketDAO.getInstance();
        ProductDAO pdao=ProductDAO.getInstance();
        List<ReserveDTO> aList=(List<ReserveDTO>) session.getAttribute("aList");
       int cnt[]=dao.insertMethod(aList, imp_uid, merchant_uid,email);  //성공하면 invalidate되게 하기
           bdao.deleteMethod(chk, email);
           udao.updateMethod(dto);
         post(myemail,name,title,merchant_uid);
          
//            for(int i=0; i<aList.size();i++)   //수량 증가 변경
//           {
//              ReserveDTO rdto=aList.get(i);
//               try {
//               pdao.minusCount(rdto.getPid());
//            } catch (SQLException e) {
//               // TODO Auto-generated catch block
//               e.printStackTrace();
//            }
//              
//           }
           session.removeAttribute("aList");
           session.removeAttribute("num");
           session.removeAttribute("udto");
           session.removeAttribute("title");
      System.out.println(imp_uid+" "+merchant_uid+" "+imp_success);
      String imp_key       =   URLEncoder.encode("2452067702364451", "UTF-8");

      String imp_secret   =   URLEncoder.encode("8cDLzuuNW01ZHKLJ15kruSyjcXoFBMLJYpvyUZlQ0mPI7Br9GLAaE9uQ6SwIFhrEHWdBWyrWVhE3S5cy", "UTF-8");
        String imp_uid1=URLEncoder.encode(imp_uid, "UTF-8");
      JSONObject json = new JSONObject();

      json.put("imp_key", imp_key);

      json.put("imp_secret", imp_secret);

      String _token = null;
      try {
         _token = getToken(req, resp, json, "https://api.iamport.kr/users/getToken");
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } 
   
      
      JSONObject json1 = new JSONObject();

      json1.put("Authorization", _token);
   
      JSONObject object1=new JSONObject();
      try {
         object1=getEmail(req, resp, json1, "https://api.iamport.kr/payments/"+imp_uid1+"?_token="+_token);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      resp.setContentType("text/html;charset=UTF-8");
      PrintWriter out = resp.getWriter();
      out.print(object1);
      
      
      
        out.flush();
      
      

      
      //RequestDispatcher dis = req.getRequestDispatcher("/test/reserveConfirm.jsp");
      //dis.forward(req, resp);
      
      
   }
   //이름 ,title 예약번호
      public void post(String to,String name ,String title,String merchant_uid)// 메일 보낼사람// 메일 보낼사람
      {
      
         String from = "testsemi1112@gmail.com"; // 메일 보내는 사람
         String cc = ""; // 참조
         String subject = "[WE-GO] 바우처 안내!";// 제목
          String content="<div style='background: #ebece7; padding-top: 20px;padding-bottom:20px;'>\r\n" + 
                    "            <div style='max-width: 630px; width: 100%; margin: 0 auto 0;'>\r\n" + 
                    "                <div style='padding: 0 4.5% 20px; background: #FFF;'>\r\n" + 
                    "                    <div style='text-align: left; padding: 20px 0 5px 0; font-size:45px;color:#ff5722;font-weight:1000;'>\r\n" + 
                    "                         WE-GO\r\n" + 
                    "                    </div>\r\n" + 
                    "                    <p>\r\n" + 
                    "                                      "+name+"님，안녕하세요! <br>\r\n" + 
                    "                    </p>\r\n" + 
                    "                    <p>\r\n" + 
                    "                           "+title+" 예약이 확정 되었습니다.\r\n" + 
                    "                        \r\n" + 
                    "                    </p>\r\n" + 
                    "                    <p style='margin:0;'>\r\n" + 
                    "                        예약번호: "+merchant_uid+"\r\n" + 
                    "                    </p>\r\n" + 
                    "                    <p style='border:0; margin:2px 0; padding:0; background-color: #eee; height:1px;'></p>\r\n" + 
                    "                    바우처 번호: KLK0234379347 <br>\r\n" + 
                    "                    <br>\r\n" + 
                    "                    E티켓 이용 방법:\r\n" + 
                    "                    모바일 E티켓 또는 인쇄한 E티켓을 보여주세요.\r\n" + 
                    "                    <p style=\"border:0; margin:2px 0; padding:0; background-color: #eee; height:1px;\"></p>\r\n" + 
                    "\r\n" + 
                    "                    <p>\r\n" + 
                    "                        아래 버튼을 클릭해주세요. 미리 E티켓 상세 정보를 꼭 체크하세요!\r\n" + 
                    "                    </p>\r\n" + 
                    "\r\n" + 
                    "                    <p style=\"margin-bottom: 10px;\">\r\n" + 
                    "                        <a style=\"text-decoration:none; background: #ff5722; color: #fff; padding:4px 6px; font-weight:bold; -webkit-box-shadow: 2px 2px 2px #aaa; -moz-box-shadow: 2px 2px 2px #aaa; box-shadow: 2px 2px 2px #aaa; \"  href=''> E티켓 확인  » </a>\r\n" + 
                    "\r\n" + 
                    "                    </p>\r\n" + 
                    "\r\n" + 
                    "                    <p style=\"font-size:12px; color: #777;\">\r\n" + 
                    "                        링크에 문제가 있을 경우, 아래 주소를 복사하여 웹브라우저에서 접속하세요. <br><br>\r\n" + 
                    "\r\n" + 
                    "                        바우처<br>\r\n" + 
                    "                        <a href=\"http://click.WE-GO.com/wf/click?upn=g4q-2Bbqi2dxgyH2fe-2BqB5z0YvgpVQeTyFgW6O9u0PwrwjOrYdQMemCNeRvig-3D\" style=\"text-decoration: underline;color:#419bf9\"  >https://www.WE-GO.com/voucher/KLK0234379347?token=fb3a2c84-e31e-4628-53d3-5193e401a581&amp;lang=ko_KR</a>\r\n" + 
                    "                        <br>\r\n" + 
                    "\r\n" + 
                    "\r\n" + 
                    "                    </p>\r\n" + 
                    "\r\n" + 
                    "                    <p>\r\n" + 
                    "                        WE-GO을 이용해주셔서 감사합니다! 다음 여행에도 함께 할 수 있기를 바래요. 즐거운 여행되세요!\r\n" + 
                    "                    </p>\r\n" + 
                    "                    <p>\r\n" + 
                    "                        감사합니다. <br>\r\n" + 
                    "                        WE-GO 팀 드림\r\n" + 
                    "                    </p>\r\n" + 
                    "                    <div style=\"border-top: 1px solid #ccc; padding: 10px 0 0; margin-top: 30px; text-align: center;\">\r\n" + 
                    "                        <a style=\"color: #777; font-size: 12px;\" href=''>WE-GO.com</a> |\r\n" + 
                    "                        <a style=\"color: #777; font-size: 12px;\" href='' >Facebook Fan Page</a>\r\n" + 
                    "                    </div>\r\n" + 
                    "                </div>\r\n" + 
                    "            </div>\r\n" + 
                    "        </div>";// 내용

         if (from.trim().equals("")) {
            System.out.println("보내는 사람을 입력하지 않았습니다.");
         } else if (to.trim().equals("")) {
            System.out.println("받는 사람을 입력하지 않았습니다.");
         } else {
            try {
               Mail mt = new Mail();

               // 메일보내기
               mt.sendEmail(from, to, cc, subject, content);
               System.out.println("메일 전송에 성공하였습니다.");
            } catch (MessagingException me) {
               System.out.println("메일 전송에 실패하였습니다.");
               System.out.println("실패 이유 : " + me.getMessage());
            } catch (Exception e) {
               System.out.println("메일 전송에 실패하였습니다.");
               System.out.println("실패 이유 : " + e.getMessage());
            }
         }
      }
   
   public String getToken(HttpServletRequest request

         ,HttpServletResponse response

         ,JSONObject json

         ,String requestURL) throws Exception{

      

      // requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보 

      String _token = "";

      try{

         String requestString = "";

         URL url = new URL(requestURL);

         HttpURLConnection connection = (HttpURLConnection) url.openConnection();

         connection.setDoOutput(true);             

         connection.setInstanceFollowRedirects(false);  

         connection.setRequestMethod("POST");

         connection.setRequestProperty("Content-Type", "application/json");

         OutputStream os= connection.getOutputStream();

         os.write(json.toString().getBytes());
         System.out.println(json.toString());

         connection.connect();

         StringBuilder sb = new StringBuilder(); 

         if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

         

            String line = null;  

            while ((line = br.readLine()) != null) {  

               sb.append(line + "\n");  

            }

            br.close();

            requestString = sb.toString();

         

         }

         os.flush();

         connection.disconnect();

         

         JSONParser jsonParser = new JSONParser();

         JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

         

         if((Long)jsonObj.get("code")  == 0){

            JSONObject getToken = (JSONObject) jsonObj.get("response");

            System.out.println("getToken==>>"+getToken.get("access_token") );

            _token = (String)getToken.get("access_token");

         }

         

      }catch(Exception e){

         e.printStackTrace();

         _token = "";

      }

      return _token;

   }
   
   
   
   public JSONObject getEmail(HttpServletRequest request

         ,HttpServletResponse response

         ,JSONObject json1

         ,String requestURL) throws Exception{

      

      // requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보 
      JSONObject object=new JSONObject();
      

      try{

         String requestString = "";

         URL url = new URL(requestURL);

         HttpURLConnection connection = (HttpURLConnection) url.openConnection();

         connection.setDoOutput(true);             

         connection.setInstanceFollowRedirects(false);  

         connection.setRequestMethod("GET");

         connection.setRequestProperty("Content-Type", "application/json");

         OutputStream os= connection.getOutputStream();

         os.write(json1.toString().getBytes());
              
         System.out.println(json1.toString());
         connection.connect();

         StringBuilder sb = new StringBuilder(); 
            System.out.println(connection.getResponseCode());
         if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

         

            String line = null;  

            while ((line = br.readLine()) != null) {  

               sb.append(line + "\n");  

            }

            br.close();

            requestString = sb.toString();

         

         }

         os.flush();

         connection.disconnect();

         

         JSONParser jsonParser = new JSONParser();

         JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

         

         if((Long)jsonObj.get("code")  == 0){

            JSONObject getToken = (JSONObject) jsonObj.get("response");

            System.out.println("getToken==>>"+getToken.get("buyer_email") );
            
            object.put("amount", Long.toString((Long) getToken.get("amount")));
            object.put("email",(String)getToken.get("buyer_email"));
            object.put("merchant_uid",(String)getToken.get("merchant_uid"));
            object.put("name",(String)getToken.get("name"));
         }

         

      }catch(Exception e){

         e.printStackTrace();

         object = null;

      }

      return object;

   }
   
}