package semi.service.notice;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.QuestionDAO;
import semi.service.Service;

public class QuestionComent implements Service {

	@Override//질문 상세글 보여주는 서버
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuestionDAO dao = QuestionDAO.getInstance();
		int no = 0;
		if(req.getParameter("a") !=null) {
			no = Integer.parseInt(req.getParameter("a"));
		}else {
			no = Integer.parseInt(String.valueOf(req.getAttribute("a")));
		}
		HttpSession session = req.getSession();
		dao.vumupda(no);
		session.setAttribute("aList", dao.comentsList(no));
		session.setAttribute("repl", dao.rePleList(no));
	}

}//end class
