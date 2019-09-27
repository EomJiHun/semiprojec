package semi.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import semi.model.dto.UserDTO;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	private UserDAO() {

	}

	private static UserDAO dao = new UserDAO();

	public static UserDAO getInstance() {
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

	public int registerMethod(UserDTO dto) throws SQLException {
		int cnt = 0;

		conn = init();
		String sql = "insert into member(email,pwd,ip) values (?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getEmail());
		pstmt.setString(2, dto.getPwd());
		pstmt.setString(3, dto.getIp());
		cnt = pstmt.executeUpdate();

		if (cnt > 0) {
			System.out.println("회원가입 DB 성공");
		} else {
			System.out.println("회원가입 DB 실패");
		}

		close();
		return cnt;
	}

	public String ip(String email) throws SQLException {
		String result = "";

		conn = init();
		String sql = "select ip from member where email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			result = rs.getString(1);
		}
		close();
		System.out.println("UserDAO ip method result : " + result);
		return result;
	}

	public boolean login(UserDTO dto) throws SQLException {
		boolean result = false;
		conn = init();
		String sql = "select * from member where email=? and pwd=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getEmail());
		pstmt.setString(2, dto.getPwd());
		rs = pstmt.executeQuery();
		if (rs.next()) {
			result = true;
		}
		close();
		return result;
	}

	public int ipUpdate(UserDTO dto) throws SQLException {
		int cnt = -1;

		conn = init();
		String sql = "update member set ip=concat(ip,?) where email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "," + dto.getIp());
		pstmt.setString(2, dto.getEmail());
		cnt = pstmt.executeUpdate();
		if (cnt > 0) {
			System.out.println("ip업데이트 성공");
		} else {
			System.out.println("ip업데이트 실패");
		}
		close();

		return cnt;
	}

	public void updateMethod(UserDTO dto) // 마이페이지 내용 update
	{

		try {
			conn = init();
			String sql = "update member set phone=?,fname=?,lname=?,country=?,p_country=?,myemail=?  where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getFname());
			pstmt.setString(3, dto.getLname());
			pstmt.setString(4, dto.getCountry());
			pstmt.setString(5, dto.getP_country());
			pstmt.setString(6, dto.getMyemail());
			pstmt.setString(7, dto.getEmail()); // 흠
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
	}

	public String findIdMethod(String phone) {
		String result = "";
		try {
			conn = init();
			String sql = "select email from member where phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return result;
	}

	public boolean findPwd(String email) {
		try {
			conn = init();
			String sql = "select * from member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();

		return false;

	}

	public void updatePwd(String email, String pwd) {
		try {
			conn = init();
			String sql = "update member set pwd=? where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
	}

	public List<UserDTO> selectMethod(String email) {// 마이페이지 계정설정 내정보 불러오기위해
		List<UserDTO> aList = new ArrayList<UserDTO>();

		try {
			conn = init();
			String sql = "select * from member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setMyemail(rs.getString("myemail"));
				dto.setFname(rs.getString("fname"));
				dto.setLname(rs.getString("lname"));
				dto.setPhone(rs.getString("phone"));
				dto.setCountry(rs.getString("country"));
				dto.setP_country(rs.getString("p_country"));

				aList.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return aList;

	}

	public boolean pwdConfirm(String now_pwd, String email) {
		try {
			conn = init();
			String sql = "select * from where email=?";
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			{
				if (rs.next()) {
					if (now_pwd.equals(rs.getString("pwd"))) {
						return true;
					} else {
						return false;
					}
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return false;

	}

}
