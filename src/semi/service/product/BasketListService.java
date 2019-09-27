package semi.service.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.BasketDAO;
import semi.model.dto.BasketDTO;
import semi.service.Service;

// 장바구니 리스트를 출력해준다
public class BasketListService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
		BasketDAO dao = BasketDAO.getInstance();
		List<BasketDTO> basList = dao.basList(email);
		
		req.setAttribute("aList", basList);
		

	}

}
