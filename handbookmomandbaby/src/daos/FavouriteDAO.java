package daos;

import java.util.ArrayList;

import models.Favourite;
import utils.DBConnectionUtil;

public class FavouriteDAO extends AbstractDAO{
	public void addFavoủrite(String favourite_name, String favourite_image, int favourite_status,int menu_id,int listnews_id, int IDAccount) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("INSERT INTO favourite (favourite_name,favourite_image,favourite_status,menu_id,listnews_id,IDAccount) VALUES(?,?,?,?,?,?)");
			pst.setString(1, favourite_name);
			pst.setString(2, favourite_image);
			pst.setInt(3, favourite_status);
			pst.setInt(4, menu_id);
			pst.setInt(5, listnews_id);
			pst.setInt(6, IDAccount);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
	}
	
	public void updateFavoủrite(int favourite_status,int listnews_id, int IDAccount) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE favourite SET favourite_status = ? WHERE listnews_id = ? AND IDAccount = ?");
			pst.setInt(1, favourite_status);
			pst.setInt(2, listnews_id);
			pst.setInt(3, IDAccount);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
	}
	
	public Favourite checkFavourite(int listnews_id, int IDAccount) {
		Favourite favourite = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM favourite WHERE listnews_id = ? AND IDAccount = ?");
			pst.setInt(1, listnews_id);
			pst.setInt(2, IDAccount);
			rs = pst.executeQuery();
			if(rs.next()) {
				favourite =  new Favourite(rs.getInt("favourite_id"), 
															  rs.getString("favourite_name"), 
															  rs.getString("favourite_image"), 
															  rs.getInt("favourite_status"),
															  rs.getInt("menu_id"), 
															  rs.getInt("listnews_id"), 
															  rs.getInt("IDAccount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return favourite;
	}
	
	public ArrayList<Favourite> listFavourite(int IDAccount){
		ArrayList<Favourite> listFavourite = new ArrayList<Favourite>();
		Favourite favourite = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM favourite WHERE IDAccount = ? AND favourite_status = 1");
			pst.setInt(1, IDAccount);
			rs = pst.executeQuery();
			while(rs.next()) {
				favourite = new Favourite(rs.getInt("favourite_id"), 
															rs.getString("favourite_name"),
															rs.getString("favourite_image"), 
															rs.getInt("favourite_status"), 
															rs.getInt("menu_id"), 
															rs.getInt("listnews_id"), 
															rs.getInt("IDAccount"));
				listFavourite.add(favourite);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return listFavourite;
	}
	
	public int updateImage(String listnews_image, int IDAccount, int listnews_id) {
		int result = 0;
		con  =DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE favourite SET favourite_image = ? WHERE IDAccount = ? AND listnews_id = ?");
			pst.setString(1, listnews_image);
			pst.setInt(2, IDAccount);
			pst.setInt(3, listnews_id);
			result = pst.executeUpdate() > 0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
}
