package models;

public class CommentChildren {
	private int comment_children_id;
	private String comment_children_content;
	private String comment_children_datecreated;
	private int IDAccount;
	private String NameAccount;
	private int IDListNews;
	private int IDComment;
	public CommentChildren() {
		super();
	}
	public CommentChildren(int comment_children_id, String comment_children_content,
			String comment_children_datecreated, int iDAccount, String nameAccount, int iDListNews, int iDComment) {
		super();
		this.comment_children_id = comment_children_id;
		this.comment_children_content = comment_children_content;
		this.comment_children_datecreated = comment_children_datecreated;
		IDAccount = iDAccount;
		NameAccount = nameAccount;
		IDListNews = iDListNews;
		IDComment = iDComment;
	}
	public int getComment_children_id() {
		return comment_children_id;
	}
	public void setComment_children_id(int comment_children_id) {
		this.comment_children_id = comment_children_id;
	}
	public String getComment_children_content() {
		return comment_children_content;
	}
	public void setComment_children_content(String comment_children_content) {
		this.comment_children_content = comment_children_content;
	}
	public String getComment_children_datecreated() {
		return comment_children_datecreated;
	}
	public void setComment_children_datecreated(String comment_children_datecreated) {
		this.comment_children_datecreated = comment_children_datecreated;
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
	public int getIDListNews() {
		return IDListNews;
	}
	public void setIDListNews(int iDListNews) {
		IDListNews = iDListNews;
	}
	public int getIDComment() {
		return IDComment;
	}
	public void setIDComment(int iDComment) {
		IDComment = iDComment;
	}

	
}
