package models;

public class Comment {
	private int comment_id;
	private String comment_content;
	private String comment_datecreated;
	private int IDAccount;
	private String NameAccount;
	private int IDListnews;
	public Comment() {
		super();
	}
	public Comment(int comment_id, String comment_content, String comment_datecreated, int iDAccount,
			String nameAccount, int iDListnews) {
		super();
		this.comment_id = comment_id;
		this.comment_content = comment_content;
		this.comment_datecreated = comment_datecreated;
		IDAccount = iDAccount;
		NameAccount = nameAccount;
		IDListnews = iDListnews;
	}
	
	public Comment(int comment_id) {
		super();
		this.comment_id = comment_id;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_datecreated() {
		return comment_datecreated;
	}
	public void setComment_datecreated(String comment_datecreated) {
		this.comment_datecreated = comment_datecreated;
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
	public int getIDListnews() {
		return IDListnews;
	}
	public void setIDListnews(int iDListnews) {
		IDListnews = iDListnews;
	}
	

}
