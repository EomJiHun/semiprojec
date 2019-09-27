package semi.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.model.dao.UserDAO;
import semi.service.Service;

public class FindIdService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String phone=req.getParameter("phone");
		UserDAO dao=UserDAO.getInstance();
		String result=dao.findIdMethod(phone);
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out;
		try {
			out = resp.getWriter();
			out.print(result);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
