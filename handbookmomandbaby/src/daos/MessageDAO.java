package daos;

import java.sql.SQLException;
import java.util.ArrayList;

import models.Account;
import models.Message;
import utils.DBConnectionUtil;

public class MessageDAO extends AbstractDAO{
	public void insertMessage(String message_sent,String message_time_sent,String name,int id,int id_expert) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("insert into messages (message_sent,message_time_sent,name,id_account,id_expert) values(?,?,?,?,?)");
			pst.setString(1, message_sent);pst.setString(2, message_time_sent);pst.setString(3, name);pst.setInt(4, id);pst.setInt(5, id_expert);
			int result = pst.executeUpdate();
			if(result > 0) {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
	}
	public ArrayList<Message> findAll(int id) {
		ArrayList<Message> listMessage = new ArrayList<Message>();
		Message message = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM messages where id_account = ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				message = new Message(rs.getInt("message_id"),
														  rs.getString("message_sent"),
														  rs.getString("message_time_sent"),
														  rs.getString("name"),
														  rs.getInt("id_account"),
														  rs.getInt("id_expert"));
				listMessage.add(message);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listMessage;
	}
	public ArrayList<Message> updateMessage(int id) {
		ArrayList<Message> listMessage = new ArrayList<Message>();
		Message message = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM messages ORDER BY id DESC LIMIT ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				message = new Message(rs.getInt("message_id"),
														  rs.getString("message_sent"),
														  rs.getString("message_time_sent"),
														  rs.getInt("id"),
														  rs.getString("name"));
				listMessage.add(message);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listMessage;
	}
	public Message lastMessage(int id) {
		Message message = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT DISTINCT * FROM messages WHERE id_account = ? AND name NOT IN ('admin', 'expert', 'user') ORDER BY message_id DESC LIMIT 1");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				message = new Message(rs.getInt("message_id"),
						  rs.getString("message_sent"),
						  rs.getString("message_time_sent"),
						  rs.getString("name"),
						  rs.getInt("id_expert"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return message;
	}
	public ArrayList<Integer> numberUser(){
		ArrayList<Integer> numberUser = new ArrayList<Integer>();
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT DISTINCT id_account FROM messages");
			while(rs.next()) {
				numberUser.add(rs.getInt("id_account"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(st, con);}
		return numberUser;
	}
	public ArrayList<String> nameUser(){
		ArrayList<String> nameUser = new ArrayList<String>();
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT DISTINCT name FROM messages WHERE name NOT IN ('admin', 'expert', 'user')");
			while(rs.next()) {
				nameUser.add(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(st, con);}
		return nameUser;
	}
	public ArrayList<Account> checkStatus(){
		ArrayList<Account> listCheckStatus = new ArrayList<Account>();
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM account WHERE account_status = 1 AND NOT IDUserGroup = 1 AND NOT IDUserGroup = 2");
			while(rs.next()) {
				listCheckStatus.add(new Account(rs.getInt("account_id"),rs.getString("account_email"), rs.getString("account_pass"), rs.getString("account_name"), rs.getInt("account_status")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(rs, st, con);}
		return listCheckStatus;
	}
	public ArrayList<Account> checkStatusOff(){
		ArrayList<Account> listCheckStatus = new ArrayList<Account>();
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM account WHERE account_status = 0 AND NOT IDUserGroup = 1 AND NOT IDUserGroup = 2");
			while(rs.next()) {
				listCheckStatus.add(new Account(rs.getInt("account_id"),rs.getString("account_email"), rs.getString("account_pass"), rs.getString("account_name"), rs.getInt("account_status")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(rs, st, con);}
		return listCheckStatus;
	}
	public Account listOnline(){
		Account listOnline = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(account_status) AS account_status FROM account WHERE account_status = 1 AND  NOT IDUserGroup = 1 AND  NOT IDUserGroup = 2");
			while(rs.next()) {
				listOnline = new Account(rs.getInt("account_status"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(st, con);}
		return listOnline;
	}
	public Account listOffline(){
		Account listOffline = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(account_status) AS account_status FROM account WHERE account_status = 0 AND NOT IDUserGroup = 1 AND  NOT IDUserGroup = 2");
			while(rs.next()) {
				listOffline = new Account(rs.getInt("account_status"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(st, con);}
		return listOffline;
	}
}
