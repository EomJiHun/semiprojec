package semi.service.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.AdminLogDAO;
import semi.model.dto.AdminLogDTO;
import semi.service.Service;

public class AdminLogoutService implements Service{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		AdminLogDAO dao = AdminLogDAO.getInstance();
		AdminLogDTO dto = new AdminLogDTO();
		dto.setId((String)session.getAttribute("admin"));
		dto.setContent("로그아웃");
		dto.setName((String)session.getAttribute("adminName"));
		dto.setIp(req.getRemoteAddr());
		
		try {
			dao.insertLog(dto);
		} catch (SQLException e) {
			System.out.println("insertLog 에러 : " + e.getMessage());
		}
		
		session.removeAttribute("admin");
		session.removeAttribute("adminName");
	}

}
