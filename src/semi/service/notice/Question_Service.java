package semi.service.notice;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.QuestionDAO;
import semi.model.dto.PagingDTO;
import semi.model.dto.QuestionDTO;
import semi.service.Service;

public class Question_Service implements Service {

	@Override//질문리스트 뽑는 서비스서버
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuestionDAO dao = QuestionDAO.getInstance();
		List<QuestionDTO> aList = new ArrayList<QuestionDTO>();
		int pageNum = 1;
		if(req.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		PagingDTO pdto = new PagingDTO();
		try {
			int total = dao.totalRow();
			pdto.setTotal(total);
			pdto.setPage(pageNum);
			pdto.setBlockPage(pageNum);
			aList = dao.quesList(pdto);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Question_service에러 : " + e.getMessage());
		}
		
		HttpSession session=req.getSession();
		session.setAttribute("aList", aList);
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("pdto", pdto);
		
	}

}//end class
