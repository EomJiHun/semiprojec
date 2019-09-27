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
import semi.model.dto.NoticeDTO;

public class NoticeDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public NoticeDAO() {

	}

	private static NoticeDAO dao = new NoticeDAO();

	public static NoticeDAO getInstance() {

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

	// 공지사항을 저장해 준다.
	public void insertNotice(NoticeDTO dto) throws SQLException {
		conn = init();
		String sql = "insert into notice values(notice_seq.nextval, ?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getBid());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.setString(4, dto.getId());

		int r = pstmt.executeUpdate();
		if (r > 0) {
			System.out.println("공지사항 작성DB 성공");
		} else {
			System.out.println("공지사항 작성DB 실패");
		}
		close();
	}

	public List<NoticeDTO> searchNotice(int num) throws SQLException {
		List<NoticeDTO> aList = new ArrayList<NoticeDTO>();

		conn = init();
		String sql = "select * from notice where bid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			NoticeDTO dto = new NoticeDTO();
			dto.setNo(rs.getInt("no"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setId(rs.getString("id"));
			dto.setBid(rs.getInt("bid"));
			aList.add(dto);
		}
		close();
		return aList;
	}
}
