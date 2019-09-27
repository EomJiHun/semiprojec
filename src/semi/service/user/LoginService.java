package semi.service.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.AdminDAO;
import semi.model.dao.AdminLogDAO;
import semi.model.dao.UserDAO;
import semi.model.dto.AdminDTO;
import semi.model.dto.AdminLogDTO;
import semi.model.dto.UserDTO;
import semi.service.Service;

public class LoginService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		UserDAO dao = UserDAO.getInstance();
		UserDTO dto = new UserDTO();

		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		String ip = req.getRemoteAddr();
		String value = req.getParameter("captcha");
		
		dto.setEmail(email);
		dto.setPwd(pwd);
		dto.setIp(ip);
		String dbip = "";
		
		// 관리자인지 확인하기 위한 과정
		AdminDTO adto = new AdminDTO();
		AdminDAO adao = AdminDAO.getInstance();
		adto.setId(req.getParameter("email"));
		adto.setPwd(req.getParameter("pwd"));
		AdminDTO resultAdto = new AdminDTO();
		try {
			// 해당하는 email의 ip를 가지고온 결과
			dbip = dao.ip(email);
			
			// 관리자의 결과를 확인해 본다.
			resultAdto = adao.searchAdmin(adto);
			
		} catch (SQLException e1) {
			System.out.println("LoginService에러 :" + e1.getMessage());
		}
		String[] resArray = dbip.split(",");
		// String dbip = "0:0:0:0:0:0:0:1";
		String res = "";
		if(resultAdto.getName().equals("")) {
		boolean result = false;
		try {
			// 해당하는 email과 pw가 존재하는지 여부
			result = dao.login(dto);
		} catch (SQLException e1) {
			System.out.println("LoginService에러 :" + e1.getMessage());
		}
		// 아이디 비밀번호 같은지 여부
		boolean bip = false; // ip가 같은지 다른지
		for (int i = 0; i < resArray.length; i++) {
			if (ip.equals(resArray[i])) {
				bip = true;

				break;
			}
		}
		
		// 아이디 비밀번호가 같은경우
		if (result == true) {
			// ip가 일치하는 경우
			if (bip == true) {
				String[] emailSplit = dto.getEmail().split("@");
				session.setAttribute("name", emailSplit[0]); // session에 이메일 저장
				session.setAttribute("email", dto.getEmail());
				System.out.println("로그인성공");
				res = "true";
			} else { // Ip가 다른경우
				res = "show";
				if (!(value.equals(null)) && !(value.equals("null")) && !(value.equals(""))) {
					res = "login";
				}
			}

		} else { // 로그인 실패
			System.out.println("아이디비밀번호다름");
			res = "false";
		}
		}else {
			session.setAttribute("admin", resultAdto.getId());
			session.setAttribute("adminName", resultAdto.getName());
			// 로그인 로그를 추가해준다.
			AdminLogDAO logDao = AdminLogDAO.getInstance();
			AdminLogDTO logDto = new AdminLogDTO();
			logDto.setId( resultAdto.getId());
			logDto.setContent("로그인");
			logDto.setName(resultAdto.getName());
			logDto.setIp(req.getRemoteAddr());
			try {
				logDao.insertLog(logDto);
			} catch (SQLException e) {
				System.out.println("insertLog 에러 : " + e.getMessage());
			}
			res = "true"; // 관리자 아이디인경우
		}
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out;
		try {
			out = resp.getWriter();
			out.print(res);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
