package semi.model.dto;

public class QuestionDTO {
	private int no; // 질문글 번호
	private String title;
	private String content;
	private String day;
	private String comments;
	private String id;
	private int qid; // 질문과 답변을 묶음
	private String email;
	private int vnum;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	public String getDay() {
		return day;
	}
	
	public void setVnum(int vnum) {
		this.vnum = vnum;
	}
	
	public int getVnum() {
		return vnum;
	}

}
