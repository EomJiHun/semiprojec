package semi.service.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.ProductDAO;
import semi.model.dto.PagingDTO;
import semi.model.dto.ProductDTO;
import semi.service.Service;

public class ProductListService implements Service{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> aList = new ArrayList<ProductDTO>();
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
			aList = dao.listMethod(pdto);
		} catch (SQLException e) {
			System.out.println("ProductListService 에러 : " + e.getMessage());
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("aList", aList);
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("pdto", pdto);
	}

}
