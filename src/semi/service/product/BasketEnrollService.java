package semi.service.product;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.BasketDAO;
import semi.model.dao.ProductDAO;
import semi.model.dto.BasketDTO;
import semi.service.Service;


// 장바구니에 값을 입력해준다
public class BasketEnrollService implements Service{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BasketDTO dto = new BasketDTO();
		HttpSession session = req.getSession();
		int pnum = Integer.parseInt(req.getParameter("pnum"));
		int price = Integer.parseInt(req.getParameter("price"));
		String email = (String)session.getAttribute("email");
		String title = req.getParameter("til");
		String options = req.getParameter("opt");
		String date = req.getParameter("date");
		ProductDAO pdao = ProductDAO.getInstance();
		System.out.println("date : " + date);
		dto.setPnum(pnum);
		dto.setEmail(email);
		dto.setPrice(price);
		dto.setDay(date);
		int pid = 0;
		try {
			pid = pdao.getPid(title, options);
			dto.setPid(pid);
			
			BasketDAO bdao = BasketDAO.getInstance();
			bdao.insertBasket(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
