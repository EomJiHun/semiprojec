package semi.service.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.model.dao.ProductDAO;
import semi.service.Service;

public class ProductCountService implements Service{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductDAO cdao= ProductDAO.getInstance();
		int num = Integer.parseInt(req.getParameter("count"));
		String options = req.getParameter("options");
		try {
			cdao.plusCount(num, options);
		} catch (SQLException e) {
			System.out.println("ProductCountService 에러 : " + e.getMessage());
		}
	}
}
