package semi.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.model.dao.UserDAO;
import semi.service.Service;

public class UpdatePwdService implements Service{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("updatePwd 들어옴");
		String email=req.getParameter("email");
		String pwd=req.getParameter("pwd");
		UserDAO dao=UserDAO.getInstance();
		dao.updatePwd(email, pwd);
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println("<script>alert('비밀번호가 변경되었습니다'); location.href='/semiproject/users/login.jsp';</script>");
		out.flush();


		
	}
}
