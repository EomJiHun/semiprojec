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

import semi.model.dto.PagingDTO;
import semi.model.dto.ReserveDTO;
import semi.model.dto.UserDTO;

public class ReserveDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private ReserveDAO() {

	}

	private static ReserveDAO dao = new ReserveDAO();

	public static ReserveDAO getInstance() {
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

	// reserve 예약 insert
	public int[] insertMethod(List<ReserveDTO> aList, String imp_uid, String merchant_uid, String email) {
		int[] cnt = null;
		try {
			conn = init();
			String sql = "insert into reserve values (reserve_seq.nextval,?,?,?,?,0,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < aList.size(); i++) {
				ReserveDTO dto = aList.get(i);
				pstmt.setInt(1, dto.getPrice());
				pstmt.setInt(2, dto.getPnum());
				pstmt.setString(3, dto.getDay());
				pstmt.setString(4, email);
				pstmt.setString(5, imp_uid);
				pstmt.setString(6, merchant_uid);
				pstmt.setInt(7, dto.getPid());
				pstmt.addBatch();
			}
			cnt = pstmt.executeBatch();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 예약취소 된것들 삭제
	public void deleteReserve(String imp_uid) {
		try {
			conn = init();
			String sql = "delete from reserve where imp_uid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, imp_uid);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
	}

	// 예약 리스트를 가지고 온다.
	public List<ReserveDTO> reserveList(PagingDTO pdto) throws SQLException {
		List<ReserveDTO> aList = new ArrayList<ReserveDTO>();
		conn = init();
		String sql = "select * from (select rownum rm, tmp.* "
				+ "from(select re.no, re.pnum, re.day, me.fname, me.lname, me.email, re.rpid , pro.title, pro.options, re.imp_uid "
				+ "from reserve re, member me, product pro where me.email=re.email and pro.pid = re.pid order by no desc)tmp) "
				+ "where rm between ? and ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pdto.getStart());
		pstmt.setInt(2, pdto.getEnd());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			ReserveDTO dto = new ReserveDTO();
			dto.setNo(rs.getInt("no")); // 예약번호
			dto.setTitle(rs.getString("title")); // 예약 제목
			dto.setOptions(rs.getString("options")); // 예약 옵션
			dto.setDay(rs.getString("day")); // 예약일
			dto.setPnum(rs.getInt("pnum")); // 수량
			if (rs.getInt("rpid") == 0) {
				dto.setRpId("예약완료");
			} else if (rs.getInt("rpid") == 1) {
				dto.setRpId("취소신청");
			} else {
				dto.setRpId("취소완료");
			}
			dto.setImp_uid(rs.getString("imp_uid"));
			dto.setName(rs.getString("fname") + rs.getString("lname"));
			aList.add(dto);
		}
		close();
		return aList;
	}

	// 전체 리스트의 갯수를 출력해준다.
	public int totalRow() throws SQLException {
		int total = 0;
		conn = init();
		String sql = "select count(*) from reserve";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next())
			total = rs.getInt(1);

		close();
		return total;
	}

	// list출력
	public List<ReserveDTO> selectMethod(String email) {
		List<ReserveDTO> aList = new ArrayList<ReserveDTO>();

		try {
			conn = init();
			String sql = "select r.*,c.imagepath,p.title,p.options from reserve r,content c,product p where email=? and r.pid=p.pid and p.title=c.title";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReserveDTO dto = new ReserveDTO();
				dto.setImp_uid(rs.getString("imp_uid"));
				dto.setDay(rs.getString("day"));
				dto.setPnum(rs.getInt("pnum"));
				dto.setPrice(rs.getInt("price"));
				dto.setMerchant_uid(rs.getString("merchant_uid"));
				dto.setPid(rs.getInt("pid"));
				String[] temp = rs.getString("imagepath").split(",");
				dto.setImagePath(temp[0]);
				dto.setTitle(rs.getString("title"));
				dto.setOptions(rs.getString("options"));
				dto.setRpId(rs.getString("rpid"));
				aList.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return aList;

	}

	// rpid 0> 1로변경 +하는거임
	public int rpidUpdate(String code) {
		int cnt = -1;
		try {
			conn = init();
			String sql = "update reserve set rpid=1 where merchant_uid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return cnt;
	}

}
