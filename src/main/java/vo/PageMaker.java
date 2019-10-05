package vo;

public class PageMaker {
	//mysql 들어갈 값은 page가 아닌 pageStart, perPageNum이다.
	//limit #{pageStart}, #{perPageNum}
	private int page;
	private int perPageNum;
	private int pageStart;
	//하단 페이징
	private int totalCount; //전체 개수
    private int startPage; // 시작 페이지
    private int endPage;   // 끝페이지
    private boolean prev;  // 이전 여부 
    private boolean next;  // 다음 여부
    private int displayPageNum=10;
     
	public PageMaker() {
		this.page=1;		//초기 페이지 = 1
		this.perPageNum=10; //limit 10개씩 보여준다.
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		//페이지 번호가 0 or 0보다 작으면 1페이지로 한다.
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	//Mapper에서 인식 후 가져가는 파라미터 값 메소드 #{perPageNum}
	public void setPerPageNum(int perPageNum) {
		//최대 100개씩 보여준다. 단, 리스트가 0보다 작거나 100보다 크면 10으로 초기화
		if(perPageNum <=0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	//Mapper에서 인식 후 가져가는 파라미터 값 메소드 #{pageStart}
	public int getPageStart() {
		//시작 데이터 번호 = (페이지 번호-1)*perPageNum;
		this.pageStart = (this.page -1)*perPageNum;
		return this.pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public void calcData() {
		//현재 페이지 번호 / 하단 페이지번호 수
        endPage=(int)(Math.ceil(page / (double)displayPageNum)*displayPageNum);
        startPage=(endPage - displayPageNum) +1;
        int tempEndPage=(int)(Math.ceil(totalCount/(double)perPageNum));
        if(endPage >tempEndPage){
            endPage=tempEndPage;
        }
        prev = startPage ==1 ? false :true;
        next = endPage *perPageNum >=totalCount ? false :true;
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
}