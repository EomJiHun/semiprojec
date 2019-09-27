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

import semi.model.dto.ReviewDTO;



public class ReviewDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;

	public ReviewDAO() {
		
	}

	private static ReviewDAO dao = new ReviewDAO();
	
	public static ReviewDAO getInstance() {
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
	}
	
	

	public List<ReviewDTO> listMethod() {	//리스트 메소드
		List<ReviewDTO> aList = new ArrayList<ReviewDTO>();
		try {
			conn = init();
			stmt = conn.createStatement();
			/* String sql = "select*from review order by num"; */
			String sql="select rw.no no, rw.options opt,rw.content con, rw.days dd, rw.email mail,\r\n" + 
					"rw.imagepath img, rw.imagepath2 img2, rw.imagepath3 img3, rw.imagepath4 img4,\r\n" + 
					"rw.star star\r\n" + 
					"from member mb,\r\n" + 
					"review rw where mb.email = rw.email";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setNumber(rs.getInt("no"));
				dto.setOptions(rs.getString("opt"));
				dto.setContent(rs.getString("con"));
				dto.setEmail(rs.getString("mail"));
				dto.setDate(rs.getDate("dd"));
				dto.setImagePath(rs.getString("img"));
				dto.setStar(rs.getInt("star"));
				/* dto.setIcon(rs.getString("icon")); */
				/* dto.setStar(rs.getInt("star")); */
				
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

	}//end listMethod--------------------------------------------------

	public void insertMethod(ReviewDTO dto) {  //삽입 메소드 / 글쓰기 insert

		try {
			conn=init();
			
			/*
			 * String
			 * sql="insert into review values(review_num_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
			 * pstmt= conn.prepareStatement(sql);
			 * 
			 * pstmt.setInt(1, dto.getNumber()); pstmt.setString(2, dto.getEmail());
			 * pstmt.setInt(3, dto.getStar()); pstmt.setString(4, dto.getOptions());
			 * pstmt.setDate(5, dto.getDate()); pstmt.setString(6, dto.getContent());
			 * pstmt.setString(7, dto.getImagePath()); pstmt.setString(8,
			 * dto.getImagePath2()); pstmt.setString(9, dto.getImagePath3());
			 * pstmt.setString(10, dto.getImagePath4());
			 */
			
			String sql="insert into review values(review_seq.nextval,sysdate,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getImagePath());
			pstmt.setInt(3, dto.getStar()); 
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getTitle());
			pstmt.setString(6, dto.getOptions());
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
	}//end insertMethod----------------------------------------------------
	
	
	// deleteMethod---------------------------------------------------

	public void deleteMethod(int chk) {	//삭제 메소드
			
			try {
				conn = init();
				String sql = "delete from review where no=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, chk);
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
	
	//updateMethod
	
	public void updateMethod(String ccc, int kkk) {  //수정 메소드
		try {
			conn=init();
			String sql="update review set content=? where no= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ccc);
			pstmt.setInt(2, kkk);
			pstmt.executeUpdate();
		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public List<ReviewDTO> reviewList(String email){
		List<ReviewDTO> aList = new ArrayList<ReviewDTO>();
		try {
			conn = init();
			String sql = "select * from review where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("days"));
				dto.setEmail(rs.getString("email"));
				dto.setStar(rs.getInt("star"));
				dto.setNumber(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setOptions(rs.getString("options"));
				
				String[] temp = rs.getString("imagepath").split(",");
				dto.setPath(temp);
				
				aList.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return aList;
	}
	
	public List<ReviewDTO> detailReviewList(String title){
		List<ReviewDTO> aList = new ArrayList<ReviewDTO>();
		try {
			conn = init();
			String sql = "select re.* from review re, product pro where pro.title=? and pro.title=re.title";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("days"));
				dto.setEmail(rs.getString("email"));
				dto.setStar(rs.getInt("star"));
				dto.setNumber(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setOptions(rs.getString("options"));
				
				String[] temp = rs.getString("imagepath").split(",");
				dto.setPath(temp);
				
				aList.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return aList;
	}
	
	
	
}
