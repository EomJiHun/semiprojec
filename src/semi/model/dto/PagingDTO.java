package semi.model.dto;

public class PagingDTO {

	private int start; // 시작 넘버
	private int end; // 끝 넘버
	private int block = 5; // 및에 보여줄 페이징블락 수 5개
	private int count = 10; // 한페이지에 보여줄 갯수 10개
	private int total; // 전체 글의 갯수
	private int pageNum; // 현재 페이지 번호
	private int startPage; // 시작 블록페이지
	private int endPage; // 끝 블록 페이지
	private int nextPage; // 다음 블록
	private int prePage; // 이전 블록

	public PagingDTO() {

	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPage(int pageNum) {
		this.pageNum = pageNum;
		this.start = 10 * (pageNum - 1) + 1;
		this.end = start + 9;
		if (end > total) {
			end = total;
		}
	}

	public void setBlockPage(int pageNum) {
		this.startPage = ((pageNum - 1) / 5 * 5) + 1;
		this.endPage = ((pageNum - 1) / 5 * 5) + 5;
		int totalPage = 0;
		if (total % 10 == 0) {
			totalPage = total / 10;
		} else {
			totalPage = total / 10 + 1;
		}
		if (endPage > totalPage)
			this.endPage = totalPage;
		this.nextPage = this.startPage+5;
		this.prePage = this.startPage-5;
		if(this.prePage <= 0)
			this.prePage = 1;
		if(this.nextPage > totalPage) {
			this.nextPage = this.startPage;
		}
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBlock() {
		return block;
	}

	public void setBlock(int block) {
		this.block = block;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
