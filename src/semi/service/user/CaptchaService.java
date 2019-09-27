package semi.service.user;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.service.Service;

public class CaptchaService implements Service {

	public static void main(String[] args) {

	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String dirPath = req.getServletContext().getRealPath("/");
		// System.out.println(dirPath);
		// String dirPath="c:/temp/";
		String captchaImageName = null;
		String result = null;
		// System.out.println(captchaImageName);
		String key = req.getParameter("key");
		String value = req.getParameter("value");

		if (value != null) {
			result = this.captchaNkeyResult(key, value);
			System.out.println("value>>>" + result);
		} else {
			key = this.captchaNkey();
			captchaImageName = this.captchaImage(key, dirPath);
			result = key + "," + captchaImageName;
			/// System.out.println("result>>>"+result);
		}
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out;
		try {
			out = resp.getWriter();
			out.print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	String clientId = "2fK7SRDqcmVW9KMVzmpt";// 애플리케이션 클라이언트 아이디값";
	String clientSecret = "osfkif9TdP";// 애플리케이션 클라이언트 시크릿값";

	public String captchaNkey() {
		String result = null;

		try {
			String code = "0"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			// System.out.println(response.toString());
			result = response.toString().substring(8, 8 + 16);
			// result= response.toString();
			// System.out.println(result);
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;

	}

	public String captchaImage(String key, String dirPath) {
		String result = null;
		// String keyjson=captchaNkey();
		try {

			// JSONArray array=new JSONArray("["+keyjson+"]");
			// org.json.JSONObject object=array.getJSONObject(0);
			// String keyres = object.getString("key");
			// System.out.println(keyres);// https://openapi.naver.com/v1/captcha/nkey 호출로
			// 받은 키값

			String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				InputStream is = con.getInputStream();
				int read = 0;
				byte[] bytes = new byte[1024];
				// 랜덤한 이름으로 파일 생성
				String tempname = Long.valueOf(new Date().getTime()).toString(); // util로줌 이상하면바꾸기
				// System.out.println(tempname);
				File f = new File(dirPath + tempname + ".jpg");
				f.createNewFile();
				OutputStream outputStream = new FileOutputStream(f);
				while ((read = is.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
				result = tempname + ".jpg";
				outputStream.close();
				is.close();
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				System.out.println(response.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	public String captchaNkeyResult(String key, String value) {
		String result = null;
		try {
			String code = "1"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
			// String key = "CAPTCHA_KEY"; // 캡차 키 발급시 받은 키값
			// String value = "USER_VALUE"; // 사용자가 입력한 캡차 이미지 글자값
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value="
					+ value;

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			// System.out.println(response.toString());
			result = response.toString().substring(10, 14);
			// System.out.println(result);
		} catch (Exception e) {
			System.out.println(e);
		}

		return result;
	}
}