package semi.model.dto;

public class ContentDTO {
	private String content; // 상세내용
	private String imagePath; // 이미지 경로
	private int readcount; // 조회수
	private String city; // 도시
	private String id; // 등록 관리자 아이디
	private String title; // 상품명

	public String getContent() {
		return content;
	}

	public String getCity() {
		return city;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
}
