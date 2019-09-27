package semi.service.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.AdminDAO;
import semi.model.dao.AdminLogDAO;
import semi.model.dto.AdminDTO;
import semi.model.dto.AdminLogDTO;
import semi.service.Service;

// 관리자를 등록해준다.
public class EnrollAdminService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminDTO dto = new AdminDTO();
		dto.setId(req.getParameter("id"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setName(req.getParameter("name"));
		dto.setIp(req.getRemoteAddr());
		
		AdminDAO dao = AdminDAO.getInstance();
		AdminLogDAO logDao = AdminLogDAO.getInstance();
		AdminLogDTO logDto = new AdminLogDTO();
		HttpSession session = req.getSession();
		logDto.setId((String)session.getAttribute("admin"));
		logDto.setContent("[등록] 관리자  : " + dto.getName());
		logDto.setName((String)session.getAttribute("adminName"));
		logDto.setIp(req.getRemoteAddr());
		try {
			dao.insertAdmin(dto);
			logDao.insertLog(logDto);
		} catch (SQLException e) {
			System.out.println("EnrollAdminService에러 : " + e.getMessage());
		}
	}

}
