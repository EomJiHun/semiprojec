package semi.service.index;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import semi.model.dao.ProductDAO;
import semi.model.dto.PagingDTO;
import semi.model.dto.ProductDTO;
import semi.model.dto.ProductListDTO;
import semi.service.Service;

public class IndexMenuService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductListDTO> aList = new ArrayList<ProductListDTO>();
		List<ProductListDTO> aList2 = new ArrayList<ProductListDTO>();
		String city = "";
		try {
			aList = dao.favoriteList(city);
		} catch (SQLException e) {
			System.out.println("IndexMenuService 에러 : " + e.getMessage());
		}
		
		aList2 = splitList(aList);
		req.setAttribute("aList", aList);
		req.setAttribute("aList2", aList2);
	}
	public List<ProductListDTO> splitList(List<ProductListDTO> aList){
		List<ProductListDTO> pList = new ArrayList<ProductListDTO>();
		for(int i=4; i < aList.size(); i++) {
			pList.add(aList.get(i));
		}
		return pList;
	}
}
