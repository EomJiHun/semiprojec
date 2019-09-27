package semi.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.UserDAO;
import semi.service.Service;

public class UpdateMyPwdService implements Service{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		String email=(String) session.getAttribute("email");
		String now_pwd=req.getParameter("now_pwd");
		
		UserDAO dao=UserDAO.getInstance();
		boolean result=dao.pwdConfirm(now_pwd, email);
		System.out.println(result);
		String pwd=req.getParameter("pwd");
		String pwd1=req.getParameter("pwd1");
		if(result ==false)
		{
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('현재비밀번호가 다릅니다'); location.href='/semiproject/user/selectAccount';</script>");
			out.flush();
			
			
		}
		else
		{
			if(pwd.equals(pwd1))
			{
				dao.updatePwd(email, pwd);
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('비밀번호가 변경되었습니다'); location.href='/semiproject/user/selectAccount';</script>");
				out.flush();
				
			}
			else
			{
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('새 비밀번호가 일치 하지 않습니다'); location.href='/semiproject/user/selectAccount';</script>");
				out.flush();
				
				
				
			}
		}
		
			
		
	}
}
