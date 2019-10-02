package dao;

public class PageMaker {
	private int totalcount;  //��ü �Խù� ����
	private int pagenum;  //���� ������ ��ȣ
	private int contentnum=10;  //�� �������� �� �� ǥ������
	private int startpage=1;  //���� ������ ����� ���� ������
	private int endpage=10;  //���� ������ ����� �� ������
	private boolean prev=false;  //���� �������� ���� ȭ��ǥ
	private boolean next;  //���� �������� ���� ȭ��ǥ
	private int currentblock;  //���� ������ ���
	private int lastblock;  //������ ������ ���
	
	public void prevnext(int pagenum) {
		if (pagenum>0 && pagenum<11) {  //ù��° ������ ��� �ȿ� ������ ���� �������� ������ ����
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
	public int calcpage(int totalcount, int contentnum) { //��ü ������ �� ���
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
	public void setstartpage(int currentblock) {  //���������� ���
		this.startpage = (currentblock*10)+1;
	}
	public int getendpage() {
		return endpage;
	}
	public void setendpage(int getlastblock, int getcurrentblock) {  //�� ������ ���
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
		// ������ ��ȣ�� ���� ���
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
