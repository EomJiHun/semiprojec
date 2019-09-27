package semi.service.admin;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.AdminLogDAO;
import semi.model.dao.ProductDAO;
import semi.model.dto.AdminLogDTO;
import semi.model.dto.ProductDTO;
import semi.service.Service;

public class RegisterProductService implements Service{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		ProductDTO dto = new ProductDTO();
		dto.setTitle(req.getParameter("title"));
		dto.setCid(Integer.parseInt(req.getParameter("cid")));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		dto.setId((String)session.getAttribute("admin"));
		dto.setOptions(req.getParameter("options"));
		
		ProductDAO dao= ProductDAO.getInstance();
		
		AdminLogDAO logDao = AdminLogDAO.getInstance();
		AdminLogDTO logDto = new AdminLogDTO();
		
		logDto.setId((String)session.getAttribute("admin"));
		logDto.setContent("[등록] 상품  : " + dto.getTitle() +" / " + dto.getOptions());
		logDto.setName((String)session.getAttribute("adminName"));
		logDto.setIp(req.getRemoteAddr());
		try {
			dao.insertMethod(dto);
			logDao.insertLog(logDto);
		} catch (SQLException e) {
			System.out.println("RegisterProductService 에러 : " + e.getMessage());
		}
		
		
		
	}

}
