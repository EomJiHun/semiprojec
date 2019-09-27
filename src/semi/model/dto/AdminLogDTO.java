package semi.model.dto;

// 관리자
public class AdminLogDTO {
	private int no; // 시퀀스
	private String time; // 적용 시간
	private String id; // 변경자 아이디
	private String content; // 로그 내용
	private String name; // 변경자 이름
	private String ip; // 변경한 곳 ip

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
