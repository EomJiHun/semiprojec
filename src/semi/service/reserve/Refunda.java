package semi.service.reserve;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
@WebServlet("/refunda")
public class Refunda extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String imp_key 		=	URLEncoder.encode("2452067702364451", "UTF-8");

		String imp_secret	=	URLEncoder.encode("8cDLzuuNW01ZHKLJ15kruSyjcXoFBMLJYpvyUZlQ0mPI7Br9GLAaE9uQ6SwIFhrEHWdBWyrWVhE3S5cy", "UTF-8");
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
		System.out.println(_token);
		
		
		
		JSONObject json1 = new JSONObject();

		json1.put("Authorization", _token);
		json1.put("imp_uid","imp_959618117300");
		JSONObject object1=new JSONObject();
		try {
			
			object1=getEmail(req, resp, json1, "https://api.iamport.kr/payments/cancel?_token="+_token);
		    System.out.println("object1"+object1);
		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

		connection.setRequestMethod("POST");

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

			System.out.println("getToken==>>"+getToken.get("buyer_addr") );
			
		
			object.put("buyer_addr",(String)getToken.get("buyer_addr"));
			System.out.println((String)getToken.get("buyer_addr"));
		}

		

	}catch(Exception e){

		e.printStackTrace();

		object = null;

	}

	return object;

}


}