package models;

import java.util.Date;

public class Account {
	private int account_id;
	private String account_name;
	private String account_email;
	private String account_pass;
	private Date account_date;
	private String account_address;
	private String account_phone;
	private Date account_datecreated;
	private Date account_datemodified;
	private int account_status;
	private String account_image;
	private int IDUserGroup;
	public Account() {
		super();
	}
	public Account(int account_id, String account_name, String account_email, String account_pass, Date account_date,
			String account_address, Date account_datecreated, Date account_datemodified, int account_status,
			String account_image, int IDUserGroup) {
		super();
		this.account_id = account_id;
		this.account_name = account_name;
		this.account_email = account_email;
		this.account_pass = account_pass;
		this.account_date = account_date;
		this.account_address = account_address;
		this.account_datecreated = account_datecreated;
		this.account_datemodified = account_datemodified;
		this.account_status = account_status;
		this.account_image = account_image;
		this.IDUserGroup = IDUserGroup;
	}
	public Account(int account_id, String account_name, String account_email, String account_pass, Date account_date,
			String account_address, String account_phone, Date account_datecreated, Date account_datemodified, int account_status,
			String account_image, int IDUserGroup) {
		super();
		this.account_id = account_id;
		this.account_name = account_name;
		this.account_email = account_email;
		this.account_pass = account_pass;
		this.account_date = account_date;
		this.account_address = account_address;
		this.account_phone = account_phone;
		this.account_datecreated = account_datecreated;
		this.account_datemodified = account_datemodified;
		this.account_status = account_status;
		this.account_image = account_image;
		this.IDUserGroup = IDUserGroup;
	}
	public Account(int account_id, String account_email, String account_pass,String account_name, int IDUserGroup) {
		super();
		this.account_id = account_id;
		this.account_email = account_email;
		this.account_pass = account_pass;
		this.account_name = account_name;
		this.IDUserGroup = IDUserGroup;
	}
	
	public Account(int account_id, String account_email, String account_pass, String account_name) {
		super();
		this.account_id = account_id;
		this.account_email = account_email;
		this.account_pass = account_pass;
		this.account_name = account_name;
	}
	
	public Account(String account_email, String account_pass) {
		super();
		this.account_email = account_email;
		this.account_pass = account_pass;
	}
	
	public Account(int account_status) {
		super();
		this.account_status = account_status;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getAccount_email() {
		return account_email;
	}
	public void setAccount_email(String account_email) {
		this.account_email = account_email;
	}
	public String getAccount_pass() {
		return account_pass;
	}
	public void setAccount_pass(String account_pass) {
		this.account_pass = account_pass;
	}
	public Date getAccount_date() {
		return account_date;
	}
	public void setAccount_date(Date account_date) {
		this.account_date = account_date;
	}
	public String getAccount_address() {
		return account_address;
	}
	public void setAccount_address(String account_address) {
		this.account_address = account_address;
	}
	
	public String getAccount_phone() {
		return account_phone;
	}
	public void setAccount_phone(String account_phone) {
		this.account_phone = account_phone;
	}
	public Date getAccount_datecreated() {
		return account_datecreated;
	}
	public void setAccount_datecreated(Date account_datecreated) {
		this.account_datecreated = account_datecreated;
	}
	public Date getAccount_datemodified() {
		return account_datemodified;
	}
	public void setAccount_datemodified(Date account_datemodified) {
		this.account_datemodified = account_datemodified;
	}
	public int getAccount_status() {
		return account_status;
	}
	public void setAccount_status(int account_status) {
		this.account_status = account_status;
	}
	public String getAccount_image() {
		return account_image;
	}
	public void setAccount_image(String account_image) {
		this.account_image = account_image;
	}
	public int getIDUserGroup() {
		return IDUserGroup;
	}
	public void setIDUserGroup(int iDUserGroup) {
		IDUserGroup = iDUserGroup;
	}

}
