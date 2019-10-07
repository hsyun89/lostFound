package vo;


public class AuctionVO {
	private String unique_id;
	private String start_price;
	private String min_bid;
	private String start_date;
	private String end_date;
	
	public String getUnique_id() {
		return unique_id;
	}
	public void setUnique_id(String unique_id) {
		this.unique_id = unique_id;
	}
	public String getStart_price() {
		return start_price;
	}
	public void setStart_price(String start_price) {
		this.start_price = start_price;
	}
	public String getMin_bid() {
		return min_bid;
	}
	public void setMin_bid(String min_bid) {
		this.min_bid = min_bid;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
}
