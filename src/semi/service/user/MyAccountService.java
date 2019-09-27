package semi.service.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.UserDAO;
import semi.model.dto.UserDTO;
import semi.service.Service;

public class MyAccountService implements Service {

	@Override
	//계정 정보가져오기
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		UserDAO dao= UserDAO.getInstance();
		HttpSession session=req.getSession();
		String email= (String)session.getAttribute("email");
		List<UserDTO> aList= dao.selectMethod(email);
		req.setAttribute("user", aList);
		RequestDispatcher dis= req.getRequestDispatcher("/users/mypage.jsp");
		dis.forward(req, resp);
		
	}
}
