package daos;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import models.Account;
import utils.DBConnectionUtil;
import utils.StringUtil;

public class AccountDAO extends AbstractDAO{
	public Account login(String name, String pass) {
		Account account = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM account WHERE account_email = ? and account_pass = ?");
			pst.setString(1, name);pst.setString(2, StringUtil.md5(pass));
			rs = pst.executeQuery();
			while(rs.next()) {
				account = new Account(rs.getInt("account_id"), rs.getString("account_email"), rs.getString("account_pass"), rs.getString("account_name"), rs.getInt("IDUserGroup"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return account;
	}
	public int signup(String account_name,String email,String account_pass ,String account_date,String account_address,String account_phone,String account_datecreated,String account_datemodified,int account_status,String account_image,int iDUserGroup) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("insert into account (account_name,account_email,account_pass,account_date,account_address,account_phone,account_datecreated,account_datemodifier,account_status,account_image,IDUserGroup,reset_pass) values (?,?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, account_name);
			pst.setString(2, email);
			pst.setString(3, StringUtil.md5(account_pass));
			pst.setString(4, account_date);
			pst.setString(5, account_address);
			pst.setString(6, account_phone);
			pst.setString(7, account_date);
			pst.setString(8, account_date);
			pst.setInt(9, account_status);
			pst.setString(10, account_image);
			pst.setInt(11, 3);
			pst.setString(12, "");
			result = pst.executeUpdate();
			if(result > 0) {
				result = 1;
			}else if(result == 0){
				result = 0;
			}else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst, con);}
		return result;
	}
	
	public Account loginAdmin(String email,String pass) {
		Account account = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("select * from account where account_email = ? and  account_pass = ?  and IDUserGroup = 1");
			pst.setString(1, email);pst.setString(2, pass);
			rs = pst.executeQuery();
			while(rs.next()) {
				account = new Account(rs.getInt("account_id"),rs.getString("account_email"),rs.getString("account_pass"),rs.getString("account_name"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(rs, pst, con);}
		return account;
	}
	
	public Account loginExpert(String email,String pass) {
		Account account = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("select * from account where account_email = ? AND account_pass = ? and IDUserGroup = 2");
			pst.setString(1, email);pst.setString(2, pass);
			rs = pst.executeQuery();
			while(rs.next()) {
				account = new Account(rs.getInt("account_id"),rs.getString("account_email"),rs.getString("account_pass"),rs.getString("account_name"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(rs, pst, con);}
		return account;
	}
	
	public void updateStatusLogin(int id) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE account SET account_status = 1 WHERE account_id = ?");
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(pst, con);}
	}
	
	public void updateStatusLogout(int id) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE account SET account_status = 0 WHERE account_id = ?");
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(pst, con);}
	}
	
	public ArrayList<Account> listAccount(){
		ArrayList<Account> listAccount = new ArrayList<Account>();
		Account account = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM account WHERE IDUserGroup NOT IN (1)");
			while(rs.next()) {
				account = new Account(rs.getInt("account_id"),
													  rs.getString("account_name"), 
													  rs.getString("account_email"), 
													  rs.getString("account_pass"), 
													  rs.getDate("account_date"), 
													  rs.getString("account_address"),
													  rs.getString("account_phone"),
													  rs.getDate("account_datecreated"), 
													  rs.getDate("account_datemodifier"), 
													  rs.getInt("account_status"), 
													  rs.getString("account_image"), 
													  rs.getInt("IDUserGroup"));
				listAccount.add(account);
			}
		}catch(Exception e) {
				e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
			return listAccount;
	}
	
	public Account selectAccount(int id){
		Account account = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM account WHERE account_id = ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				account = new Account(rs.getInt("account_id"),
													  rs.getString("account_name"), 
													  rs.getString("account_email"), 
													  rs.getString("account_pass"), 
													  rs.getDate("account_date"), 
													  rs.getString("account_address"),
													  rs.getString("account_phone"),
													  rs.getDate("account_datecreated"), 
													  rs.getDate("account_datemodifier"), 
													  rs.getInt("account_status"), 
													  rs.getString("account_image"), 
													  rs.getInt("IDUserGroup"));
			}
		}catch(Exception e) {
				e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
			return account;
	}
	
