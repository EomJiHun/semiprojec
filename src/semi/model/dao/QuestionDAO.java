package semi.model.dao;

import java.sql.Connection;
import java.sql.Date;
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

import semi.model.dto.PagingDTO;
import semi.model.dto.QuestionDTO;

public class QuestionDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public QuestionDAO() {
	}

	private static QuestionDAO dao = new QuestionDAO();

	public static QuestionDAO getInstance() {
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
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
	}// end exit(////////////////

	public List<QuestionDTO> quesList(PagingDTO pdto) throws SQLException {// 질문리스트 출력
		List<QuestionDTO> aList = new ArrayList<QuestionDTO>();

		conn = init();
		String sql = "select no, title, content, email, day, vnum " + "from (select rownum rm, tmp.* "
				+ "from (select no, title, content, email, day, vnum from question where qid=1 order by no desc)tmp) "
				+ "where rm between ? and ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pdto.getStart());
		pstmt.setInt(2, pdto.getEnd());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			QuestionDTO dto = new QuestionDTO();
			dto.setNo(rs.getInt("no"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setEmail(rs.getString("email"));
			dto.setDay(rs.getString("day"));
			dto.setVnum(rs.getInt("vnum"));
			aList.add(dto);
		}
		exit();

		return aList;
	}// end List

	public void quesInset(String email, String title, String content) {// 가져온 데이터를 입력하여 디비에 저장

		try {
			conn = init();
			String sql = "insert into question values(question_seq.nextval,?,0,sysdate,?,null,?,1,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, email);
			pstmt.setString(4, email);
			int num = pstmt.executeUpdate();
			if (num == 1) {
				System.out.println("insert 성공");
			} else {
				System.out.println("insert 실패");
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

	}// end questInsert class

	public List<QuestionDTO> comentsList(int no) {// 글의 내용을 리스트
		List<QuestionDTO> aList = new ArrayList<QuestionDTO>();
		try {
			conn = init();
			String sql = "select distinct * from question where no=? and qid=1 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setDay(rs.getString("day"));
				aList.add(dto);
				break;
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
	}

	public void vumupda(int no) {// 조회수 올리기

		try {
			conn = init();
			String up = "UPDATE question SET vnum=vnum+1 WHERE no=?";
			pstmt = conn.prepareStatement(up);
			pstmt.setInt(1, no);
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

	public void repleUpdate(List<QuestionDTO> aList) {// 댓글 디비에 저장

		try {
			conn = init();
			String sql = "insert into question values(?,?,?,sysdate,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			for (QuestionDTO a : aList) {
				pstmt.setInt(1, a.getNo());
				pstmt.setString(2, a.getTitle());
				pstmt.setInt(3, a.getVnum());
				pstmt.setString(4, a.getContent());
				pstmt.setString(5, a.getComments());
				pstmt.setString(6, a.getEmail());
				pstmt.setInt(7, a.getQid());
				pstmt.setString(8, a.getEmail());
				pstmt.executeUpdate();
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
	}

	public List<QuestionDTO> rePleList(int no) {// 댓글리스트 출력 메소드
		List<QuestionDTO> aList = new ArrayList<>();

		try {
			conn = init();
			String sql = "select comments, email from question where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setComments(rs.getString("comments"));
				dto.setEmail(rs.getString("email"));
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
	}// end rePleLit////////////////

	// 삭제 메소드
	public void delet(int no) {

		try {
			conn = init();
			String sql = "delete from question where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
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

	// 전체 리스트의 갯수를 출력해준다.
	public int totalRow() throws SQLException, ClassNotFoundException {
		int total = 0;
		conn = init();
		String sql = "select count(*) from question where qid=1";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next())
			total = rs.getInt(1);

		exit();
		return total;
	}

}// end calss
