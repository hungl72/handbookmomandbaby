package models;

public class Favourite {
	private int favourite_id;
	private String favourite_name;
	private String favourite_image;
	private int favourite_status;
	private int menu_id;
	private int listnews_id;
	private int IDAccount;
	public Favourite() {
		super();
	}
	public Favourite(int favourite_id, String favourite_name, String favourite_image, int favourite_status, int menu_id,
			int listnews_id, int iDAccount) {
		super();
		this.favourite_id = favourite_id;
		this.favourite_name = favourite_name;
		this.favourite_image = favourite_image;
		this.favourite_status = favourite_status;
		this.menu_id = menu_id;
		this.listnews_id = listnews_id;
		IDAccount = iDAccount;
	}
	public int getFavourite_id() {
		return favourite_id;
	}
	public void setFavourite_id(int favourite_id) {
		this.favourite_id = favourite_id;
	}
	public String getFavourite_name() {
		return favourite_name;
	}
	public void setFavourite_name(String favourite_name) {
		this.favourite_name = favourite_name;
	}
	public String getFavourite_image() {
		return favourite_image;
	}
	public void setFavourite_image(String favourite_image) {
		this.favourite_image = favourite_image;
	}
	public int getFavourite_status() {
		return favourite_status;
	}
	public void setFavourite_status(int favourite_status) {
		this.favourite_status = favourite_status;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public int getListnews_id() {
		return listnews_id;
	}
	public void setListnews_id(int listnews_id) {
		this.listnews_id = listnews_id;
	}
	public int getIDAccount() {
		return IDAccount;
	}
	public void setIDAccount(int iDAccount) {
		IDAccount = iDAccount;
	}
	
}
