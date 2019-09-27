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

import semi.model.dto.ContentDTO;
import semi.model.dto.PagingDTO;
import semi.model.dto.ProductDTO;
import semi.model.dto.ProductListDTO;

public class ProductDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ProductDAO() {

	}

	private static ProductDAO dao = new ProductDAO();

	public static ProductDAO getInstance() {
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

	// 상품등록하기
	public void insertMethod(ProductDTO dto) throws SQLException {
		conn = init();
		String sql = "insert into product(pid, cid, price, id, title, options) "
				+ "values(product_seq.nextval,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getCid());
		pstmt.setInt(2, dto.getPrice());
		pstmt.setString(3, dto.getId());
		pstmt.setString(4, dto.getTitle());
		pstmt.setString(5, dto.getOptions());
		pstmt.executeUpdate();

		close();
	}

	// 관리자가 올린 상품 정보 저장 가져오기
	public List<ProductDTO> listMethod(PagingDTO pdto) throws SQLException {
		List<ProductDTO> aList = new ArrayList<ProductDTO>();

		conn = init();
		String sql = "select * from (select rownum rm, tmp.* from(select * from product order by title desc)tmp)"
				+ "where rm between ? and ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pdto.getStart());
		pstmt.setInt(2, pdto.getEnd());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setPid(rs.getInt("pid"));
			dto.setPrice(rs.getInt("price"));
			dto.setCid(rs.getInt("cid"));
			dto.setId(rs.getString("id"));
			dto.setTitle(rs.getString("title"));
			dto.setOptions(rs.getString("options"));
			dto.setCount(rs.getInt("count"));
			aList.add(dto);
		}
		close();

		return aList;
	}

	// 상품 상세정보 등록
	public void insertDetail(ContentDTO dto) throws SQLException {
		conn = init();
		String sql = "insert into content values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getCity());
		pstmt.setString(3, dto.getContent());
		pstmt.setString(4, dto.getImagePath());
		pstmt.setInt(5, dto.getReadcount());
		pstmt.setString(6, dto.getTitle());

		int r = pstmt.executeUpdate();
		if (r > 0) {
			System.out.println("Detail insert 성공");
		} else {
			System.out.println("Detail insert 실패");
		}
		close();
	}

	// 상품 상세정보를 가지고 온다
	public ContentDTO searchDetail(String title) throws SQLException {
		ContentDTO dto = new ContentDTO();
		conn = init();
		String sql = "select * from content where title=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);

		rs = pstmt.executeQuery();
		if (rs.next()) {
			dto.setCity(rs.getString("city"));
			dto.setContent(rs.getString("content"));
			dto.setId(rs.getString("id"));
			dto.setImagePath(rs.getString("imagepath"));
			dto.setTitle(rs.getString("title"));
			dto.setReadcount(Integer.parseInt(rs.getString("readcount")));
		}
		close();
		return dto;
	}

	public void plusRead(int readcount, String title) throws SQLException {
		conn = init();
		readcount += 1;
		String sql = "update content set readcount=? where title=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, readcount);
		pstmt.setString(2, title);
		int r = pstmt.executeUpdate();
		if (r > 0) {
			System.out.println("조회수 증가DB 성공");
		} else {
			System.out.println("조회수 증가DB 실패");
		}
		close();
	}

	// 상품 정보를 가져온다
	public List<ProductListDTO> cidList(int cid, String city) throws SQLException {
		List<ProductListDTO> aList = new ArrayList<ProductListDTO>();
		conn = init();
		String sql = "select b.title AS title, b.imagepath AS imagepath, avg(b.price) AS price"
				+ " from (select con.title, con.imagepath, pro.price" + " from content con, product pro"
				+ " where con.title LIKE '%'||pro.title||'%' AND pro.cid=? AND con.city=?)b "
				+ "group by b.title, b.imagepath";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cid);
		pstmt.setString(2, city);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			ProductListDTO dto = new ProductListDTO();
			dto.setTitle(rs.getString("title"));
			dto.setImagepath(rs.getString("imagepath"));
			dto.setPrice(rs.getInt("price"));
			aList.add(dto);
			if (aList.size() == 8)
				break;
		}

		close();
		return aList;
	}

	// 해당하는 도시의 인기 있는 상품을 가져온다.
	public List<ProductListDTO> favoriteList(String city) throws SQLException {
		List<ProductListDTO> aList = new ArrayList<ProductListDTO>();
		conn = init();
		String sql = "select b.title AS title, b.imagepath AS imagepath, avg(b.price) AS price"
				+ " from(select con.title, con.imagepath, pro.price, con.readcount" + " from content con, product pro "
				+ "where con.title=pro.title AND con.city LIKE '%" + city + "%' order by readcount desc)b "
				+ " group by b.title, b.imagepath, b.readcount" + " order by b.readcount desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			ProductListDTO dto = new ProductListDTO();
			dto.setTitle(rs.getString("title"));
			dto.setImagepath(rs.getString("imagepath"));
			dto.setPrice(rs.getInt("price"));
			aList.add(dto);
			if (aList.size() == 8)
				break;
		}

		close();
		return aList;
	}

	// 해당하는 상품의 옵션들을 가지고 온다.
	public List<ProductDTO> optionList(String title) throws SQLException {
		List<ProductDTO> aList = new ArrayList<ProductDTO>();
		conn = init();
		String sql = "select options, price, count from product where title=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setOptions(rs.getString("options"));
			dto.setPrice(rs.getInt("price"));
			dto.setCount(rs.getInt("count"));
			aList.add(dto);
		}
		close();
		return aList;
	}

	// 전체 리스트의 갯수를 출력해준다.
	public int totalRow() throws SQLException {
		int total = 0;
		conn = init();
		String sql = "select count(*) from product";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next())
			total = rs.getInt(1);

		close();
		return total;
	}

	// 해당하는 pid를 가지고 온다.
	public int getPid(String title, String options) throws SQLException {
		int pid = 0;
		conn = init();
		System.out.println("title : " + title);
		System.out.println("options : " + options);
		String sql = "select pid from product where title=? AND options=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, options);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			pid = rs.getInt("pid");
		}
		close();
		return pid;
	}

	// 상품 수량 등록
	public void plusCount(int count, String options) throws SQLException {
		conn = init();

		String sql = "update product set count=? where options=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, count);
		pstmt.setString(2, options);
		int r = pstmt.executeUpdate();
		if (r > 0) {
			System.out.println("상품수량 증가 DB 성공");
		} else {
			System.out.println("상품수량 증가 DB 실패");
		}
		close();
	}

	// 상품 수량 감소 // 예약성공시
	public void minusCount(int pid) throws SQLException {
		conn = init();
		String sql = "update product set count=count-1 where options=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pid);
		pstmt.executeUpdate();
		close();

	}

}
