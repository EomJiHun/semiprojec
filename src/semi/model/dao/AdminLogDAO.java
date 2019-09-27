package semi.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.model.dto.AdminLogDTO;
import semi.model.dto.PagingDTO;

public class AdminLogDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public AdminLogDAO() {

	}

	private static AdminLogDAO dao = new AdminLogDAO();

	public static AdminLogDAO getInstance() {
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

	// 애초에 session 에 관리자 저장시 이름이랑 아이디를 모두 저장시켜줘야겠다. 바로 뽑을 수 있도록
	// 생성된 로그를 저장해 준다.
	public void insertLog(AdminLogDTO dto) throws SQLException {
		conn = init();
		String sql = "insert into adminlog values(adminlog_seq.nextval,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);

		// 현재시간을 구해서 로그에 저장해 준다.
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		java.sql.Timestamp t = java.sql.Timestamp.valueOf(format_time1);

		pstmt.setTimestamp(1, t);
		pstmt.setString(2, dto.getId());
		pstmt.setString(3, dto.getContent());
		pstmt.setString(4, dto.getName());
		pstmt.setString(5, dto.getIp());

		int r = pstmt.executeUpdate();
		if (r > 0) {
			System.out.println("로그 삽입 성공");
		} else {
			System.out.println("로그 삽입 실패");
		}
		close();
	}

	// 전체 리스트의 갯수를 출력해준다.
	public int totalRow() throws SQLException {
		int total = 0;
		conn = init();
		String sql = "select count(*) from adminlog";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next())
			total = rs.getInt(1);

		close();
		return total;
	}

	// 로그 내역을 출력해준다.
	public List<AdminLogDTO> searchLog(PagingDTO pdto) throws SQLException {
		List<AdminLogDTO> aList = new ArrayList<AdminLogDTO>();
		conn = init();
		String sql = "select no, to_char(time, 'YYYY-MM-DD HH24:MI:SS') AS time, id, content, name, ip "
				+ "from (select rownum rm, tmp.* " + "from(select * from adminlog order by no desc)tmp) "
				+ "where rm between ? AND ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pdto.getStart());
		pstmt.setInt(2, pdto.getEnd());
		rs = pstmt.executeQuery();

		while (rs.next()) {
			AdminLogDTO dto = new AdminLogDTO();
			dto.setNo(rs.getInt("no"));
			dto.setTime(String.valueOf(rs.getString("time")));
			dto.setId(rs.getString("id"));
			dto.setContent(rs.getString("content"));
			dto.setName(rs.getString("name"));
			dto.setIp(rs.getString("ip"));

			aList.add(dto);
		}
		close();
		return aList;
	}

}
