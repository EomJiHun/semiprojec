package semi.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.UserDAO;
import semi.model.dto.UserDTO;
import semi.service.Service;

//계정설정 업데이트
public class UpdateAccount implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String lname=req.getParameter("lname");
		String fname=req.getParameter("fname");
		System.out.println(lname);
		String country=req.getParameter("country");
		String p_country=req.getParameter("p_country");
		System.out.println(country);
		String myemail=req.getParameter("myemail");
		String phone=req.getParameter("tel");
		HttpSession session =req.getSession();
		String email=(String)session.getAttribute("email");
		UserDAO dao=UserDAO.getInstance();
		UserDTO dto=new UserDTO();
		dto.setLname(lname);
		dto.setFname(fname);
		dto.setCountry(country);
		dto.setP_country(p_country);
		dto.setPhone(phone);
		dto.setMyemail(myemail);
		dto.setEmail(email);
		dao.updateMethod(dto);
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println("<script>alert('계정설정이 변경되었습니다!'); location.href='/semiproject/user/selectAccount';</script>");
		out.flush();
		
		//update int 값보내서 성공 여부따질까
		
		
		
		
	}
}
