package daos;

import java.util.ArrayList;

import models.Faq;
import utils.DBConnectionUtil;

public class FaqDAO extends AbstractDAO{
	
	public void insertQuestion(String question,int user_id, String user_name, int anonymous) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("INSERT INTO faq(faq_question,faq_feedback,faq_userid,faq_username,faq_anonymous,faq_state) VALUES(?,?,?,?,?,0)");
			pst.setString(1, question);
			pst.setString(2, "");
			pst.setInt(3, user_id);
			pst.setString(4, user_name);
			pst.setInt(5, anonymous);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst, con);}
	}
	
	public void updateQuestion(String faq_feedback,int user_id) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE faq SET faq_feedback = ? WHERE faq_id = ?");
			pst.setString(1, faq_feedback);
			pst.setInt(2, user_id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst, con);}
	}
	
	public ArrayList<Faq> listFaqState0(){
		ArrayList<Faq> listFaq = new ArrayList<Faq>();
		Faq faq = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM faq WHERE faq_state = 0");
			while(rs.next()) {
				faq = new Faq(rs.getInt("faq_id"), 
										rs.getString("faq_question"), 
										rs.getString("faq_feedback"), 
										rs.getInt("faq_userid"), 
										rs.getString("faq_username"), 
										rs.getInt("faq_anonymous"), 
										rs.getInt("faq_state"));
				listFaq.add(faq);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, st, con);}
		return listFaq;
	}
	
	public ArrayList<Faq> listFaqState1(){
		ArrayList<Faq> listFaq = new ArrayList<Faq>();
		Faq faq = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM faq WHERE faq_state = 1");
			while(rs.next()) {
				faq = new Faq(rs.getInt("faq_id"), 
										rs.getString("faq_question"), 
										rs.getString("faq_feedback"), 
										rs.getInt("faq_userid"), 
										rs.getString("faq_username"), 
										rs.getInt("faq_anonymous"), 
										rs.getInt("faq_state"));
				listFaq.add(faq);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, st, con);}
		return listFaq;
	}
	
	public Faq findFaq(int faq_id){
		Faq faq = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM faq WHERE faq_id = ?");
			pst.setInt(1, faq_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				faq = new Faq(rs.getInt("faq_id"), 
										rs.getString("faq_question"), 
										rs.getString("faq_feedback"), 
										rs.getInt("faq_userid"), 
										rs.getString("faq_username"), 
										rs.getInt("faq_anonymous"), 
										rs.getInt("faq_state"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return faq;
	}
	
	public Faq findFeedbackFaq(int faq_id){
		Faq faq = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT faq_feedback FROM faq WHERE faq_id = ?");
			pst.setInt(1, faq_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				faq = new Faq(rs.getString("faq_feedback"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return faq;
	}
	
	public void replyFaq(int IDFaq, String replyContent){
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE faq SET faq_feedback = ?, faq_state = 1 WHERE faq_id = ?");
			pst.setString(1, replyContent);
			pst.setInt(2, IDFaq);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
	}
}
