package vo;

public class ListVO {
	
	private String unique_id;
	private String user_id;
	private String price;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	private String image_address;
	private String product_name;
	private String start_price;
	private String min_bid;
	private String start_date;
	private String end_date;
	private String category;
	public String getUnique_id() {
		return unique_id;
	}
	@Override
	public String toString() {
		return "ListVO [unique_id=" + unique_id + ", user_id=" + user_id + ", price=" + price + ", image_address="
				+ image_address + ", product_name=" + product_name + ", start_price=" + start_price + ", min_bid="
				+ min_bid + ", start_date=" + start_date + ", end_date=" + end_date + ", category=" + category + "]";
	}
	public void setUnique_id(String unique_id) {
		this.unique_id = unique_id;
	}
	public String getImage_address() {
		return image_address;
	}
	public void setImage_address(String image_address) {
		this.image_address = image_address;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

}
