package semi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.service.index.IndexMenuService;

// 메인 페이지 로드
@WebServlet("/semi")
public class FrontController extends HttpServlet {
	@Override
	protected void doGet
	(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		execute(req, resp);
	}
	
	protected void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		IndexMenuService service = new IndexMenuService();
		service.execute(req, resp);
		RequestDispatcher dis = req.getRequestDispatcher("index.jsp");
		dis.forward(req, resp);
	}
}