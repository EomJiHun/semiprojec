package semi.service.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.QuestionDAO;
import semi.service.Service;

public class QuestDelet implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("chk"));
		QuestionDAO dao = QuestionDAO.getInstance();
		System.out.println(num);
		dao.delet(num);
		
	}

}
