package semi.service.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.UserDAO;
import semi.service.Service;
import semi.service.mail.Mail;

public class FindPwdService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("여기들어옴");
		String email = req.getParameter("email");
		UserDAO dao = UserDAO.getInstance();
		boolean result = dao.findPwd(email);
		if (result == true) {
			
			
			post(email, req);
		}
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out;
		try {
			out = resp.getWriter();
			HttpSession session=req.getSession(true);
			System.out.println("flush전"+session.getAttribute("uid"));
			out.print(result);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void post(String to, HttpServletRequest req)// 메일 보낼사람
	{
		UUID uid = UUID.randomUUID();
		HttpSession session=req.getSession();
		session.setAttribute("uid", uid.toString());
		System.out.println("메일전성되기전"+session.getAttribute("uid"));
		String from = "testsemi1112@gmail.com"; // 메일 보내는 사람
		String cc = ""; // 참조
		String subject = "[WE-GO] 비밀번호 찾기 인증코드 안내";// 제목
		String content = "<div align='center' style='border:1px solid black'>\r\n"
				+ "<h3 style='color:#ff5722; font-size:100%;'>비밀번호 찾기 인증코드입니다</h3>\r\n"
				+ "<div style='font-size:130%;'>비밀번호 찾기 인증코드 <strong>" + uid.toString() + "</strong></div><br>";// 내용

		if (from.trim().equals("")) {
			System.out.println("보내는 사람을 입력하지 않았습니다.");
		} else if (to.trim().equals("")) {
			System.out.println("받는 사람을 입력하지 않았습니다.");
		} else {
			try {
				Mail mt = new Mail();

				// 메일보내기
				mt.sendEmail(from, to, cc, subject, content);
				System.out.println("메일 전송에 성공하였습니다.");
			} catch (MessagingException me) {
				System.out.println("메일 전송에 실패하였습니다.");
				System.out.println("실패 이유 : " + me.getMessage());
			} catch (Exception e) {
				System.out.println("메일 전송에 실패하였습니다.");
				System.out.println("실패 이유 : " + e.getMessage());
			}
		}
	}

}
