package semi.service.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.model.dao.BasketDAO;
import semi.service.Service;

// 장바구니를 삭제해준다.
public class BasketDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("no"));
		BasketDAO dao = BasketDAO.getInstance();
		dao.basketDelte(no);
	}

}
