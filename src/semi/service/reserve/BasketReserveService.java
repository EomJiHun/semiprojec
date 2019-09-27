package semi.service.reserve;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.BasketDAO;
import semi.model.dao.UserDAO;
import semi.model.dto.ReserveDTO;
import semi.model.dto.UserDTO;
import semi.service.Service;

//  장바구니에서 결제를 누를시 예약페이지로 값을 넘겨준다
public class BasketReserveService implements Service{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		BasketDAO dao = BasketDAO.getInstance();
		String[] num = req.getParameterValues("list");
		String email = (String)session.getAttribute("email");
		
		List<ReserveDTO> aList = new ArrayList<ReserveDTO>();
		try {
			aList = dao.transReserve(num, email);
		} catch (SQLException e) {
			System.out.println("BasketReserveService 에러 : " + e.getMessage());
		}
		List<UserDTO> userList = new ArrayList<UserDTO>();
		UserDAO udao = UserDAO.getInstance();
		userList = udao.selectMethod(email);
		
		session.setAttribute("aList", aList);
		session.setAttribute("user", userList);
		
		session.setAttribute("num", num); // 장바구니 삭제를 위해 보내준다
		
		
	}

}
