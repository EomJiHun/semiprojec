package semi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.service.user.CaptchaService;
import semi.service.user.FindIdService;
import semi.service.user.FindPwdService;
import semi.service.user.IpupdateService;
import semi.service.user.LoginService;
import semi.service.user.LogoutService;
import semi.service.user.MyAccountService;
import semi.service.user.MyRserveListService;
import semi.service.user.RegisterService;
import semi.service.user.UpdateAccount;
import semi.service.user.UpdateMyPwdService;
import semi.service.user.UpdatePwdService;

@WebServlet("/user/*")
public class UserController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}// end doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}// end doPost

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		String next = "";
		System.out.println("user컨트롤러 : " + action);
		if (action.equals("/*")) {

		} else if (action.equals("register")) { // 회원가입 하는 것.
			RegisterService regi = new RegisterService();
			regi.execute(req, resp);
			// 회원가입 성공시 로그인 페이지로 이동
			resp.sendRedirect("/semiproject/user/login_page");
		} else if (action.equals("captchaAction")) { // 네이버 캡쳐 인증(로그인 / 회원가입)
			CaptchaService cap = new CaptchaService();
			cap.execute(req, resp);
		} else if (action.equals("login")) { // 로그인 실행
			LoginService ls = new LoginService();
			ls.execute(req, resp);
		} else if (action.equals("ipupdate")) { // ip 추가
			IpupdateService ipupdate = new IpupdateService();
			ipupdate.execute(req, resp);
		} else if (action.equals("login_page")) { // 로그인 페이지로 이동
			next = "/users/login.jsp";
		} else if (action.equals("register_page")) { // 회원가입 페이지로 이동
			next = "/users/register.jsp";
		} else if (action.equals("my_page")) { // 마이페이지로 이동
			next = "/users/mypage.jsp";
		} else if (action.equals("logout")) { // 로그아웃
			LogoutService service = new LogoutService();
			service.execute(req, resp);
			resp.sendRedirect("/semiproject/semi");
		} else if (action.equals("findId")) { // 아이디찾기
			FindIdService find = new FindIdService();
			find.execute(req, resp);
		} else if (action.equals("findPwd")) { // 비밀번호
			System.out.println("findPwd실행");
			FindPwdService findp = new FindPwdService();
			findp.execute(req, resp);
		} else if (action.equals("UpdatePwd")) { // 아이디찾기에서 비밀번호변경
			UpdatePwdService update = new UpdatePwdService();
			update.execute(req, resp);
		} else if (action.equals("selectAccount")) { // 계정설정내용조회
			MyAccountService my = new MyAccountService();
			my.execute(req, resp);
		} else if (action.equals("UpdateMember")) { // 계정설정 update
			UpdateAccount ua = new UpdateAccount();
			ua.execute(req, resp);
			resp.sendRedirect("/semiproject/user/selectAccount");
		} else if (action.equals("Update")) // 로그인한후 계정설정에서
		{
			UpdateMyPwdService up = new UpdateMyPwdService();
			up.execute(req, resp);
			resp.sendRedirect("/semiproject/user/selectAccount");
		} else if (action.equals("ReserveList")) {
			MyRserveListService rl = new MyRserveListService();
			rl.execute(req, resp);
			next = "/users/my_reserv_list.jsp";

		}

		if (next != "") {
			RequestDispatcher dis = req.getRequestDispatcher(next);
			dis.forward(req, resp);
		}
	}
}
