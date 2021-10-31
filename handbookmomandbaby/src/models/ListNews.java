package models;

import java.util.Date;

public class ListNews {
	private int listnews_id;
	private String listnews_name;
	private String listnews_uploader;
	private String listnews_image;
	private Date listnews_date;
	private String listnews_content;
	private int menu_id;
	private int favourite_status;
	private int listnews_views;
	public ListNews() {
		super();
	}
	public ListNews(int listnews_id, String listnews_name, String listnews_uploader, String listnews_image,
			Date listnews_date, String listnews_content, int menu_id) {
		super();
		this.listnews_id = listnews_id;
		this.listnews_name = listnews_name;
		this.listnews_uploader = listnews_uploader;
		this.listnews_image = listnews_image;
		this.listnews_date = listnews_date;
		this.listnews_content = listnews_content;
		this.menu_id = menu_id;
	}
	public ListNews(int listnews_id, String listnews_name, String listnews_uploader, String listnews_image,
			Date listnews_date, String listnews_content, int menu_id, int listnews_views) {
		super();
		this.listnews_id = listnews_id;
		this.listnews_name = listnews_name;
		this.listnews_uploader = listnews_uploader;
		this.listnews_image = listnews_image;
		this.listnews_date = listnews_date;
		this.listnews_content = listnews_content;
		this.menu_id = menu_id;
		this.listnews_views = listnews_views;
	}
	public ListNews(int listnews_id, int favourite_status) {
		super();
		this.listnews_id = listnews_id;
		this.favourite_status = favourite_status;
	}
	
	public ListNews(int listnews_id, String listnews_name, String listnews_uploader, String listnews_image,
			Date listnews_date, String listnews_content, int menu_id, int favourite_status, int listnews_views) {
		super();
		this.listnews_id = listnews_id;
		this.listnews_name = listnews_name;
		this.listnews_uploader = listnews_uploader;
		this.listnews_image = listnews_image;
		this.listnews_date = listnews_date;
		this.listnews_content = listnews_content;
		this.menu_id = menu_id;
		this.favourite_status = favourite_status;
		this.listnews_views = listnews_views;
	}
	public int getListnews_views() {
		return listnews_views;
	}
	public void setListnews_views(int listnews_views) {
		this.listnews_views = listnews_views;
	}
	public int getListnews_id() {
		return listnews_id;
	}
	public void setListnews_id(int listnews_id) {
		this.listnews_id = listnews_id;
	}
	public String getListnews_name() {
		return listnews_name;
	}
	public void setListnews_name(String listnews_name) {
		this.listnews_name = listnews_name;
	}
	public String getListnews_uploader() {
		return listnews_uploader;
	}
	public void setListnews_uploader(String listnews_uploader) {
		this.listnews_uploader = listnews_uploader;
	}
	public String getListnews_image() {
		return listnews_image;
	}
	public void setListnews_image(String listnews_image) {
		this.listnews_image = listnews_image;
	}
	public Date getListnews_date() {
		return listnews_date;
	}
	public void setListnews_date(Date listnews_date) {
		this.listnews_date = listnews_date;
	}
	public String getListnews_content() {
		return listnews_content;
	}
	public void setListnews_content(String listnews_content) {
		this.listnews_content = listnews_content;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public int getFavourite_status() {
		return favourite_status;
	}
	public void setFavourite_status(int favourite_status) {
		this.favourite_status = favourite_status;
	}
	
}
