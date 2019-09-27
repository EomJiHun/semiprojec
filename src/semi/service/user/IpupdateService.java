package semi.service.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import semi.model.dao.UserDAO;
import semi.model.dto.UserDTO;
import semi.service.Service;

public class IpupdateService implements Service {

	public void execute(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) {
		
		UserDAO dao= UserDAO.getInstance();
		UserDTO dto= new UserDTO();
		dto.setEmail(req.getParameter("email"));
		dto.setIp(req.getRemoteAddr());
		int cnt = 0;
		try {
			cnt = dao.ipUpdate(dto);
		} catch (SQLException e1) {
			System.out.println("IpupdateService에러 : " + e1.getMessage());
		}
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out;
		HttpSession session = req.getSession();
		if(cnt == 1) {
			// 세션에 email 저장
			if(session.getAttribute("email")==null) {
				session.setAttribute("email", dto.getEmail());
			}
		}
		try {
			out = resp.getWriter();
			out.print(cnt);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	};
}
