package semi.service.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.AdminLogDAO;
import semi.model.dao.NoticeDAO;
import semi.model.dto.AdminLogDTO;
import semi.model.dto.NoticeDTO;
import semi.service.Service;

public class InsertNoticeService implements Service{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeDTO dto = new NoticeDTO();
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setBid(Integer.parseInt(req.getParameter("state")));
		
		HttpSession session = req.getSession();
		dto.setId((String)session.getAttribute("admin"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		AdminLogDAO logDao = AdminLogDAO.getInstance();
		AdminLogDTO logDto = new AdminLogDTO();
		
		// 공지사항을 작성했다는 로그를 등록해준다.
		String[] category = {"예약", "결제", "변경&환불", "계정"};
		
		logDto.setId((String)session.getAttribute("admin"));
		logDto.setContent("["+category[dto.getBid()-1]+"] 공지사항 작성");
		logDto.setName((String)session.getAttribute("adminName"));
		logDto.setIp(req.getRemoteAddr());
		
		
		try {
			dao.insertNotice(dto);
			logDao.insertLog(logDto);
		} catch (SQLException e) {
			System.out.println("InsertNoticeService 에러 : " + e.getMessage());
		}
	}

}
