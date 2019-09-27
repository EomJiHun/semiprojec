package semi.service.reserve;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import semi.model.dao.ReserveDAO;
import semi.service.Service;

@WebServlet("/rec/recancel")
public class ReserveCancel extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("제발들어와라");
		ReserveDAO dao= ReserveDAO.getInstance();
		String code=req.getParameter("code");
		System.out.println(code);
	     dao.rpidUpdate(code);
		
		
	}
}
