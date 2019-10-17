package vo;

public class LostVO {
	private String addr;
	private String unique_id;
	private String content;
	private String keep_place;
	private String image_address;
	private String product_name;
	private String find_date;
	private String category;
	private String find_place;

	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getUnique_id() {
		return unique_id;
	}
	public void setUnique_id(String unique_id) {
		this.unique_id = unique_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getKeep_place() {
		return keep_place;
	}
	public void setKeep_place(String keep_place) {
		this.keep_place = keep_place;
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
	public String getFind_date() {
		return find_date;
	}
	public void setFind_date(String find_date) {
		this.find_date = find_date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public String getFind_place() {
		return find_place;
	}
	public void setFind_place(String find_place) {
		this.find_place = find_place;
	}
	@Override
	public String toString() {
		return "LostVO [addr=" + addr + ", unique_id=" + unique_id + ", content=" + content + ", keep_place="
				+ keep_place + ", image_address=" + image_address + ", product_name=" + product_name + ", find_date="
				+ find_date + ", category=" + category + ", find_place=" + find_place + "]";
	}

	
}