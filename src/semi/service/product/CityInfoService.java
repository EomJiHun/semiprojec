package semi.service.product;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.model.dao.CountryDAO;
import semi.model.dao.ProductDAO;
import semi.model.dto.CountryDTO;
import semi.model.dto.ProductListDTO;
import semi.service.Service;

public class CityInfoService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CountryDAO dao = CountryDAO.getInstance();
		ProductDAO pdao = ProductDAO.getInstance();
		CountryDTO dto = new CountryDTO();
		List<ProductListDTO> pList = new ArrayList<ProductListDTO>();
		List<ProductListDTO> pList2 = new ArrayList<ProductListDTO>();
		List<ProductListDTO> pList3 = new ArrayList<ProductListDTO>();
		List<ProductListDTO> pList4 = new ArrayList<ProductListDTO>();
		List<ProductListDTO> pList5 = new ArrayList<ProductListDTO>();
		List<ProductListDTO> pList6 = new ArrayList<ProductListDTO>();
		List<ProductListDTO> pList7 = new ArrayList<ProductListDTO>();
		List<ProductListDTO> pList8 = new ArrayList<ProductListDTO>();

		String city = req.getParameter("city");
		boolean result = true; // 도시가 존재하는지 확인해주는 불린
		try {
			dto = dao.listCity(city);

			pList = pdao.cidList(1, city);
			pList2 = pdao.cidList(2, city);
			pList3 = pdao.cidList(3, city);
			pList4 = pdao.cidList(4, city);
			pList5 = pdao.favoriteList(city);

		} catch (SQLException e) {
			System.out.println("CityInfoService 에러 : " + e.getMessage());
		}

		pList6 = splitList(pList5);
		pList7 = splitList(pList);
		pList8 = splitList(pList2);
		String[] weather = dto.getWeather().split(",");
		req.setAttribute("dto", dto);
		req.setAttribute("weather", weather);
		req.setAttribute("pList", pList);
		req.setAttribute("pList2", pList2);
		req.setAttribute("pList3", pList3);
		req.setAttribute("pList4", pList4);
		req.setAttribute("pList5", pList5);
		req.setAttribute("pList6", pList6);
		req.setAttribute("pList7", pList7);
		req.setAttribute("pList8", pList8);

	}

	public List<ProductListDTO> splitList(List<ProductListDTO> aList) {
		List<ProductListDTO> pList = new ArrayList<ProductListDTO>();
		for (int i = 4; i < aList.size(); i++) {
			pList.add(aList.get(i));
		}
		return pList;
	}

}
