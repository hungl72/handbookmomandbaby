package models;

public class Contact {
	private int contact_id;
	private String contact_title;
	private String contact_content;
	private int IDAccount;
	private String NameAccount;
	public Contact() {
		super();
	}
	public Contact(int contact_id, String contact_title, String contact_content, int iDAccount, String nameAccount) {
		super();
		this.contact_id = contact_id;
		this.contact_title = contact_title;
		this.contact_content = contact_content;
		IDAccount = iDAccount;
		NameAccount = nameAccount;
	}
	public int getContact_id() {
		return contact_id;
	}
	public void setContact_id(int contact_id) {
		this.contact_id = contact_id;
	}
	public String getContact_title() {
		return contact_title;
	}
	public void setContact_title(String contact_title) {
		this.contact_title = contact_title;
	}
	public String getContact_content() {
		return contact_content;
	}
	public void setContact_content(String contact_content) {
		this.contact_content = contact_content;
	}
	public int getIDAccount() {
		return IDAccount;
	}
	public void setIDAccount(int iDAccount) {
		IDAccount = iDAccount;
	}
	public String getNameAccount() {
		return NameAccount;
	}
	public void setNameAccount(String nameAccount) {
		NameAccount = nameAccount;
	}

	
}
