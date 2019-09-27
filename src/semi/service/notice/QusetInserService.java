package semi.service.notice;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.json.JSONObject;

import com.google.gson.JsonObject;

import semi.model.dao.QuestionDAO;
import semi.service.Service;


public class QusetInserService implements Service {
	
	
	@Override//질문 한걸 db에 저장시키고 리스트 출력하는 액션 서버
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuestionDAO dao = QuestionDAO.getInstance();
		JSONObject json = new JSONObject();
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String email = req.getParameter("email");
		HttpSession session = req.getSession();

		dao.quesInset(email, title, content);

	}

}//end class
