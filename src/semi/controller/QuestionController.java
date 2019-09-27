package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import semi.model.dao.QuestionDAO;
import semi.service.notice.NoticeListService;
import semi.service.notice.QuestDelet;
import semi.service.notice.QuestionComent;
import semi.service.notice.Question_Service;
import semi.service.notice.QusetInserService;
import semi.service.notice.QusrtReple;




@WebServlet("/question/*")
public class QuestionController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req,resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req,resp);
	}
	
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		JSONObject object = new JSONObject();
		
		String action = uri.substring(uri.lastIndexOf("/"));
		String path = "";
		if(action.equals("/home") || action.equals("/*")) {
			path = "/notice/notis.jsp";//응답해줄 페이지 저장
		}else if(action.equals("/wirte.do")) {
			path = "/notice/question_write.jsp";
		}else if(action.equals("/notice")) { // 모든 공지사항을 처리해준다.
			NoticeListService service = new NoticeListService();
			service.execute(req, resp);
			object.put("url", "/semiproject/notice/noticeQst.jsp");
		}else if(action.equals("/question")) {
			Question_Service dao = new Question_Service();
			dao.execute(req, resp);
			object.put("url", "/semiproject/notice/question_board.jsp");
		}else if(action.equals("/write")) {
			object.put("url", "/semiproject/notice/question_write.jsp");
		}else if(action.equals("/text")) {
			QuestionComent qc = new QuestionComent();
			qc.execute(req, resp);
			object.put("url", "/semiproject/notice/question_text.jsp");
		}else if(action.equals("/qusrWrite")) {
			QusetInserService qwri = new QusetInserService();
			qwri.execute(req, resp);
			resp.sendRedirect("/semiproject/question/question");
		}else if(action.equals("/review")) {
			QusrtReple rep = new QusrtReple();
			rep.execute(req, resp);
			QuestionComent qc = new QuestionComent();
			qc.execute(req, resp);
			object.put("url", "/semiproject/notice/question_text.jsp");
		}else if(action.equals("/delete")) {
			QuestDelet delet = new QuestDelet();
			delet.execute(req, resp);
			resp.sendRedirect("/semiproject/question/question");
		}
		
		//end/////////////////////////////s
		
		
		if(path != "") {
			RequestDispatcher dis = req.getRequestDispatcher(path);
			dis.forward(req, resp);
		}
		out.print(object);
		out.flush();
	
	};
}//end class
