package semi.model.dto;

// 상품 DTO
public class ProductDTO {

	private int pid; // 시퀀스
	private int cid; // 상품 분류
	// 1. 액티비티
	// 2. 공연
	// 3. 대중교통
	// 4. 맛집
	private int price; // 출시가격
	private String id; // 관리자 id
	private int count; // 수량
	private String title;// 제목
	private String options;// 수량
	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

}
