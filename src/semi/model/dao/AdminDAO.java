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

import semi.model.dto.AdminDTO;
import semi.model.dto.PagingDTO;

public class AdminDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public AdminDAO() {

	}

	private static AdminDAO dao = new AdminDAO();

	public static AdminDAO getInstance() {
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

	// 관리자를 저장 시켜준다.
	public void insertAdmin(AdminDTO dto) throws SQLException {
		conn = init();
		String sql = "insert into admin values(?,?,sysdate,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPwd());
		pstmt.setString(3, dto.getName());
		pstmt.setString(4, dto.getIp());

		int r = pstmt.executeUpdate();
		if (r > 0) {
			System.out.println("관리자 저장DB 성공");
		} else {
			System.out.println("관리자 저장DB 실패");
		}
		close();
	}

	// 관리자의 정보를 가지고 온다.
	public List<AdminDTO> getAdmin(PagingDTO pdto) throws SQLException {
		List<AdminDTO> aList = new ArrayList<AdminDTO>();

		conn = init();
		String sql = "select * from (select rownum rm, tmp.* from(select * from admin)tmp) "
				+ "where rm between ? and ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pdto.getStart());
		pstmt.setInt(2, pdto.getEnd());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			AdminDTO dto = new AdminDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setDate(String.valueOf(rs.getDate("day")));
			dto.setIp(rs.getString("ip"));

			aList.add(dto);
		}
		close();
		return aList;
	}

	// 이메일과 비밀번호가 같은 관리자가 있는지 확인한다.
	public AdminDTO searchAdmin(AdminDTO dto) throws SQLException {
		String name = "";

		conn = init();
		String sql = "select * from admin where id=? and pwd=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPwd());
		rs = pstmt.executeQuery();
		AdminDTO adto = new AdminDTO();
		if (rs.next()) {
			adto.setName(rs.getString("name"));
			adto.setId(rs.getString("id"));
		} else {
			adto.setName("");
		}
		close();
		return adto;
	}

	// 전체 리스트의 갯수를 출력해준다.
	public int totalRow() throws SQLException {
		int total = 0;
		conn = init();
		String sql = "select count(*) from admin";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next())
			total = rs.getInt(1);

		close();
		return total;
	}

}
