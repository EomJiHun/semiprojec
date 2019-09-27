package semi.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.service.user.InsertAction;
import semi.model.dao.ReserveDAO;
import semi.model.dao.ReviewDAO;
import semi.model.dto.ReserveDTO;
import semi.model.dto.ReviewDTO;

import java.io.IOException;

/**
 * Servlet implementation class ReviewController
 */
@WebServlet("/reviews/*")
public class ReviewController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	//////////////////////// 이미지 경로 ////////////////
	// 이미지 경로를 배열로 받음
	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getRequestURI();
		System.out.println(path + " path"); // 이미지 path
		
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("name");

		String action = path.substring(path.lastIndexOf("/"));
		String next = "";
		System.out.println("action = " + action);
		if (action.equals("/*") || action.equals("/reviewList.do")) {
			ReviewDAO dao = ReviewDAO.getInstance();
			List<ReviewDTO> aList = new ArrayList<ReviewDTO>();
			aList = dao.reviewList(name);
			
			String email = (String)session.getAttribute("email");
			ReserveDAO rdao=ReserveDAO.getInstance();
			List<ReserveDTO> rList= rdao.selectMethod(email);
			
			request.setAttribute("aList", aList); // 후기 리스트
			request.setAttribute("rList", rList); // 예약 리스트
			
			
			next = "/users/my_review.jsp";
		}

		else if (action.equals("/insert.do")) { //
			InsertAction insertac = new InsertAction();
			MultipartRequest multi = insertac.executeMulti(request, response);
			response.sendRedirect("/semiproject/reviews/reviewList.do");
		}

		if (next != "") { // 이동시켜주는 것
			System.out.println("next : " + next);
			RequestDispatcher dis = request.getRequestDispatcher(next);
			dis.forward(request, response);

		} // if end

	}

}
