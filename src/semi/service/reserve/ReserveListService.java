package semi.service.reserve;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.ReserveDAO;
import semi.model.dto.PagingDTO;
import semi.model.dto.ReserveDTO;
import semi.service.Service;

public class ReserveListService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ReserveDTO> aList = new ArrayList<ReserveDTO>();
		int pageNum = 1;
		if(req.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		PagingDTO pdto = new PagingDTO();
		
		ReserveDAO dao = ReserveDAO.getInstance();
		try {
			int total = dao.totalRow();
			pdto.setTotal(total);
			pdto.setPage(pageNum);
			pdto.setBlockPage(pageNum);
			aList = dao.reserveList(pdto);
		} catch (SQLException e) {
			System.out.println("ReserveListService 에러 : " + e.getMessage());
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("reserveList", aList);
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("pdto", pdto);

	}

}
