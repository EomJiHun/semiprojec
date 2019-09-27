package semi.service.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.AdminLogDAO;
import semi.model.dto.AdminLogDTO;
import semi.model.dto.PagingDTO;
import semi.service.Service;

// 로그 List를 가져와 주는 서비스 이다.
public class AdminLogListService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<AdminLogDTO> aList = new ArrayList<AdminLogDTO>();
		AdminLogDAO dao = AdminLogDAO.getInstance();
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
			aList = dao.searchLog(pdto);
		} catch (SQLException e) {
			System.out.println("AdminLogListService 에러 : " + e.getMessage());
		}
		HttpSession session = req.getSession();
		session.setAttribute("logList", aList);
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("pdto", pdto);
	}

}
