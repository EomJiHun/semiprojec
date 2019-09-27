package semi.service.product;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.model.dao.ProductDAO;
import semi.model.dao.ReserveDAO;
import semi.model.dao.ReviewDAO;
import semi.model.dto.ContentDTO;
import semi.model.dto.ProductDTO;
import semi.model.dto.ProductListDTO;
import semi.model.dto.ReviewDTO;
import semi.service.Service;

// 상품 상세정보 페이지 서비스
public class ViewDetailService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> optionList = new ArrayList<ProductDTO>();
		ContentDTO dto = new ContentDTO();
		ReviewDAO rdao = ReviewDAO.getInstance();
		List<ReviewDTO> rList = new ArrayList<ReviewDTO>();
		
		try {
			dto = dao.searchDetail(title); //상품 상세 정보를 가지고 온다
			optionList = dao.optionList(title); // 상품에 대한 옵션들을 가지고 온다
			dao.plusRead(dto.getReadcount(), title);
			rList = rdao.detailReviewList(title);
		} catch (SQLException e) {
			System.out.println("ViewDetailService 에러 : " + e.getMessage());
		}
		String[] image = dto.getImagePath().split(",");

		req.setAttribute("dto", dto);
		req.setAttribute("optionList", optionList);
		req.setAttribute("image", image);
		req.setAttribute("rList", rList);
	}

}
