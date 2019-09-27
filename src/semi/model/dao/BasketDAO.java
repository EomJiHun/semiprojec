package semi.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.model.dto.BasketDTO;
import semi.model.dto.ReserveDTO;

public class BasketDAO {

	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	private BasketDAO() {

	}

	private static BasketDAO dao = new BasketDAO();

	public static BasketDAO getInstance() {
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

	private void exit() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}// end exit(////////////////

	// 장바구니 리스트를 추가한다
	public void insertBasket(BasketDTO dto) throws SQLException {
		conn = init();
		String sql = "insert into basket values(basket_seq.nextval,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getDay());
		pstmt.setInt(2, dto.getPrice());
		pstmt.setString(3, dto.getEmail());
		pstmt.setInt(4, dto.getPid());
		pstmt.setInt(5, dto.getPnum());
		// 수량 People 가격 Price 이메일 session.getAttribute("email"); pid getPid() prodao
		int r = pstmt.executeUpdate();
		if (r > 0) {
			System.out.println("장바구니 DB 추가 성공");
		} else {
			System.out.println("장바구니 DB 추가 실패");
		}
		exit();
	}

	// 장바구니의 리스트를 받아온다
	public List<BasketDTO> basList(String email) {
		List<BasketDTO> aList = new ArrayList<BasketDTO>();
		try {
			conn = init();
			String sql = "select p.title, p.options, b.price, b.pid, no, day, pnum,email, c.imagepath from product p, basket b,content c where p.pid=b.pid and b.email=? and c.title=p.title order by no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BasketDTO dto = new BasketDTO();
				dto.setNo(rs.getInt("no"));
				dto.setEmail(rs.getString("email"));
				dto.setTitle(rs.getString("title"));
				dto.setOptions(rs.getString("options"));
				dto.setPid(rs.getInt("pid"));
				dto.setDay(rs.getString("day"));
				dto.setPnum(rs.getInt("pnum"));
				dto.setPrice(rs.getInt("price"));
				String image = rs.getString("imagepath");
				String[] imageArray = image.split(",");
				dto.setImagepath(imageArray[0]);
				aList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return aList;
	}// end class

	// 장바구니 내역을 삭제한다
	public void basketDelte(int num) {

		try {
			conn = init();
			String sql = "delete from basket where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 장바구니의 수량을 변경한다
	public void update(String email, int num) {
		try {
			conn = init();
			String sql = "UPDATE basket SET pnum=? WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 장바구니에서 예약으로 값을 넘겨준다
	// chk 도 예약으로 session 으로 넘겨준다
	public List<ReserveDTO> transReserve(String chk[], String email) throws SQLException {
		List<ReserveDTO> aList = new ArrayList<ReserveDTO>();
		String num = "";
		for (int i = 0; i < chk.length; i++) {
			if (i == chk.length - 1) {
				num += "'" + chk[i] + "'";
			} else {
				num += "'" + chk[i] + "'" + ',';
			}
		}
		String sql = "select a.* from (select rownum as rw,b.*,p.title,p.options from basket b,product p where email=? and b.pid=p.pid) a where rw in ("
				+ num + ") order by no";
		conn = init();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			ReserveDTO dto = new ReserveDTO();
			dto.setPrice(rs.getInt("price"));
			dto.setPnum(rs.getInt("pnum"));
			dto.setDay(rs.getString("day"));
			dto.setTitle(rs.getString("title"));
			dto.setOptions(rs.getString("options"));
			dto.setPid(rs.getInt("pId"));
			aList.add(dto);
		}
		exit();
		return aList;
	}

	// 장바구니에서 선택한것들 결제성공하면 삭제
	public void deleteMethod(String[] chk, String email) {
		String num = "";

		for (int i = 0; i < chk.length; i++) {
			if (i == chk.length - 1) {
				num += chk[i];
			} else {
				num += chk[i] + ",";
			}
		}

		try {
			conn = init();
			String sql = "DELETE basket WHERE no IN ( SELECT no FROM (SELECT rownum as rw,no  FROM basket  WHERE email=? ORDER BY no ) WHERE rw in("
					+ num + "))";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}// end class
