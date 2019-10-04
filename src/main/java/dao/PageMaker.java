package dao;

public class PageMaker {
    //mysql 들어갈 값은 page 가 아니라 pageStart, perPageNum 이다.
    //limit #{pageStart}, #{perPageNum}
    private int page;
    private int perPageNum;
    private int pageStart;
    //하단 페이징  << 1 2 3 4 5 6 7 8 9 10 >>
    private int totalCount; //전체 개수
    private int startPage; // 시작 페이지
    private int endPage;   // 끝페이지
    private boolean prev;  // 이전 여부 
    private boolean next;  // 다음 여부
    private int displayPageNum=10;
     
    public PageMaker() {
        this.page=1;          //초기 페이지는 1 
        this.perPageNum=10;  //limit 10 개씩 보여준다.
    }
    public void setPage(int page) {
        //페이지 번호가 0이거나 0보다 작으면 1페이지로 한다.
        //
        if(page <=0){
            this.page=1;
            return;
        }
        this.page = page;
    }
    // MyBatis SQL 의 Mapper 에서 인식해서 가져가는 파라미터 값 메소드 #{perPageNum}
    public void setPerPageNum(int perPageNum) {
        //몇개 씩 보여줄것인가 이다. 최대 100개씩 보여 줄것으로 설정한다.
        //만약 0보다 작거나 100 보다 크면 10으로 초기화 시킨다.
        if(perPageNum <=0 || perPageNum >100){
            this.perPageNum=10;
            return;
        }
        this.perPageNum = perPageNum;
    }
    // MyBatis SQL 의 Mapper 에서 인식해서 가져가는 파라미터 값 메소드 #{pageStart}
    public int getPageStart() {
        //실질적으로 Mybatis 에서  파라미터로 인식해서  가져오는 것은 get 이다.
        // 따라서 getPageStart 에서 값을 설정한다.
        //시작 데이터 번호 = (페이지 번호 -1 ) * 페이지당 보여지는 개수
        this.pageStart=(this.page -1)*perPageNum;
        return this.pageStart;
    }
    //전체 페이지 설정과 동시에 하단에 뿌려질 페이지 계산하기 
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }
    private void calcData(){
        //현재 페이지 번호 / 하단 페이지번호 수
        endPage=(int)(Math.ceil(page / (double)displayPageNum)*displayPageNum);
         
        startPage=(endPage - displayPageNum) +1;
         
        int tempEndPage=(int)(Math.ceil(totalCount/(double)perPageNum));
         
        if(endPage >tempEndPage){
            endPage=tempEndPage;
        }
        prev =startPage ==1 ? false :true;
        next =endPage *perPageNum >=totalCount ? false :true;
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
	public int getPage() {
		return page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	@Override
	public String toString() {
		return "PageMaker [page=" + page + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + ", totalCount="
				+ totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", displayPageNum=" + displayPageNum + "]";
	}
}
