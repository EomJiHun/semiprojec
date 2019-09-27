package semi.service.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.ReserveDAO;
import semi.model.dto.ReserveDTO;
import semi.service.Service;

public class MyRserveListService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ReserveDAO dao=ReserveDAO.getInstance();
		HttpSession session=req.getSession();
		String email=(String)session.getAttribute("email");
		List<ReserveDTO> aList= dao.selectMethod(email);
		req.setAttribute("aList", aList);
		
		
	}
	
}
