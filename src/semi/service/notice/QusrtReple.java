package semi.service.notice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.QuestionDAO;
import semi.model.dto.QuestionDTO;
import semi.service.Service;

public class QusrtReple implements Service {

	@Override//댓글을 DB에 저장을 시키고 댓글만 출력하는 서버 액션
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuestionDTO dto = new QuestionDTO();
		List<QuestionDTO> aList = new ArrayList<QuestionDTO>();
		int no = Integer.parseInt(req.getParameter("no"));
		String title = req.getParameter("title");
		String content =req.getParameter("content");
		String email =req.getParameter("writer");
		String day = req.getParameter("day");
		String coments = req.getParameter("coments");
		dto.setComments(coments);
		System.out.println("coments:"+coments);
		dto.setContent(content);
		System.out.println("content:"+content);
		dto.setDay(day);
		System.out.println("day:"+day);
		dto.setEmail(email);
		System.out.println("email:"+email);
		dto.setNo(no);
		System.out.println("no:"+no);
		dto.setQid((2));
		dto.setTitle(title);
		System.out.println("title:"+title);
		dto.setVnum(0);
		aList.add(dto);
		QuestionDAO dao = QuestionDAO.getInstance();
		dao.repleUpdate(aList);
		req.setAttribute("a", no);
//		
//		HttpSession session = req.getSession();
//		session.setAttribute("aList", dao.comentsList(no));
//		session.setAttribute("repl", dao.rePleList(no));
	}

}
