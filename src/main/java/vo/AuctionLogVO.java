package vo;

public class AuctionLogVO {
private String unique_id;
private String user_id;
private String price;
private String bid_date;
private String email;
private String user_name;
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
@Override
public String toString() {
	return "AuctionLogVO [unique_id=" + unique_id + ", user_id=" + user_id + ", price=" + price + ", bid_date="
			+ bid_date + ", email=" + email + ", user_name=" + user_name + "]";
}
public String getUnique_id() {
	return unique_id;
}
public void setUnique_id(String unique_id) {
	this.unique_id = unique_id;
}
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
public String getBid_date() {
	return bid_date;
}
public void setBid_date(String bid_date) {
	this.bid_date = bid_date;
}
}
