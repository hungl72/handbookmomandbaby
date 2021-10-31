package models;

public class Product {
	private int product_id;
	private String product_name;
	private String product_introduce;
	private String product_description;
	private String product_image;
	private double product_price;
	private int product_views;
	private String product_datecreated;
	private String product_datemodified;
	private int category_id;
	public Product() {
		super();
	}
	public Product(int product_id, String product_name, String product_introduce, String product_description,
			String product_image, double product_price, int product_views, String product_datecreated,
			String product_datemodified, int category_id) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_introduce = product_introduce;
		this.product_description = product_description;
		this.product_image = product_image;
		this.product_price = product_price;
		this.product_views = product_views;
		this.product_datecreated = product_datecreated;
		this.product_datemodified = product_datemodified;
		this.category_id = category_id;
	}
	
	public Product(int product_id) {
		super();
		this.product_id = product_id;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_introduce() {
		return product_introduce;
	}
	public void setProduct_introduce(String product_introduce) {
		this.product_introduce = product_introduce;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}
	public int getProduct_views() {
		return product_views;
	}
	public void setProduct_views(int product_views) {
		this.product_views = product_views;
	}
	public String getProduct_datecreated() {
		return product_datecreated;
	}
	public void setProduct_datecreated(String product_datecreated) {
		this.product_datecreated = product_datecreated;
	}
	public String getProduct_datemodified() {
		return product_datemodified;
	}
	public void setProduct_datemodified(String product_datemodified) {
		this.product_datemodified = product_datemodified;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
	
}
