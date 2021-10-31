package daos;

import java.util.ArrayList;

import models.Menu;
import utils.DBConnectionUtil;

public class MenuDAO extends AbstractDAO{
	public ArrayList<Menu> listMenuParent(){
		ArrayList<Menu> listMenuparent = new ArrayList<Menu>();
		Menu menu = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM menu WHERE parent_id = 0");
			while(rs.next()) {
				menu = new Menu(rs.getInt("menu_id"), 
											  rs.getString("menu_name"), 
											  rs.getInt("parent_id"));
				listMenuparent.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, st , con);}
		return listMenuparent;
	}
	
	public ArrayList<Menu> listMenuSon(){
		ArrayList<Menu> listMenuparent = new ArrayList<Menu>();
		Menu menu = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM menu WHERE parent_id != 0");
			while(rs.next()) {
				menu = new Menu(rs.getInt("menu_id"), 
											  rs.getString("menu_name"), 
											  rs.getInt("parent_id"));
				listMenuparent.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, st , con);}
		return listMenuparent;
	}
	
	public String addMenuParent(String name) {
		String result = "";
		try {
			con = DBConnectionUtil.getConnection();
			pst = con.prepareStatement("INSERT INTO menu(menu_name,parent_id) VALUES(?,0)");
			pst.setString(1, name);
			result = (pst.executeUpdate() > 0)?"1":"2";
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {DBConnectionUtil.close(pst, con);}
		return result;
	}
	
	public String addMenuSon(String name, int parent_id) {
		String result = "";
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("INSERT INTO menu(menu_name,parent_id) VALUES(?,?)");
			pst.setString(1, name);
			pst.setInt(2, parent_id);
			result = (pst.executeUpdate() > 0)?"3":"4";
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {DBConnectionUtil.close(pst, con);}
		return result;
	}
	
	public String menuName(int id) {
		String name = "";
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT DISTINCT menu.menu_name FROM menu INNER JOIN listnews ON menu.menu_id = listnews.menu_id AND listnews.listnews_id = ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				name = rs.getString("menu_name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return name;
	}
	
	public String newsName(int id) {
		String name = "";
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT listnews.listnews_name FROM menu INNER JOIN listnews ON menu.menu_id = listnews.menu_id AND listnews.listnews_id = ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				name = rs.getString("listnews_name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return name;
	}
	
	public int countMenuParent() {
		int count = 0;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(menu_id) as menu_id FROM menu WHERE parent_id = 0");
			if(rs.next()) {
				count = rs.getInt("menu_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return count;
	}
	
	public int countMenuChildren() {
		int count = 0;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(menu_id) as menu_id FROM menu WHERE parent_id != 0");
			if(rs.next()) {
				count = rs.getInt("menu_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return count;
	}
	
	public void delMenuParent(int menu_id,int parent_id) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("DELETE FROM menu WHERE menu_id = ? AND parent_id = ?");
			pst.setInt(1,menu_id);
			pst.setInt(2,parent_id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("DELETE FROM menu WHERE parent_id = ?");
			pst.setInt(1,menu_id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
	}
	
	public ArrayList<Menu> loadMenuParent(){
		ArrayList<Menu> listMenu = new ArrayList<Menu>();
		Menu menu = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM menu WHERE parent_id = 0");
			while(rs.next()) {
				menu = new Menu(rs.getInt("menu_id"), 
											  rs.getString("menu_name"), 
											  rs.getInt("parent_id"));
				listMenu.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(rs,st,con);}
		return listMenu;
	}
	
	public void delMenuChildren(int id) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("DELETE FROM menu WHERE menu_id = ?");
			pst.setInt(1,id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
	}
	
	public ArrayList<Menu> loadMenuChildren(){
		ArrayList<Menu> listMenu = new ArrayList<Menu>();
		Menu menu = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM menu WHERE parent_id != 0");
			while(rs.next()) {
				menu = new Menu(rs.getInt("menu_id"), 
											  rs.getString("menu_name"), 
											  rs.getInt("parent_id"));
				listMenu.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {DBConnectionUtil.close(rs,st,con);}
		return listMenu;
	}
}
