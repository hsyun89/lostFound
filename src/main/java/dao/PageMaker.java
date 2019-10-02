package dao;

public class PageMaker {
	private int totalcount;  //전체 게시물 개수
	private int pagenum;  //현재 페이지 번호
	private int contentnum=10;  //한 페이지에 몇 개 표시할지
	private int startpage=1;  //현재 페이지 블록의 시작 페이지
	private int endpage=10;  //현재 페이지 블록의 끝 페이지
	private boolean prev=false;  //이전 페이지로 가는 화살표
	private boolean next;  //다음 페이지로 가는 화살표
	private int currentblock;  //현재 페이지 블록
	private int lastblock;  //마지막 페이지 블록
	
	public void prevnext(int pagenum) {
		if (pagenum>0 && pagenum<11) {  //첫번째 페이지 블록 안에 있으면 이전 페이지는 보이지 않음
			setprev(false);
			setnext(true);
		}else if(getlastblock() == getcurrentblock()) {
			setprev(true);
			setnext(false);
		}else {
			setprev(true);
			setnext(true);
		}
	}
	public int calcpage(int totalcount, int contentnum) { //전체 페이지 수 계산
		int totalpage = totalcount / contentnum;
		if(totalcount%contentnum>0) {
			totalpage++;
		}
		return totalpage;
	}
	public int gettotalcount() {
		return totalcount;
	}
	public void settotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getpagenum() {
		return pagenum;
	}
	public void setpagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getcontentnum() {
		return contentnum;
	}
	public void setcontentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public int getstartpage() {
		return startpage;
	}
	public void setstartpage(int currentblock) {  //시작페이지 계산
		this.startpage = (currentblock*10)+1;
	}
	public int getendpage() {
		return endpage;
	}
	public void setendpage(int getlastblock, int getcurrentblock) {  //끝 페이지 계산
		if(getlastblock == getcurrentblock) {
			this.endpage = calcpage(gettotalcount(), getcontentnum());
		}else {
			this.endpage = getstartpage()+9;
		}
	}
	public boolean isprev() {
		return prev;
	}
	public void setprev(boolean prev) {
		this.prev = prev;
	}
	public boolean isnext() {
		return next;
	}
	public void setnext(boolean next) {
		this.next = next;
	}
	public int getcurrentblock() {
		return currentblock;
	}
	public void setcurrentblock(int pagenum) {
		// 페이지 번호를 통해 계산
		this.currentblock = pagenum/10;
		if(pagenum%10>0) {
			this.currentblock++;
		}
	}
	public int getlastblock() {
		return lastblock;
	}
	public void setlastblock(int totalcount) {
		this.lastblock = totalcount / (10*this.contentnum);
		if(totalcount %(10*this.contentnum)>0) {
			this.lastblock++;
		}
	}
}
