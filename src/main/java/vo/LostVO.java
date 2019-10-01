package vo;

public class LostVO {
	private String Addr;
	private String Unique_id;
	private String Content;
	private String Keep_place;
	private String Image_address;
	private String Product_name;
	private String Find_date;
	private String Category;
	private Double lon;
	private Double lat;

	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		Addr = addr;
	}
	public String getUnique_id() {
		return Unique_id;
	}
	public void setUnique_id(String unique_id) {
		Unique_id = unique_id;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getKeep_place() {
		return Keep_place;
	}
	public void setKeep_place(String keep_place) {
		Keep_place = keep_place;
	}
	public String getImage_address() {
		return Image_address;
	}
	public void setImage_address(String image_address) {
		Image_address = image_address;
	}
	public String getProduct_name() {
		return Product_name;
	}
	public void setProduct_name(String product_name) {
		Product_name = product_name;
	}
	public String getFind_date() {
		return Find_date;
	}
	public void setFind_date(String find_date) {
		Find_date = find_date;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public Double getLon() {
		return lon;
	}
	public void setLon(Double lon) {
		this.lon = lon;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	@Override
	public String toString() {
		return "LostVO [Addr=" + Addr + ", Unique_id=" + Unique_id + ", Content=" + Content + ", Keep_place="
				+ Keep_place + ", Image_address=" + Image_address + ", Product_name=" + Product_name + ", Find_date="
				+ Find_date + ", Category=" + Category + ", lon=" + lon + ", lat=" + lat + "]";
	}
}