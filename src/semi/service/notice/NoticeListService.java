package semi.service.notice;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.NoticeDAO;
import semi.model.dto.NoticeDTO;
import semi.service.Service;

public class NoticeListService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("bid"));
		NoticeDAO dao = NoticeDAO.getInstance();

		List<NoticeDTO> aList = new ArrayList<NoticeDTO>();

		try {
			aList = dao.searchNotice(num);
		} catch (SQLException e) {
			System.out.println("NoticeListService 에러 : " + e.getMessage());
		}
		String[] category = {"예약", "결제", "변경&환불", "계정"};
		HttpSession session = req.getSession();
		session.setAttribute("notice", aList);
		session.setAttribute("category", category[num-1]);

	}

}