	public int deleteAccount(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("DELETE FROM account WHERE account_id = ?");
			pst.setInt(1, id);
			result = pst.executeUpdate();
			result = result>0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
	
	public int addExpert(String name, String email) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("INSERT INTO account (account_name,account_email,account_pass,account_date,account_address,account_phone,account_datecreated,account_datemodifier,account_status,account_image,IDUserGroup, reset_pass) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, StringUtil.md5("12345678"));
			pst.setString(4, new SimpleDateFormat("yyyy-MM-dd").format(new Date().getTime()));
			pst.setString(5, "Chưa có");
			pst.setString(6, "Chưa có");
			pst.setString(7, new SimpleDateFormat("yyyy-MM-dd").format(new Date().getTime()));
			pst.setString(8, new SimpleDateFormat("yyyy-MM-dd").format(new Date().getTime()));
			pst.setInt(9, 0);
			pst.setString(10, "Chưa có");
			pst.setInt(11, 2);
			pst.setString(12, "");
			result = pst.executeUpdate();
			result = result > 0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
	public ArrayList<Account> getItemPagination(int offset) {
		ArrayList<Account> listAccount = new ArrayList<Account>();
		Account account = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM account WHERE IDUserGroup != 1 ORDER BY account_id LIMIT ?,?");
			pst.setInt(1, offset);
			pst.setInt(2, 5);
			rs = pst.executeQuery();
			while(rs.next()) {
				account = new Account(rs.getInt("account_id"),
						  rs.getString("account_name"), 
						  rs.getString("account_email"), 
						  rs.getString("account_pass"), 
						  rs.getDate("account_date"), 
						  rs.getString("account_address"),
						  rs.getString("account_phone"),
						  rs.getDate("account_datecreated"), 
						  rs.getDate("account_datemodifier"), 
						  rs.getInt("account_status"), 
						  rs.getString("account_image"), 
						  rs.getInt("IDUserGroup"));
				listAccount.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return listAccount;
	}
	public int countUser() {
		int count = 0;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(account_id) as account_id FROM account WHERE NOT account_id = 1");
			if(rs.next()) {
				count = rs.getInt("account_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return count;
	}
	
	public int updateAccount(int id,String name, String email, String pass,String birthday, String address, String phone,String account_datemodifier, String image) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE account SET account_name = ?, account_email = ?, account_pass = ?, account_date = ?,account_address = ?, account_phone = ?,account_datemodifier = ?, account_image = ? WHERE account_id = ?");
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, pass);
			pst.setString(4, birthday);
			pst.setString(5, address);
			pst.setString(6, phone);
			pst.setString(7, account_datemodifier);
			pst.setString(8, image);
			pst.setInt(9, id);
			result = pst.executeUpdate() > 0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
	
	public int updatePassResetByEmail(String email, String reset_pass) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE account SET reset_pass = ? WHERE account_email = ?");
			pst.setString(1, reset_pass);
			pst.setString(2, email);
			result = pst.executeUpdate() > 0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
	
	public Account confirmPass(String email,String pass){
		Account account = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT account_email,reset_pass FROM account WHERE account_email = ? AND reset_pass = ?");
			pst.setString(1, email);
			pst.setString(2, pass);
			rs = pst.executeQuery();
			while(rs.next()) {
				account = new Account( rs.getString("account_email"),rs.getString("reset_pass"));
			}
		}catch(Exception e) {
				e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
			return account;
	}
	
	public int updatePass(String account_pass, String account_email) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE account SET account_pass = ?, reset_pass = ? WHERE account_email = ?");
			pst.setString(1, account_pass);
			pst.setString(2, "");
			pst.setString(3, account_email);
			result = pst.executeUpdate() > 0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
	
	public int delPass(String account_email) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE account SET reset_pass = ? WHERE account_email = ?");
			pst.setString(1, "");
			pst.setString(2, account_email);
			result = pst.executeUpdate() > 0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
	
	public boolean checkEmail(String email) {
		boolean result = true;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT account_email FROM account WHERE account_email = ?");
			pst.setString(1, email);
			rs = pst.executeQuery();
			result = rs.next()?true:false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return result;
	}
}
