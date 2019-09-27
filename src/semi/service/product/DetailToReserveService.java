package semi.service.product;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.ProductDAO;
import semi.model.dao.UserDAO;
import semi.model.dto.ReserveDTO;
import semi.model.dto.UserDTO;
import semi.service.Service;

// 상세페이지에서 결제를 눌렀을 때 예약 페이지로 넘어간다
public class DetailToReserveService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReserveDTO dto = new ReserveDTO();
		int price = Integer.parseInt(req.getParameter("price"));
		int pnum = Integer.parseInt(req.getParameter("pnum"));
		String title = req.getParameter("til");
		String options = req.getParameter("opt");
		int pid = 0;
		ProductDAO pdao = ProductDAO.getInstance();
		try {
			pid = pdao.getPid(title, options);
		} catch (SQLException e) {
			System.out.println("DetailToReserveService 에러 : " + e.getMessage());
		}
		String day = req.getParameter("date");
		
		dto.setDay(day);
		dto.setPid(pid);
		dto.setOptions(options);
		dto.setTitle(title);
		dto.setPnum(pnum);
		dto.setPrice(price);

		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("email");
		String[] num = { "1" };
		List<UserDTO> userList = new ArrayList<UserDTO>();
		UserDAO udao = UserDAO.getInstance();
		userList = udao.selectMethod(email);
		List<ReserveDTO> aList = new ArrayList<ReserveDTO>();
		aList.add(dto);
		session.setAttribute("aList", aList);
		session.setAttribute("num", num);
		session.setAttribute("user", userList);

	}

}
