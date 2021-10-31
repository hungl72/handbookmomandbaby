package models;

public class Faq {
	private int faq_id;
	private String faq_question;
	private String faq_feedback;
	private int faq_userid;
	private String faq_username;
	private int faq_anonymous;
	private int faq_state;
	public Faq() {
		super();
	}
	public Faq(int faq_id, String faq_question, String faq_feedback, int faq_userid, String faq_username,
			int faq_anonymous, int faq_state) {
		super();
		this.faq_id = faq_id;
		this.faq_question = faq_question;
		this.faq_feedback = faq_feedback;
		this.faq_userid = faq_userid;
		this.faq_username = faq_username;
		this.faq_anonymous = faq_anonymous;
		this.faq_state = faq_state;
	}
	
	public Faq(String faq_feedback) {
		super();
		this.faq_feedback = faq_feedback;
	}
	public int getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}
	public String getFaq_question() {
		return faq_question;
	}
	public void setFaq_question(String faq_question) {
		this.faq_question = faq_question;
	}
	public String getFaq_feedback() {
		return faq_feedback;
	}
	public void setFaq_feedback(String faq_feedback) {
		this.faq_feedback = faq_feedback;
	}
	public int getFaq_userid() {
		return faq_userid;
	}
	public void setFaq_userid(int faq_userid) {
		this.faq_userid = faq_userid;
	}
	public String getFaq_username() {
		return faq_username;
	}
	public void setFaq_username(String faq_username) {
		this.faq_username = faq_username;
	}
	public int getFaq_anonymous() {
		return faq_anonymous;
	}
	public void setFaq_anonymous(int faq_anonymous) {
		this.faq_anonymous = faq_anonymous;
	}
	public int getFaq_state() {
		return faq_state;
	}
	public void setFaq_state(int faq_state) {
		this.faq_state = faq_state;
	}
	
}
