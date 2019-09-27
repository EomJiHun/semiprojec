package semi.model.dto;


public class ReserveDTO {

	private int no; // 예약 번호
	private int price; // 예약 총 가격
	private int pnum; // 예약 수량
	private String day;
	private String email;// 결제승인번호
	private String rpId;//주문번호
	private String imp_uid; //자기아이디
	private String merchant_uid; //상태 0 예약완료 1 취소신청 2 취소완료   //////int String?
	private int pid;// product의 키값 //int String? 
	private String title;
    private String options; //reserve.jsp페이지에서 보여주기위한 변수들
	private String name; // 보여주기용 이름
	private String imagePath;

	public String getName() {
		return name;
	}


	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	public void setName(String name) {
		this.name = name;
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


	public String getEmail() {
		return email;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getPnum() {
		return pnum;
	}


	public void setPnum(int pnum) {
		this.pnum = pnum;
	}


	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
	}


	public String getRpId() {
		return rpId;
	}


	public void setRpId(String rpId) {
		this.rpId = rpId;
	}


	public String getImp_uid() {
		return imp_uid;
	}


	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}


	public String getMerchant_uid() {
		return merchant_uid;
	}


	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	

}
