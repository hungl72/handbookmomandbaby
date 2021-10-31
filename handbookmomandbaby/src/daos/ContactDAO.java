package daos;

import java.util.ArrayList;

import models.Contact;
import utils.DBConnectionUtil;

public class ContactDAO extends AbstractDAO{
	public int insertContact(String contact_title, String contact_content, int IDAccount, String NameAccount) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("INSERT INTO contact (contact_title,contact_content,IDAccount,NameAccount) VALUES(?,?,?,?)");
			pst.setString(1, contact_title);
			pst.setString(2, contact_content);
			pst.setInt(3, IDAccount);
			pst.setString(4, NameAccount);
			if(pst.executeUpdate() > 0) {
				result = 1;
			}else {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst, con);}
		return result;
	}
	
	public ArrayList<Contact> listContact(){
		ArrayList<Contact> listContact = new ArrayList<Contact>();
		Contact contact = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM contact");
			while(rs.next()) {
				contact = new Contact(rs.getInt("contact_id"), 
													  rs.getString("contact_title"), 
													  rs.getString("contact_content"), 
													  rs.getInt("IDAccount"), 
													  rs.getString("NameAccount"));
				listContact.add(contact);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return listContact;
	}
	
	public int delContact(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("DELETE FROM contact WHERE contact_id = ?");
			pst.setInt(1, id);
			result = pst.executeUpdate() > 0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
	
	public ArrayList<Contact> getItemPagination(int offset){
		ArrayList<Contact> listContact = new ArrayList<Contact>();
		Contact contact = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM contact ORDER BY contact_id DESC LIMIT ?,?");
			pst.setInt(1, offset);
			pst.setInt(2, 5);
			rs = pst.executeQuery();
			while(rs.next()) {
				contact = new Contact(rs.getInt("contact_id"), 
													  rs.getString("contact_title"), 
													  rs.getString("contact_content"), 
													  rs.getInt("IDAccount"),
													  rs.getString("NameAccount"));
				listContact.add(contact);
		}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return listContact;
	}
}
