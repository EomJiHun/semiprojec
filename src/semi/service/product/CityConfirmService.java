package semi.service.product;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.model.dao.CountryDAO;
import semi.model.dto.CountryDTO;
import semi.service.Service;

public class CityConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CountryDAO dao = CountryDAO.getInstance();
		CountryDTO dto = new CountryDTO();
		String city = req.getParameter("city");
		System.out.println("city : " + city);
		String result="";
		
		try {
			dto = dao.listCity(city);
			System.out.println("dto city : " + dto.getCity());
		} catch (SQLException e) {
			System.out.println("CityConfirmService 에러 : " + e.getMessage());
		}
		if(dto.getCity().equals("null")) {
			result = "empty";
		}else {
			result = "exist";
		}
		System.out.println("result1 : " + result);
		req.setAttribute("result", result);
	}

}
