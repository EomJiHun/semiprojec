package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import semi.service.admin.ProductCountService;
import semi.service.product.BasketDeleteService;
import semi.service.product.BasketEnrollService;
import semi.service.product.BasketListService;
import semi.service.product.CityConfirmService;
import semi.service.product.CityInfoService;
import semi.service.product.DetailToReserveService;
import semi.service.product.EnrollDetailService;
import semi.service.product.ViewDetailService;
import semi.service.reserve.BasketReserveService;

// 상품 관련 페이지 컨트롤러
@WebServlet("/semi/product/*")
public class ProductController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}

	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getRequestURI();
		String next = "";
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		JSONObject object = new JSONObject();
		// 요청 URI
		path = path.substring(path.lastIndexOf("/") + 1);
		System.out.println("Product컨트롤러 : " + path);
		HttpSession session = req.getSession();

		if (path.equals("basket")) { // 장바구니 페이지 이동
			BasketListService service = new BasketListService();
			service.execute(req, resp);
			next = "/product/basket.jsp";
		} else if (path.equals("detail_enroll")) { // 상품상세 등록페이지로 이동
			session.setAttribute("pid", req.getParameter("pid"));
			session.setAttribute("title", req.getParameter("title"));
			object.put("url", "/semiproject/admin/enroll_detail.jsp");
		} else if (path.equals("enroll_detail")) { // 상품 상세 등록
			EnrollDetailService service = new EnrollDetailService();
			service.execute(req, resp);
			resp.sendRedirect("/semiproject/admin/admin_page.jsp");
		} else if (path.equals("city")) {  // 도시 정보 페이지로 이동
			CityInfoService service = new CityInfoService();
			service.execute(req, resp);
			next = "/product/product_list.jsp";
		} else if (path.equals("view_detail")) { // 상품 상세페이지로 이동
			ViewDetailService service = new ViewDetailService();
			service.execute(req, resp);
			next = "/product/product_detail.jsp";
		} else if(path.equals("city_confirm")){ // 메인에서 검색했을 시 도시가 존재하는지 확인
			CityConfirmService service = new CityConfirmService();
			service.execute(req, resp);
			System.out.println("result2 : " + req.getAttribute("result"));
			object.put("res", req.getAttribute("result"));
		} else if(path.equals("basket_price")) { // 장바구니에서 예약 페이지로 값이 넘어간다
			BasketReserveService service = new BasketReserveService();
			service.execute(req, resp);
			next = "/reserve/reserve.jsp";
		} else if(path.equals("basket_enroll")) { // 상세페이지에서 장바구니에 데이터를 넣어준다
			BasketEnrollService service = new BasketEnrollService();
			service.execute(req, resp);
			resp.sendRedirect("/semiproject/semi/product/basket");
		} else if(path.equals("reserve_enroll")) { // 상세에서 바로 결제로
			DetailToReserveService service = new DetailToReserveService();
			service.execute(req, resp);
			next = "/reserve/reserve.jsp";
		} else if(path.equals("delete_basket")) { // 장바구니테이블에서 삭제해준다.
			BasketDeleteService service = new BasketDeleteService();
			service.execute(req, resp);
			next = "/product/basket.jsp";
		}else if(path.equals("count_product")) { // 수량을 db에 저장하기
			ProductCountService service = new ProductCountService();
			service.execute(req, resp);
			next = "/product/basket.jsp";
		}
		if (next != "") {
			RequestDispatcher dis = req.getRequestDispatcher(next);
			dis.forward(req, resp);
		}
		out.print(object);
		out.flush();

	}
}
