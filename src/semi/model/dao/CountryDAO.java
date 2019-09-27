package semi.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.model.dto.AdminLogDTO;
import semi.model.dto.CountryDTO;

public class CountryDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public CountryDAO() {

	}

	private static CountryDAO dao = new CountryDAO();

	public static CountryDAO getInstance() {
		return dao;
	}

	public Connection init() throws SQLException {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/xe");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ds.getConnection();
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 도시 정보 등록
	public void insertCity(CountryDTO dto, AdminLogDTO logDTO) throws SQLException {
		conn = init();
		String sql = "Insert into country values(?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getContinent());
		pstmt.setString(2, dto.getCountry());
		pstmt.setString(3, dto.getCity());
		pstmt.setString(4, dto.getContent());
		pstmt.setDouble(5, dto.getLat());
		pstmt.setDouble(6, dto.getLon());
		pstmt.setString(7, dto.getTime());
		pstmt.setString(8, dto.getMoney());
		pstmt.setString(9, dto.getImagepath());
		pstmt.setString(10, dto.getMonth());
		pstmt.setString(11, dto.getWeather());

		int r = pstmt.executeUpdate();
		if (r > 0) {
			System.out.println("도시정보 입력 성공");
		} else {
			System.out.println("도시정보 입력 실패ㅠㅠ");
		}
		close();
	}

	public CountryDTO listCity(String city) throws SQLException {
		CountryDTO dto = new CountryDTO();
		conn = init();
		String sql = "select * from country where city= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, city);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			// content, time , money, month
			String rcontent = (rs.getString("content")).replaceAll("(<br>|<br\\/>|<br \\/>)/g", "\r\n");
			String rtime = (rs.getString("time")).replaceAll("(<br>|<br\\/>|<br \\/>)/g", "\r\n");
			String rmoney = (rs.getString("money")).replaceAll("(<br>|<br\\/>|<br \\/>)/g", "\r\n");
			String rmonth = (rs.getString("month")).replaceAll("(<br>|<br\\/>|<br \\/>)/g", "\r\n");

			dto.setContinent(rs.getString("continent"));
			dto.setCountry(rs.getString("country"));
			dto.setCity(rs.getString("city"));
			dto.setContent(rcontent);
			dto.setLat(rs.getDouble("lat"));
			dto.setLon(rs.getDouble("lon"));
			dto.setTime(rtime);
			dto.setMoney(rmoney);
			dto.setImagepath(rs.getString("imagepath"));
			dto.setMonth(rmonth);
			dto.setWeather(rs.getString("weather"));
		}else {
			dto.setCity("null");
		}
		close();
		return dto;
	}

}
