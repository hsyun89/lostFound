package dao;

public class PageDAO {
	private int totalcount;  //전체 게시물 개수
	private int pagenum;  //현재 페이지 번호
	private int contentnum=10;  //한 페이지에 몇 개 표시할지
	private int startPage=1;  //현재 페이지 블록의 시작 페이지
	private int endPage=10;  //현재 페이지 블록의 끝 페이지
	private boolean prev=false;  //이전 페이지로 가는 화살표
	private boolean next;  //다음 페이지로 가는 화살표
	private int currentblock;  //현재 페이지 블록
	private int lastblock;  //마지막 페이지 블록
	
	public void prevnext(int pagenum) {
		if (pagenum>0 && pagenum<11) {  //첫번째 페이지 블록 안에 있으면 이전 페이지는 보이지 않음
			setPrev(false);
			setNext(true);
		}else if(getLastblock() == getCurrentblock()) {
			setPrev(true);
			setNext(false);
		}else {
			setPrev(true);
			setNext(true);
		}
	}
	public int calcpage(int totalcount, int contentnum) { //전체 페이지 수 계산
		int totalpage = totalcount / contentnum;
		if(totalcount%contentnum>0) {
			totalpage++;
		}
		return totalpage;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int currentblock) {  //시작페이지 계산
		this.startPage = (currentblock*10)+1;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int getlastblock, int getcurrentblock) {  //끝 페이지 계산
		if(getlastblock == getcurrentblock) {
			this.endPage = calcpage(getTotalcount(), getContentnum());
		}else {
			this.endPage = getStartPage()+9;
		}
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
	public int getCurrentblock() {
		return currentblock;
	}
	public void setCurrentblock(int pagenum) {
		// 페이지 번호를 통해 계산
		this.currentblock = pagenum/10;
		if(pagenum%10>0) {
			this.currentblock++;
		}
	}
	public int getLastblock() {
		return lastblock;
	}
	public void setLastblock(int totalcount) {
		this.lastblock = totalcount / (10*this.contentnum);
		if(totalcount %(10*this.contentnum)>0) {
			this.lastblock++;
		}
	}
}
