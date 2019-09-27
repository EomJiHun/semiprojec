package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import semi.service.admin.AdminListService;
import semi.service.admin.AdminLogListService;
import semi.service.admin.AdminLogoutService;
import semi.service.admin.EnrollAdminService;
import semi.service.admin.EnrollCityService;
import semi.service.admin.EnrollProductService;
import semi.service.admin.InsertNoticeService;
import semi.service.admin.ProductListService;
import semi.service.admin.RegisterProductService;
import semi.service.reserve.ReserveListService;

// 관리자 컨트롤러
@WebServlet("/semi/admin/*")
public class AdminController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}

	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String path = req.getRequestURI();
		String next = "";
		JSONObject object = new JSONObject();

		// 요청 URI
		path = path.substring(path.lastIndexOf("/") + 1);

		// 관리자 페이지 홈
		if (path.equals("admin")) {
			next = "/admin/admin_page.jsp";
		} else if (path.equals("log")) { // 관리자 로그 페이지
			AdminListService service2 = new AdminListService();
			service2.execute(req, resp);
			AdminLogListService service = new AdminLogListService();
			service.execute(req, resp);
			object.put("url", "/semiproject/admin/admin_log.jsp");
		} else if (path.equals("reserve")) { // 예약 관리 페이지
			ReserveListService service = new ReserveListService();
			service.execute(req, resp);
			object.put("url", "/semiproject/admin/admin_reserve.jsp");
		} else if (path.equals("product")) { // 상품 관리 페이지
			ProductListService service = new ProductListService();
			service.execute(req, resp);
			object.put("url", "/semiproject/admin/admin_pro.jsp");
		} else if (path.equals("notice")) { // 공지사항
			object.put("url", "/semiproject/admin/admin_notice.jsp");
		} else if (path.equals("notice_write")) { // 공지사항 글쓰기
			InsertNoticeService service = new InsertNoticeService();
			service.execute(req, resp);
			resp.sendRedirect("/semiproject/admin/admin_page.jsp");
		} else if (path.equals("product_enroll")) { // 상품등록 페이지로 이동
			object.put("url", "/semiproject/admin/admin_enroll.jsp");
		} else if (path.equals("enroll_photo")) { // 에디터에 사진등록
			EnrollProductService service = new EnrollProductService();
			service.execute(req, resp);
			object.put("url", "/semiproject/admin/admin_enroll.jsp");
		} else if (path.equals("city")) { // 도시정보 등록
			object.put("url", "/semiproject/admin/admin_city.jsp");
		} else if (path.equals("admin_info")) { // 관리자 정보
			AdminListService service = new AdminListService();
			service.execute(req, resp);
			object.put("url", "/semiproject/admin/admin_info.jsp");
		} else if (path.equals("admin_enroll")) { // 관리자 등록 페이지
			object.put("url", "/semiproject/admin/admin_infoEnroll.jsp");
		} else if (path.equals("admin_info_enroll")) { // 관리자 등록 서비스
			EnrollAdminService service = new EnrollAdminService();
			service.execute(req, resp);
			resp.sendRedirect("/semiproject/admin/admin_page.jsp");
		} else if (path.equals("product_write")) { // 상품 글쓰기
			RegisterProductService service = new RegisterProductService();
			service.execute(req, resp);
			resp.sendRedirect("/semiproject/admin/admin_page.jsp");
		} else if (path.equals("enroll_city")) { // 도시 정보 등록
			EnrollCityService service = new EnrollCityService();
			service.execute(req, resp);
			resp.sendRedirect("/semiproject/admin/admin_page.jsp");
		} else if (path.equals("logout")) {// 관리자 로그 아웃
			AdminLogoutService service = new AdminLogoutService();
			service.execute(req, resp);
			resp.sendRedirect("/semiproject/semi");
		}

		if (next != "") {
			RequestDispatcher dis = req.getRequestDispatcher(next);
			dis.forward(req, resp);
		}
		out.print(object);
		out.flush();

	}
}