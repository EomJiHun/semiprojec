package semi.service.user;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.model.dao.UserDAO;
import semi.model.dto.UserDTO;
import semi.service.Service;


public class RegisterService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub

		String email=req.getParameter("email");
		String pwd=req.getParameter("pwd");
		String ip=req.getRemoteAddr();
		
		UserDAO dao=UserDAO.getInstance();
		UserDTO dto =new UserDTO();
		dto.setEmail(email);
		dto.setPwd(pwd);
		dto.setIp(ip);
		
		try {
			dao.registerMethod(dto);
		} catch (SQLException e) {
			System.out.println("RegisterService에러 : " + e.getMessage());
		}
	}
}
